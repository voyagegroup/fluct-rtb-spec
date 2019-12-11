# fluct RTB 仕様 2.2

OpenRTB 2.5 に準拠しています。詳細は[IABのOpenRTB API Specification Version 2.5](https://www.iab.com/wp-content/uploads/2016/03/OpenRTB-API-Specification-Version-2-5-FINAL.pdf)をご確認ください

注意

この仕様書には不完全な点があるかもしれません。不備や不明瞭な点がありましたら、担当者か [developer@fluct.jp](mailto:developer@fluct.jp) に教えてください。また、一般的なRTBのプロトコルそのものに対する説明はありません。


## Table of Contents

* [0. 変更履歴](#0-変更履歴)
* [1. cookie sync](#1-cookie-sync)
* [2. リクエスト・レスポンスのエンコーディング](#2-リクエスト・レスポンスのエンコーディング)
* [3. リクエスト仕様](#3-リクエスト仕様)
  * [a. エンドポイントURL](#a-エンドポイントurl)
  * [b. bidリクエストパラメタ](#b-bidリクエストパラメタ)
    * [BidRequest Object (TopLevel)](#bidrequest-object-toplevel)
    * [imp Object](#imp-object)
    * [source Object](#source-object)
    * [site Object](#site-object)
    * [app Object](#app-object)
    * [user Object](#user-object)
    * [device Object](#device-object)
    * [banner Object](#banner-object)
    * [format Object](#format-object)
    * [video Object](#video-object)
    * [audio Object](#audio-object)
    * [native Object](#native-object)
    * [pmp Object](#pmp-object)
    * [deals Object](#deals-object)
* [4. レスポンス仕様](#4-レスポンス仕様)
  * [a. bidレスポンスパラメタ](#a-bidレスポンスパラメタ)
    * [BidResponse Object (TopLevel)](#bidresponse-object-toplevel)
    * [Seatbid Object](#seatbid-object)
    * [Bid Object](#bid-object)
    * [native response adm (serialized JSON object)](#native-response-adm-serialized-json-object)
  * [b. impressionまたは/clickビーコンの送信](#b-impressionまたはclickビーコンの送信)
    * [impressionビーコンを受けるエンドポイント](#impressionビーコンを受けるエンドポイント)
    * [impressionビーコンを送信するfluctのクライアント側](#impressionビーコンを送信するfluctのクライアント側)
    * [clickビーコンを受けるエンドポイント](#clickビーコンを受けるエンドポイント)
    * [clickビーコンを送信するfluctのクライアント側](#clickビーコンを送信するfluctのクライアント側)
    * [clickビーコン送信に用いられる手法について](#clickビーコン送信に用いられる手法について)
  * [c. マクロ置換](#c-マクロ置換)
  * [d. リダイレクタ仕様](#d-リダイレクタ仕様)
* [5. コード表](#5-コード表)
* [6. リクエスト／レスポンスサンプル](#6-リクエストレスポンスサンプル)
  * [Bid Request: web](#bid-request-web)
  * [Bid request: app](#bid-request-app)
  * [Bid request: native(icon)](#bid-request-native-icon)
  * [Bid request: native(main)](#bid-request-native-main)
  * [Bid request: pmp](#bid-request-pmp)
  * [Bid request: video](#bid-request-video)
  * [Bid request: video with end-card](#bid-request-video-with-end-card)
  * [Bid request: rewarded video](#bid-request-rewarded-video)
  * [Bid request: audio](#bid-request-audio)
  * [Bid request: with source](#bid-request-with-source)
  * [Bid response: web,app](#bid-response-webapp)
  * [Bid response: native(icon/main)](#bid-response-native-iconmain)
  * [Bid response: pmp](#bid-response-pmp)
  * [Bid response: video](#bid-response-video)
  * [Bid response: audio](#bid-response-audio)
  * [Bid response: with bundle](#bid-response-with-bundle)
  * [Bid response: with nurl and lurl](#bid-response-with-nurl-and-lurl)


## 0. 変更履歴

[CHANGELOG.md](CHANGELOG.md)

## 1. cookie sync

通常は以下のようなsyncを行なっていますが、他のフローも個別に対応可能です。（※オフラインのsyncは行なっていません。）

1. SSPが広告枠に、DSPのsync画像タグを配信する
2. DSPはsyncタグへのアクセスを受けた際に、SSPのsync URLにリダイレクト
3. DSPはsync URLにパラメタとしてIDを付与し、SSPへのID通知とする

DSPのsyncタグは事前にお知らせ下さい。（DSP作業）syncタグはイメージタグ・SSL通信に限定させていただきます。fluct側のsync URL は以下の例のようになります。

    https://cs.adingo.jp/sync/?from=[DSP_NAME]&id=[DSP_USER_ID]

DSP_NAMEはつなぎ込みに先立ってSSPが発行します（SSP作業）。お問い合わせ下さい。syncの有効期限はデフォルトでは30日ですが、expireパラメタを指定することにより任意の日数を指定できます。以下の例は90日有効なsyncになります。

    https://cs.adingo.jp/sync/?from=your_dsp&id=XXXXXX&expire=90

## 2. リクエスト・レスポンスのエンコーディング

bid リクエストは gzip 圧縮して送ることも可能で、その場合、リクエストの HTTP ヘッダには `Content-Encoding: gzip` が追加されます。 (デフォルト: 非圧縮)
リクエストの gzip 圧縮をご希望の際は、担当者までご連絡ください。

圧縮された bid レスポンスを受け取ることも可能で、取り扱い可能な圧縮アルゴリズムはリクエストの HTTP ヘッダ `Accept-Encoding` に追加されます。 (例: `Accept-Encoding: gzip`)
レスポンスを圧縮する場合、レスポンスの HTTP ヘッダ `Content-Encoding` で選択した圧縮アルゴリズムを明示してください。

## 3. リクエスト仕様

### a. エンドポイントURL

bid リクエストを送信すべきエンドポイントURLをSSPに通知して下さい。（DSP作業）

SSPは指定されたエンドポイントURLにbidリクエストをPOSTします。高速化のため、可能であれば HTTP keep aliveをサポートしてください。なお、httpsにも対応しております。また、個別のportの指定がある場合は、事前にご連絡ください。

### b. bidリクエストパラメタ

シリアライズフォーマット：JSONのみ

（※文字列型サポート以前のMessagePackを使用した接続実績がありますが、MessagePackは非推奨です。文字列型サポート版以降のMessagePackに対応する予定はありません。）

#### BidRequest Object (TopLevel)

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>オークション毎にSSP側でユニークに採番されるID
string</td>
  </tr>
  <tr>
    <td>imp</td>
    <td>required</td>
    <td>広告枠に関する情報</td>
  </tr>
  <tr>
    <td>source</td>
    <td>optional</td>
    <td>ヘッダー入札のような、広告エクスチェンジによる上流情報</td>
  </tr>
  <tr>
    <td>site</td>
    <td>optional</td>
    <td>掲載されるサイトに関する情報</td>
  </tr>
  <tr>
    <td>app</td>
    <td>optional</td>
    <td>掲載されるアプリに関する情報</td>
  </tr>
  <tr>
    <td>user</td>
    <td>optional</td>
    <td>ユーザに関する情報</td>
  </tr>
  <tr>
    <td>bcat</td>
    <td>required</td>
    <td>パブリッシャー側でブロックしたい広告のカテゴリ情報
string array</td>
  </tr>
  <tr>
    <td>badv</td>
    <td>optional</td>
    <td>パブリッシャー側でブロックしたい広告のドメイン情報
string array</td>
  </tr>
  <tr>
    <td>tmax</td>
    <td>optional</td>
    <td>オークションのタイムアウトの時間
120 は 120ms以内を意味します。
integer</td>
  </tr>
  <tr>
    <td>device</td>
    <td>optional</td>
    <td>デバイスに関する情報</td>
  </tr>
  <tr>
    <td>at</td>
    <td>optional</td>
    <td>1=ファーストプライスオークション, 2=セカンドプライスオークション integer</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>optional</td>
    <td>入札できる通貨 string array</td>
  </tr>
</table>


※ site、app いずれかは必須

#### imp Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>SSP側で採番したID
string</td>
  </tr>
  <tr>
    <td>tagid</td>
    <td>required</td>
    <td>SSP側で管理している広告枠を表すID
string
ex) 1234:987654321</td>
  </tr>
  <tr>
    <td>secure</td>
    <td>optional</td>
    <td>
      掲載面がhttpsページであるかを示す情報
      nonsecure=0, secure=1,
      integer
    </td>
  </tr>
  <tr>
    <td>banner</td>
    <td>optional</td>
    <td>banner に関する情報</td>
  </tr>
  <tr>
    <td>video</td>
    <td>optional</td>
    <td>video に関する情報</td>
  </tr>
  <tr>
    <td>pmp</td>
    <td>optional</td>
    <td>pmp に関する情報</td>
  </tr>
  <tr>
    <td>native</td>
    <td>optional</td>
    <td>native に関する情報</td>
  </tr>
  <tr>
    <td>instl</td>
    <td>optional</td>
    <td>掲載方法がインタースティシャルであるかを示す情報
インタースティシャルでない = 0, インタースティシャルである = 1</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>optional</td>
    <td>フロアプライス, float</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>optional</td>
    <td>フロアプライスの通貨, string</td>
  </tr>
  <tr>
    <td>ext.dfp_ad_unit_code</td>
    <td>optional, experimental</td>
    <td>Google AdManager経由の場合の、広告ユニットフルパス</td>
  </tr>
</table>


#### source Object

[Sellers.json](https://iabtechlab.com/sellers-json/), [OpenRTB SupplyChain オブジェクト](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md) に対応しています。

fluct社が公開している Sellers.json は https://adingo.jp/sellers.json を参照してください。

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>fd</td>
    <td>required</td>
    <td>integer. 上流で購入の意思決定がされる場合は <code>1</code>, それ以外は <code>0</code> となります。</td>
  </tr>
  <tr>
    <td>tid</td>
    <td>optional, experimental</td>
    <td>string. 上流でトランザクションIDが発番された場合そのIDを送信いたします。取得できない場合はBidRequest.idと同じものを設定します。</td>
  </tr>
  <tr>
    <td>ext.stype</td>
    <td>optional, experimental</td>
    <td>string. ヘッダ入札タイプ。内容はお問い合わせください。</td>
  </tr>
  <tr>
    <td>ext.schain</td>
    <td>optional</td>
    <td>[OpenRTB SupplyChain オブジェクト](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md)</td>
  </tr>
</table>


#### site Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>SSP側で管理してるサイトに関してのID
※広告枠IDはimp.tagidを参照
string</td>
  </tr>
  <tr>
    <td>cat</td>
    <td>optional</td>
    <td>サイトのカテゴリ
IAB のカテゴリに準拠
string array</td>
  </tr>
  <tr>
    <td>domain</td>
    <td>optional</td>
    <td>fluct社が登録している配信先のドメイン情報（静的）
string</td>
  </tr>
  <tr>
    <td>page</td>
    <td>required</td>
    <td>広告が掲載されたページのURL
string</td>
  </tr>
  <tr>
    <td>mobile</td>
    <td>optional</td>
    <td>レイアウトがモバイルデバイスに最適化されているか。 0=No, 1=Yes, integer</td>
  </tr>
  </tr>
  <tr>
    <td>publisher</td>
    <td>optional</td>
    <td>パブリッシャーに関する情報</td>
  </tr>
</table>


#### app Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>SSP側で管理してるアプリに関してのID
※広告枠IDはimp.tagidを参照
string</td>
  </tr>
  <tr>
    <td>cat</td>
    <td>optional</td>
    <td>アプリのカテゴリ
IAB のカテゴリに準拠
string array</td>
  </tr>
  <tr>
    <td>storeurl</td>
    <td>optional</td>
    <td>各store で利用されているURL
string</td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>optional</td>
    <td>プラットフォーム上でのアプリケーション識別子.
Androidではパッケージ名で、iOSでは数字のID。
(例) Android: "com.foo.mygame", iOS: "1234567890"
string</td>
  </tr>
  <tr>
    <td>publisher</td>
    <td>optional</td>
    <td>パブリッシャーに関する情報</td>
  </tr>
</table>


#### user Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>optional</td>
    <td>SSP側で管理しているユーザID
string</td>
  </tr>
  <tr>
    <td>buyeruid</td>
    <td>optional</td>
    <td>cookie sync したことで得た、
DSPで管理しているユーザID
string</td>
  </tr>
</table>


※ device.ifaを送る場合は、user.buyeruidは送らず、user.idにはdevice.ifaの値と同様の値が入ります

#### device Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>ua</td>
    <td>required</td>
    <td>ユーザーエージェント
string</td>
  </tr>
  <tr>
    <td>ip</td>
    <td>required</td>
    <td>IPアドレス
string</td>
  </tr>
  <tr>
    <td>ifa</td>
    <td>optional</td>
    <td>広告識別子情報（IDFA/ADID）
string</td>
  </tr>
  <tr>
    <td>lmt</td>
    <td>optional</td>
    <td>Limit Ad Tracking のステータス
integer</td>
  </tr>
  <tr>
    <td>dnt</td>
    <td>optional</td>
    <td>Do Not Track ヘッダのステータス
integer</td>
  </tr>
  <tr>
    <td>osv</td>
    <td>optional</td>
    <td>OSのバージョン string</td>
  </tr>
</table>


#### banner Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
  </tr>
    <td>format</td>
    <td>optional</td>
    <td>
      <a href="#format-object">フォーマットオブジェクト</a>の配列
    </td>
  <tr>
  </tr>
  <tr>
    <td>h</td>
    <td>optional</td>
    <td>バナーの高さ integer</td>
  </tr>
  <tr>
    <td>w</td>
    <td>optional</td>
    <td>バナーの横幅 integer</td>
  </tr>
  <tr>
    <td>pos</td>
    <td>required</td>
    <td>バナーの掲載位置
IABに準拠
但し、スマートフォンのオーバーレイ広告は 9 で送ります。
integer</td>
  </tr>
  <tr>
    <td>vcm</td>
    <td>optional</td>
    <td>
      imp.video.companionad の場合でのみ有効。
      0=concurrent,
      1=end-card,
      integer
    </td>
  </tr>
</table>


#### format Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>h</td>
    <td>required</td>
    <td>高さ integer</td>
  </tr>
  <tr>
    <td>w</td>
    <td>required</td>
    <td>幅 integer</td>
  </tr>
</table>


#### video Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>mimes</td>
    <td>required</td>
    <td>
      対応しているMIMEタイプ
      "video/mp4", “video/x-flv” 等
      string array
    </td>
  </tr>
  <tr>
    <td>pos</td>
    <td>optional</td>
    <td>
      動画の掲載位置 (IABに準拠。 但し、スマートフォンのオーバーレイは、 9 で送ります) integer
    </td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>optional</td>
    <td>
      動画の最短再生時間 (秒) integer
    </td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>optional</td>
    <td>
      動画の最長再生時間 (秒) integer
    </td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>optional</td>
    <td>
      対応している動画プロトコル
      1=VAST 1.0,
      2=VAST 2.0,
      3=VAST 3.0,
      4=VAST 1.0 Wrapper,
      5=VAST 2.0 Wrapper,
      6=VAST 3.0 Wrapper,
      7=VAST 4.0,
      8=VAST 4.0 Wrapper,
      integer array
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>optional</td>
    <td>
      ブロックされたクリエイティブ属性 (IAB に準拠) integer array
    </td>
  </tr>
  <tr>
    <td>h</td>
    <td>optional</td>
    <td>
      動画の高さ integer
      </td>
  </tr>
  <tr>
    <td>w</td>
    <td>optional</td>
    <td>
      動画の横幅 integer
    </td>
  </tr>
  <tr>
    <td>startdelay</td>
    <td>optional</td>
    <td>
      再生開始までの時間 (秒)
      0=pre-roll,
      &gt;0=mid-roll (指定される秒数後に再生される),
      -1=一般的な mid-roll,
      -2=post-roll,
      integer
    </td>
  </tr>
  <tr>
    <td>linearity</td>
    <td>optional</td>
    <td>
      リニアリティ
      1=in-stream,
      2=オーバーレイ,
      integer
    </td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>optional</td>
    <td>
      最小ビットレート (Kbps)
      integer
    </td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>optional</td>
    <td>
      最大ビットレート (Kbps)
      integer
    </td>
  </tr>
  <tr>
    <td>skip</td>
    <td>optional</td>
    <td>
      スキップ有無
      0=なし,
      1=あり,
      integer
    </td>
  </tr>
  <tr>
    <td>api</td>
    <td>optional</td>
    <td>
      対応しているAPIフレームワーク
      1=VPAID 1.0,
      2=VPAID 2.0,
      3=MRAID-1,
      4=ORMMA,
      5=MRAID-2,
      integer array
    </td>
  </tr>
  <tr>
    <td>placement</td>
    <td>optional</td>
    <td>
      配置方法
      1=in-stream (動画コンテンツの pre-roll, mid-roll, もしくは post-roll),
      2=in-banner (バナーの位置で再生される),
      5=インタースティシャル、フローティング (画面の一部もしくはすべてを覆い、再生中は継続して画面に表示される),
      imp.instl との組み合わせで全画面インタースティシャルと区別する,
      integer
    </td>
  </tr>
  <tr>
    <td>companionad</td>
    <td>optional</td>
    <td>
      コンパニオンアドがサポートされている場合、<a href="#banner-object">バナーオブジェクト</a>が入れられる
    </td>
  </tr>
</table>


#### audio Object

(Experimental)

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>mimes</td>
    <td>required</td>
    <td>
      対応しているMIMEタイプ "audio/mp4" 等 string array
    </td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>optional</td>
    <td>
      音声の最短再生時間 (秒) integer
    </td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>optional</td>
    <td>
      音声の最長再生時間 (秒) integer
    </td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>optional</td>
    <td>
      対応している音声プロトコル
        1=VAST 1.0,
        2=VAST 2.0,
        3=VAST 3.0,
        4=VAST 1.0 Wrapper,
        5=VAST 2.0 Wrapper,
        6=VAST 3.0 Wrapper,
        7=VAST 4.0,
        8=VAST 4.0 Wrapper,
        integer array
    </td>
  </tr>
  <tr>
    <td>startdelay</td>
    <td>optional</td>
    <td>
      再生開始までの時間 (秒)
      0=pre-roll,
      &gt;0=mid-roll (指定される秒数後に再生される),
      -1=一般的な mid-roll,
      -2=post-roll,
      integer
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>optional</td>
    <td>
      ブロックされたクリエイティブ属性 (IAB に準拠) integer array
    </td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>optional</td>
    <td>
      最小ビットレート (Kbps) integer
    </td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>optional</td>
    <td>
      最大ビットレート (Kbps) integer
    </td>
  </tr>
  <tr>
    <td>api</td>
    <td>optional</td>
    <td>
      対応しているAPIフレームワーク
      1=VPAID 1.0,
      2=VPAID 2.0,
      3=MRAID-1,
      4=ORMMA,
      5=MRAID-2,
      integer array
    </td>
  </tr>
  <tr>
    <td>feed</td>
    <td>optional</td>
    <td>
      フィードの種類
      1=音楽サービス,
      2=FM/AM放送,
      3=ポッドキャスト,
      integer
    </td>
  </tr>
  <tr>
    <td>stitched</td>
    <td>optional</td>
    <td>
      音声コンテンツに結合されるか
      0=no,
      1=yes,
      integer
    </td>
  </tr>
</table>


#### native Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>request</td>
    <td>required</td>
    <td>[Native Ad Request Markup Object](./native-ads-v1.ja.md)</td>
  </tr>
  <tr>
    <td>ver</td>
    <td>recommended</td>
    <td>string</td>
  </tr>
  <tr>
    <td>api</td>
    <td>optional</td>
    <td>
      対応しているAPIフレームワーク
      integer array
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>optional</td>
    <td>
      ブロックされたクリエイティブ属性 (IAB に準拠) integer array
    </td>
  </tr>
</table>


#### pmp Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>private_auction</td>
    <td>required</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>deals</td>
    <td>required</td>
    <td>object array</td>
  </tr>
</table>


#### deals Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>SSP側で発行したdeal ID, string</td>
  </tr>
  <tr>
    <td>at</td>
    <td>optional</td>
    <td>1=ファーストプライスオークション, 2=セカンドプライスオークション, 3=固定価格, integer</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>optional</td>
    <td>at が 1, 2 の場合はフロアプライス、 3 の場合はディールの固定価格, float</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>optional</td>
    <td>bidfloor の通貨, string</td>
  </tr>
  <tr>
    <td>wseat</td>
    <td>optional</td>
    <td>バイヤーシートのホワイトリスト, string array</td>
  </tr>
  <tr>
    <td>wadomain</td>
    <td>optional</td>
    <td>広告主ドメインのホワイトリスト, string array</td>
  </tr>
</table>


#### Publisher Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>SSP側で管理してるパブリッシャーに関してのID
string</td>
  </tr>
</table>


## 4. レスポンス仕様

### a. bidレスポンスパラメタ

DSPはJSONフォーマットで入札情報をシリアライズします。

入札しない場合はHTTP 204 No Contentとしてください。

#### BidResponse Object (TopLevel)

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>string</td>
    <td>レスポンスのID</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>required</td>
    <td>string</td>
    <td>入札金額の通貨コード ISO-4217</td>
  </tr>
  <tr>
    <td>seatbid</td>
    <td>required</td>
    <td>array of seatbid object</td>
    <td></td>
  </tr>
</table>

#### seatbid Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>bid</td>
    <td>required</td>
    <td>array of bid object</td>
    <td></td>
  </tr>
</table>

#### bid Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>impid</td>
    <td>required</td>
    <td>string</td>
    <td>入札対象のBidRequest.imp.id</td>
  </tr>
  <tr>
    <td>price</td>
    <td>required</td>
    <td>float</td>
    <td>入札金額</td>
  </tr>
  <tr>
    <td>adm</td>
    <td>required</td>
    <td>string</td>
    <td>広告表示データ. 広告フォーマットにより内容の形式は異なります。レスポンスサンプルを参照してください。</td>
  </tr>
  <tr>
    <td>adomain</td>
    <td>optional (recommended)</td>
    <td>array of string</td>
    <td>ブロックリスト確認用の広告主ドメイン</td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>optional (recommended)</td>
    <td>array of string</td>
    <td>
      プラットフォーム上でのアプリケーション識別子.
      Androidではパッケージ名で、iOSでは数字のID。
      (例) Android: "com.foo.mygame", iOS: "1234567890"
    </td>
  </tr>
  <tr>
    <td>crid</td>
    <td>optional</td>
    <td>string</td>
    <td>広告クリエイティブID</td>
  </tr>
  <tr>
    <td>dealid</td>
    <td>optional</td>
    <td>string</td>
    <td>pmp dealへの入札の場合必須項目. 入札対象のBidRequest.imp.pmp.deal.id</td>
  </tr>
  <tr>
    <td>nurl</td>
    <td>optional</td>
    <td>string</td>
    <td>
      win通知URL.
      入札が勝利した際に呼び出される。
      約定・表示・請求を通知するものではなく、オークションでの勝利を通知するもの。
      adm と同様の置換マクロを含めてもよい。
    </td>
  </tr>
  <tr>
    <td>lurl</td>
    <td>optional</td>
    <td>string</td>
    <td>
      loss通知URL.
      入札が勝利しなかった際に呼び出される。
      adm と同様のマクロ置換が行われ、 ${AUCTION_PRICE} には約定価格 (通知可能な場合のみ)、 ${AUCTION_LOSS} には loss reason code が通知される。
      loss reason code については、 IAB OpenRTB 2.5 仕様 5.25 Loss Reason Codes を参照してください。
    </td>
  </tr>
</table>


### b. impressionまたは/clickビーコンの送信

fluctのクライアント制御スクリプトからビーコンを送信に関して, 各エンドポイントは以下の仕様に準拠しているという前提で送信を行います.

#### impressionビーコンを受けるエンドポイント

* HTTPS (TLS1.2以降)での受信に対応している

* GETメソッドでの受信に対応していること

* XMLHttpRequestではなくimgタグのsrc属性にURLを設定することでリクエストを行います。

#### impressionビーコンを送信するfluctのクライアント側

以下の条件で送信を行います.

<table>
  <tr>
    <td>送信先のURLエンドポイント</td>
    <td>bidレスポンス中にて指定されたURLエンドポイント</td>
  </tr>
  <tr>
    <td>送信に用いるHTTPメソッド</td>
    <td>GET</td>
  </tr>
</table>

#### clickビーコンを受けるエンドポイント

* HTTPS (TLS1.2以降)での受信に対応している

* POSTメソッドでの受信に対応している

* Cross-Origin Resource Sharingに対応しており, Cross-OriginでのXMLHttpRequestを適切に受信できる

    * Cross-Origin Resource Sharingに関しては [http://www.w3.org/TR/cors/](http://www.w3.org/TR/cors/)[ にて定義されている仕様に基づく](http://www.w3.org/TR/cors/)

#### clickビーコンを送信するfluctのクライアント側

以下の条件で送信を行います.

<table>
  <tr>
    <td>送信先のURLエンドポイント</td>
    <td>bidレスポンス中にて指定されたURLエンドポイント</td>
  </tr>
  <tr>
    <td>送信に用いるHTTPメソッド</td>
    <td>POST</td>
  </tr>
  <tr>
    <td>Originヘッダ</td>
    <td>送信元のorigin</td>
  </tr>
  <tr>
    <td>Access-Control-Allow-Credentials ヘッダ</td>
    <td>true</td>
  </tr>
  <tr>
    <td>Acceptヘッダ</td>
    <td> */*</td>
  </tr>
</table>

#### clickビーコン送信に用いられる手法について

* 実際に広告が表示されるブラウザ側から送信する前提となっているため, XMLHttpRequestによるCross-Origin Requestが用いられます.
* 一部の対応環境では, より確実なビーコン送信のため, [http://www.w3.org/TR/beacon/](http://www.w3.org/TR/beacon/) にて定義された navigator.sendBeacon()による送信が行われる場合があります.


### c. マクロ置換

SSPは広告HTML(adm)内の以下の文字列を置換したうえで配信します。iab定義の必要な項目をお申し付けください。（他にも必要な項目があれば対応致します）

<table>
  <tr>
    <th>マクロ</th>
    <th>詳細</th>
  </tr>
  <tr>
    <td>${AUCTION_PRICE} </td>
    <td>暗号化された約定金額。クリエイティブ審査プロセスによる描画の場合、<code>AUDIT</code> という文字列に置換されます。 </td>
  </tr>
  <tr>
    <td>${CLICK_URL_ENC} </td>
    <td>URLエンコードされたリダイレクタURL </td>
  </tr>
  <tr>
    <td>${IS_PREVIEW} </td>
    <td>クリエイティブ審査プロセスによる描画の場合 <code>1</code> に、通常は <code>0</code> に置換されます。 </td>
  </tr>
</table>


暗号化方式（アルゴリズム、鍵長、暗号利用モード）については、事前にSSPとDSPが協議して決定します。（例：CFB 3DES + いわゆるWeb セーフ Base64など）

暗号鍵は決定した方式に基づいて、SSPが発行します。（SSP作業）

### d. リダイレクタ仕様

弊社リダイレクタ仕様

例： http://rd.adingo.jp/?p=rKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds&v=e0e8nlDL6O0.&k=1&guid=ON&u=

このようなURLになっています。 最後の u= に、ランディングページのURLを渡すと、そこにリダイレクトします。

※オープンリダイレクタになっていますが、広告のクリック計測サーバにおけるオープンリダイレクタは脆弱性とはみなさないという立場を弊社は取っています。

#### ■方法A)

ビッドレスポンス内で、弊社のリダイレクタURLに、ランディングページURLを渡していただく

遷移：

広告ページ → 御社リダイレクタ → 弊社リダイレクタ → ランディングページ

1. ビッドレスポンス内のリンク先を以下のようにしていただく（SSP側ランディングURLを渡すパラメタを例えば r としています。以下同様）

```html
<a href="http://dsp.example.com/?id=12345678&r=${CLICK_URL_ENC}___ここにランディングURLを2重URLエンコードして埋め込む___"><img...></a>

例： <a href="http://dsp.example.com/?id=12345678&r=${CLICK_URL_ENC}http%253A%252F%252Fexample.com"><img...></a>
```

2. 弊社側のマクロ展開により、以下のようになる（ランディングURLを[ http://lp.example.net](http://lp.example.net/) とします）

```html
<a href="http://dsp.example.com/?id=12345678&r=http%3A%2F%2Frd.adingo.jp%2F%3Fp%3DrKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds%26v%3De0e8nlDL6O0.%26k%3D1%26guid%3DON%26u%3Dhttp%253A%252F%252Flp.example.net"><img...></a>
```

3. 御社リダイレクタで、パラメタ r で指定された弊社リダイレクタへリダイレクト

    http://rd.adingo.jp/?p=rKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds&v=e0e8nlDL6O0.&k=1&guid=ON&u=http%3A%2F%2Flp.example.net

#### ■方法B)

御社のリダイレクタで、弊社のリダイレクタURLに、ランディングページURLを渡していただく

遷移：

広告ページ → 御社リダイレクタ → 弊社リダイレクタ → ランディングページ

1. ビッドレスポンス内のリンク先を以下のようにしていただく

```html
<a href="http://dsp.example.com/?id=12345678&r=${CLICK_URL_ENC}"><img

...></a>
```

2. 弊社マクロ展開により、以下のようになる

```html
<a href="http://dsp.example.com/?id=12345678&r=http%3A%2F%2Frd.adingo.jp%2F%3Fp%3DrKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds%26v%3De0e8nlDL6O0.%26k%3D1%26guid%3DON%26u%3D"><img...></a>
```

3. 御社リダイレクタで、パラメタ r で指定された弊社リダイレクタに、実際のランディングURLをURLエンコードして付与する

    http://rd.adingo.jp/?p=rKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds&v=e0e8nlDL6O0.&k=1&guid=ON&u=http%3A%2F%2Flp.example.net

## 5. コード表


## 6. リクエスト／レスポンスサンプル

### Bid request: web

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "banner": {
        "h": 250,
        "w": 300,
        "pos": 9,
        "format": [{"h":250, "w": 300}]
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB19" ],
    "domain": "magazine.fluct.jp",
    "page": "https://magazine.fluct.jp/category/news",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "203.0.113.123"
  },
  "at": 2
}
```

### Bid request: app

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "banner": {
        "h": 50,
        "w": 320,
        "pos": 9,
        "format": [{"h":50, "w": 320}]
      }
    }
  ],
  "app": {
    "id": "1000012671",
    "cat": [ "IAB1" ],
    "bundle": "123456789",
    "storeurl": "https://itunes.apple.com/id123456789",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "2fac1234-31f8-11b4-a222-08002b34c003"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238",
    "ip": "203.0.113.123",
    "ifa": "2fac1234-31f8-11b4-a222-08002b34c003",
    "lmt": 0,
    "osv": "9.3.1"
  },
  "at": 2
}
```

### Bid request: native (icon)

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "native": {
        "ver": "1.0",
        "request":"{\"native\":{\"assets\": [{\"id\": 1,\"title\": {\"len\": 20}},{\"id\": 2,\"img\": {\"hmin\": 160,\"type\": 1,\"wmin\": 160}},{\"id\": 3,\"data\": {\"len\": 30,\"type\": 1}},{\"data\": {\"len\": 50,\"type\": 2},\"id\": 4}],\"layout\": 3}}"
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB11" ],
    "domain": "fluct.jp",
    "page": "http://fluct.jp/hoge.html",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238",
    "ip": "203.0.113.123"
  },
  "at": 2
}
```

### Bid request: native (main)

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "native": {
        "ver": "1.0",
        "request":"{\"native\":{\"assets\": [{\"id\": 1,\"title\": {\"len\": 20}},{\"id\": 2,\"img\": {\"hmin\": 320,\"type\": 3,\"wmin\":640}},{\"id\": 3,\"data\": {\"len\": 30,\"type\": 1}},{\"data\": {\"len\": 50,\"type\": 2},\"id\": 4}],\"layout\": 3}}"
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB19" ],
    "domain": "magazine.fluct.jp",
    "page": "https://magazine.fluct.jp/category/news",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238",
    "ip": "203.0.113.123"
  },
  "at": 2
}
```

### Bid request: pmp

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "banner": {
        "h": 50,
        "w": 320,
        "pos": 9
      },
      "pmp":{
        "private_auction": 1,
        "deals": [{
          "id":"AAAA-jndf98d9-dalda"
        }]
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB19" ],
    "domain": "magazine.fluct.jp",
    "page": "https://magazine.fluct.jp/category/news",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "203.0.113.123",
    "ifa": "2fac1234-31f8-11b4-a222-08002b34c003",
    "lmt": 0
  },
  "at": 2
}
```

### Bid request: video

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "video": {
        "mimes": [ "video/mp4" ],
        "minduration": 5,
        "maxduration": 60,
        "protocols": [ 2, 3, 5, 6 ],
        "pos": 1,
        "linearity": 1,
        "placement": 2
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB19" ],
    "domain": "magazine.fluct.jp",
    "page": "https://magazine.fluct.jp/category/news",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "203.0.113.123"
  },
  "at": 2
}
```

### Bid request: video with end-card

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "istl": 1,
      "video": {
        "api": [ 3, 5 ],
        "mimes": [ "video/mp4" ],
        "minduration": 5,
        "maxduration": 60,
        "protocols": [ 2, 3, 5, 6 ],
        "pos": 1,
        "linearity": 1,
        "placement": 5,
        "companionad": [
          {
            "api": [ 3, 5 ],
            "vcm": 1
          }
        ]
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB19" ],
    "domain": "magazine.fluct.jp",
    "page": "https://magazine.fluct.jp/category/news",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "203.0.113.123"
  },
  "at": 2
}
```

### Bid request: rewarded video

リワード付き動画広告にいておいては `imp.video.ext.videotype = "rewarded"` 等でそれを明示することが可能です。

```js
{
  "id": "6d7d1950-f26b-4955-8ed7-32d1c237cf6e",
  "imp": [
    {
      "id": "a0ce9847-6bee-475b-9402-62a15f466d3e",
      "tagid": "21145:1000124351",
      "secure": 1,
      "instl": 1,
      "video": {
        "api": [
          5
        ],
        "companionad": [
          {
            "api": [
              5
            ],
            "vcm": 1
          }
        ],
        "ext": {
          "videotype": "rewarded"
        },
        "linearity": 1,
        "maxbitrate": 1500,
        "maxduration": 30,
        "mimes": [
          "video/mp4",
          "video/x-m4v",
          "video/quicktime",
          "video/avi",
          "video/3gpp2",
          "video/3gpp"
        ],
        "minbitrate": 300,
        "minduration": 0,
        "placement": 5,
        "pos": 9,
        "protocols": [
          3,
          6
        ],
        "skip": 0,
        "startdelay": 0
      },
      "bidfloor": 1.0,
      "bidfloorcur": "JPY",
      "ext": {},
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      }
    }
  ],
  "app": {
    "bundle": "956084814",
    "cat": [
      "IAB1"
    ],
    "id": "1000019447",
    "name": "rewarded video test",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "14208",
      "name": ""
    },
    "sectioncat": [],
    "storeurl": "https://itunes.apple.com/jp/app/%E7%AF%80%E7%B4%84-%E9%80%9A%E4%BF%A1%E9%87%8F%E3%83%81%E3%82%A7%E3%83%83%E3%82%AB%E3%83%BC-%E3%81%B4%E3%82%88%E3%83%91%E3%82%B1/id956084814?mt=8"
  },
  "at": 2,
  "badv": [],
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "0",
    "devicetype": 4,
    "dnt": 0,
    "geo": {
      "country": "JPN"
    },
    "ifa": "FBBE5BA3-4C89-4AD5-9056-F9D0E6D15760",
    "ip": "220.110.139.200",
    "ipv6": "",
    "js": 1,
    "language": "en",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "12.2",
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"
  },
  "source": {},
  "tmax": 120,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "FBBE5BA3-4C89-4AD5-9056-F9D0E6D15760"
  }
}
```

### Bid request: audio

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "audio": {
        "mimes": [ "audio/mp4" ],
        "minduration": 5,
        "maxduration": 60,
        "protocols": [ 2, 3, 5, 6 ],
        "api": [],
        "feed": 3,
        "stitched": 1
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB19" ],
    "domain": "magazine.fluct.jp",
    "page": "https://magazine.fluct.jp/category/news",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "203.0.113.123"
  },
  "at": 2
}
```

### Bid request: with source

Google EBDA transaction example

```json
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "source": {
    "fd": 1,
    "tid": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
    "ext": {
      "schain": {
        "complete": 1,
        "nodes": [
          {
            "asi": "google.com",
            "ext": {},
            "hp": 1,
            "sid": "pub-8141000000000000"
          },
          {
            "asi": "adingo.jp",
            "ext": {},
            "hp": 1,
            "rid": "3e103453-dd65-4c8f-806e-d28919e9bae3",
            "sid": "12345"
          }
        ],
        "ver": "1.0"
      },
      "stype": "EB"
    }
  },
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 1,
      "banner": {
        "h": 250,
        "w": 300,
        "pos": 9
      },
      "bidfloor": 10.0,
      "bidfloorcur": "JPY",
      "ext": {
        "dfp_ad_unit_code": "/62532913/s_fluct.test_336x280"
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB19" ],
    "domain": "magazine.fluct.jp",
    "page": "https://magazine.fluct.jp/category/news",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "AABBCCDD12345"
  },
  "bcat": [ "IAB25", "IAB26" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "203.0.113.123"
  },
  "at": 1
}
```

fluct direct selling publisher example

```json
{
  "at": 2,
  "badv": [],
  "bapp": [],
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "0",
    "connectiontype": 0,
    "devicetype": 4,
    "dnt": 0,
    "geo": {
      "country": "JPN"
    },
    "ifa": "",
    "ip": "220.110.1.1",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "PLUS",
    "os": "Android",
    "osv": "7.0",
    "ua": "Mozilla/5.0 (Linux; Android 7.0; PLUS Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36"
  },
  "id": "d6c4c590-3f89-4e96-a9dd-d52cbcf70459",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
        "btype": [],
        "ext": {},
        "format": [
          {
            "h": 100,
            "w": 320
          }
        ],
        "h": 100,
        "pos": 9,
        "w": 320
      },
      "ext": {},
      "id": "38a9c2a1-62db-4e49-bf42-8c5de9672cf0",
      "instl": 0,
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "2500:1000030000"
    }
  ],
  "site": {
    "cat": [],
    "domain": "magazine.fluct.jp",
    "id": "1000001000",
    "mobile": 1,
    "name": "fluct magazine",
    "page": "https://magazine.fluct.jp/",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "19601",
      "name": ""
    },
    "ref": "",
    "sectioncat": []
  },
  "source": {
    "ext": {
      "schain": {
        "complete": 1,
        "nodes": [
          {
            "asi": "adingo.jp",
            "ext": {},
            "hp": 1,
            "rid": "d6c4c590-3f89-4e96-a9dd-d52cbcf70459",
            "sid": "19601"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "d6c4c590-3f89-4e96-a9dd-d52cbcf70459"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "fd159faf-5d64-4831-8d81-000000000000",
    "ext": {},
    "id": "389ae8ed80e820e7876989893c44370010c1f03f"
  }
}
```

### Bid response: web/app

```js
{
    "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
    "cur": "JPY",
    "seatbid": [{
        "bid": [{
            "impid": "aud384920dieksjvpowlek231f9d8umxnd87ytgs",
            "price": 50,
            "crid": "12345",
            "adm": "<iframe width=\"468\" height=\"60\" marginwidth=\"0\" marginheight=\"0\" hspace=\"0\" vspace=\"0\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\" src=\"http://example.net/imp/${AUCTION_PRICE}/${CLICK_URL_ENC}\"></iframe>",
            "adomain": ["adomain.com"]
        }]
    }]
}
```

### Bid response: native (icon/main)

```js
{
 "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
 "cur": "JPY",
  "seatbid": [{
    "bid": [{
      "impid": "aud384920dieksjvpowlek231f9d8umxnd87ytgs",
      "price": 50,
      "crid": "12345",
      "adm": "{\"native\":{\"optouturl\":\"https://dsp.com/optout/\",\"link\":{\"url\":\"http:example.com/click\"},\"imptrackers\":[\"http:example.com/imp/a\",\"http:example.com/imp/b\"],\"assets\":[{\"id\": 1,\"title\":{\"text\":\"タイトルテキスト\"}},{\"img\":{\"url\":\"https://example.com/nativeImage.jpg\",\"w\": 160,\"h\": 160},\"id\": 2},{\"id\": 3,\"data\":{\"value\":\"株式会社fluct\"}},{\"id\": 4,\"data\":{\"value\":\"広告の説明文、fluctは日本で最大手のSSPです。\"}}]}}"
    }]
  }]
}
```

### Bid response: pmp

```js
{
    "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
    "cur": "JPY",
    "seatbid": [{
        "bid": [{
            "impid": "aud384920dieksjvpowlek231f9d8umxnd87ytgs",
            "price": 50,
            "crid": "12345",
            "adm": "<iframe width=\"468\" height=\"60\" marginwidth=\"0\" marginheight=\"0\" hspace=\"0\" vspace=\"0\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\" src=\"http://example.net/imp/${AUCTION_PRICE}/${CLICK_URL_ENC}\"></iframe>",
            "dealid": "AAAA-jndf98d9-dalda"
        }]
    }]
}
```

### Bid response: video

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "cur": "JPY",
  "seatbid": [{
    "bid": [{
        "impid": "1",
        "price": 5000,
        "crid": "12345",
        "adm": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><VAST version=\"3.0\"><Ad id=\"5d1bbb49009b\"><Wrapper><VASTAdTagURI><![CDATA[http://example.net/vast/${AUCTION_PRICE}/${CLICK_URL_ENC}]]></VASTAdTagURI><Impression><![CDATA[http://example.net/impression/${AUCTION_PRICE}/${CLICK_URL_ENC}]]></Impression><Creatives></Creatives></Wrapper></Ad></VAST>",
        "adomain": ["adomain.com"]
    }]
  }]
}
```

### Bid response: audio

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "cur": "JPY",
  "seatbid": [{
    "bid": [{
        "impid": "1",
        "price": 5000,
        "crid": "12345",
        "adm": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><VAST version=\"3.0\"><Ad id=\"5d1bbb49009b\"><Wrapper><VASTAdTagURI><![CDATA[http://example.net/vast/${AUCTION_PRICE}/${CLICK_URL_ENC}]]></VASTAdTagURI><Impression><![CDATA[http://example.net/impression/${AUCTION_PRICE}/${CLICK_URL_ENC}]]></Impression><Creatives></Creatives></Wrapper></Ad></VAST>",
        "adomain": ["adomain.com"]
    }]
  }]
}
```

### Bid response: with bundle

```js
{
  "cur": "USD",
  "id": "11910673-3de7-4385-b5f0-2fb7035a1a68",
  "seatbid": [
    {
      "bid": [
        {
          "adm": "<script src=\"https://example.net/adm?price=${AUCTION_PRICE}\"></script>",
          "bundle": "net.example.app",
          "crid": "80095",
          "h": 250,
          "id": "1",
          "impid": "cd793387-5dfd-4c7f-9665-666f9070c25c",
          "price": 1.2345,
          "w": 300
        }
      ]
    }
  ]
}
```

### Bid response: with nurl and lurl

```js
{
  "cur": "USD",
  "id": "11910673-3de7-4385-b5f0-2fb7035a1a68",
  "seatbid": [
    {
      "bid": [
        {
          "adm": "<script src=\"https://example.net/adm?price=${AUCTION_PRICE}\"></script>",
          "adomain": [
            "adomain.com"
          ],
          "bundle": "",
          "crid": "80095",
          "h": 250,
          "id": "1",
          "impid": "cd793387-5dfd-4c7f-9665-666f9070c25c",
          "lurl": "https://example.net/loss?code=${AUCTION_LOSS}&auction_id=${AUCTION_ID}&clearing_price=${AUCTION_PRICE}",
          "nurl": "https://example.net/win?code=${AUCTION_LOSS}&auction_id=${AUCTION_ID}&clearing_price=${AUCTION_PRICE}",
          "price": 1.2345,
          "w": 300
        }
      ]
    }
  ]
}
```
