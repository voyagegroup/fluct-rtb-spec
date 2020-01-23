# fluct RTB 仕様 2.2

OpenRTB 2.5 に準拠しています。詳細は[IABのOpenRTB API Specification Version 2.5](https://www.iab.com/wp-content/uploads/2016/03/OpenRTB-API-Specification-Version-2-5-FINAL.pdf)をご確認ください

注意

この仕様書には不完全な点があるかもしれません。不備や不明瞭な点がありましたら、担当者か [developer@fluct.jp](mailto:developer@fluct.jp) に教えてください。また、一般的なRTBのプロトコルそのものに対する説明はありません。


## Table of Contents

* [0. 変更履歴](#0-変更履歴)
* [1. cookie sync](#1-cookie-sync)
* [2. リクエスト・レスポンスのエンコーディング](#2-リクエストレスポンスのエンコーディング)
* [3. リクエスト仕様](#3-リクエスト仕様)
  * [a. エンドポイントURL](#a-エンドポイントurl)
  * [b. OpenRTB バージョン HTTP ヘッダ](#b-openrtb-バージョン-http-ヘッダ)
  * [c. bidリクエストパラメタ](#c-bidリクエストパラメタ)
    * [BidRequest Object (TopLevel)](#bidrequest-object-toplevel)
    * [imp Object](#imp-object)
    * [source Object](#source-object)
    * [site Object](#site-object)
    * [app Object](#app-object)
    * [user Object](#user-object)
    * [device Object](#device-object)
    * [geo Object](#geo-object)
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
* [6. リクエスト／レスポンス例](#6-リクエストレスポンス例)
  * [リクエスト例](#リクエスト例)
  * [レスポンス例](#レスポンス例)


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

### b. OpenRTB バージョン HTTP ヘッダ

準拠している OpenRTB バージョンは、下記 bid リクエスト HTTP ヘッダで送信されます。

    X-OpenRTB-Version: 2.5

このバージョンは `<メジャー>.<マイナー>` 形式で、パッチバージョンは含まれません。

fluct では後方互換性のある OpenRTB 2 マイナーバージョンの進行に追随し、それに伴い HTTP ヘッダ中のバージョンも更新されます。

### c. bidリクエストパラメタ

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
    <td><a href="https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md">OpenRTB SupplyChain オブジェクト</a></td>
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
    <td>geo</td>
    <td>optional</td>
    <td>
      <a href="#geo-object">geo object</a>
    </td>
  </tr>
  <tr>
    <td>ip</td>
    <td>required</td>
    <td>IPv4 アドレス string</td>
  </tr>
  <tr>
    <td>ipv6</td>
    <td>optional</td>
    <td>IPv6 アドレス string</td>
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


#### geo Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>lat</td>
    <td>optional</td>
    <td>緯度; -90.0~90.0 で、負は南; float</td>
  </tr>
  <tr>
    <td>lon</td>
    <td>optional</td>
    <td>経度; -180.0~180.0 で、負は西; float</td>
  </tr>
  <tr>
    <td>type</td>
    <td>optional</td>
    <td>位置情報の由来; 1=GPS, 2=IP address, 3=ユーザの提供による; integer</td>
  </tr>
  <tr>
    <td>accuracy</td>
    <td>optional</td>
    <td>精度 (メートル); integer</td>
  </tr>
  <tr>
    <td>ipservice</td>
    <td>optional</td>
    <td>IPアドレス由来の位置情報の場合、その提供元; 1=ip2location, 2=Neustar, 3=MaxMind, 4=NetAcuity; integer</td>
  </tr>
  <tr>
    <td>country</td>
    <td>optional</td>
    <td>国コード (ISO 3166-1 alpha-3); string</td>
  </tr>
  <tr>
    <td>region</td>
    <td>optional</td>
    <td>地域コード (ISO 3166-2); 米国の場合のみ2文字州コード; string</td>
  </tr>
  <tr>
    <td>metro</td>
    <td>optional</td>
    <td>Google metro code; string</td>
  </tr>
  <tr>
    <td>city</td>
    <td>optional</td>
    <td>都市名; string</td>
  </tr>
  <tr>
    <td>zip</td>
    <td>optional</td>
    <td>郵便番号; string</td>
  </tr>
  <tr>
    <td>utcoffset</td>
    <td>optional</td>
    <td>UTC との時差 (分); integer</td>
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
      <a href="#format-object">format object</a>の配列
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
      コンパニオンアドがサポートされている場合、<a href="#banner-object">banner object</a>が入れられる
    </td>
  </tr>
</table>


#### audio Object

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
    <td><a href="native-ads-v1.ja.md">Native Ad Request Markup Object</a></td>
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


## 6. リクエスト／レスポンス例

### リクエスト例

[version2.req-examples.md](./version2.req-examples.md) を参照してください。

### レスポンス例

[version2.res-examples.md](./version2.res-examples.md) を参照してください。
