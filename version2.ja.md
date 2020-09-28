# fluct RTB 仕様 2.2

OpenRTB 2.5 に準拠しています。詳細は[IABのOpenRTB API Specification Version 2.5](https://www.iab.com/wp-content/uploads/2016/03/OpenRTB-API-Specification-Version-2-5-FINAL.pdf)をご確認ください

### 注意

この仕様書には不完全な点があるかもしれません。不備や不明瞭な点がありましたら、担当者か [developer@fluct.jp](mailto:developer@fluct.jp) に教えてください。また、一般的なRTBのプロトコルそのものに対する説明はありません。


## Table of Contents

* [0. 変更履歴](#0-変更履歴)
* [1. cookie sync](#1-cookie-sync)
* [2. リクエスト・レスポンスのエンコーディング](#2-リクエストレスポンスのエンコーディング)
  * [a. リクエストのエンコーディング](#a-リクエストのエンコーディング)
  * [b. レスポンスのエンコーディング](#b-レスポンスのエンコーディング)
* [3. リクエスト仕様](#3-リクエスト仕様)
  * [a. エンドポイントURL](#a-エンドポイントurl)
  * [b. OpenRTB バージョン HTTP ヘッダ](#b-openrtb-バージョン-http-ヘッダ)
  * [c. bidリクエストパラメタ](#c-bidリクエストパラメタ)
    * [Bid Request Object (Top Level)](#bid-request-object-top-level)
    * [imp Object](#imp-object)
    * [source Object](#source-object)
    * [site Object](#site-object)
    * [app Object](#app-object)
    * [publisher Object](#publisher-object)
    * [user Object](#user-object)
    * [device Object](#device-object)
    * [geo Object](#geo-object)
    * [banner Object](#banner-object)
    * [format Object](#format-object)
    * [video Object](#video-object)
    * [audio Object](#audio-object)
    * [native Object](#native-object)
    * [pmp Object](#pmp-object)
    * [deal Object](#deal-object)
    * [skadn Request Object](#skadn-request-object)
* [4. レスポンス仕様](#4-レスポンス仕様)
  * [a. bidレスポンスパラメタ](#a-bidレスポンスパラメタ)
    * [Bid Response Object (Top Level)](#bid-response-object-top-level)
    * [seatbid Object](#seatbid-object)
    * [bid Object](#bid-object)
    * [skadn Response Object](#skadn-response-object)
  * [b. impressionまたは/clickビーコンの送信](#b-impressionまたはclickビーコンの送信)
    * [impressionビーコンを受けるエンドポイント](#impressionビーコンを受けるエンドポイント)
    * [impressionビーコンを送信するfluctのクライアント側](#impressionビーコンを送信するfluctのクライアント側)
    * [clickビーコンを受けるエンドポイント](#clickビーコンを受けるエンドポイント)
    * [clickビーコンを送信するfluctのクライアント側](#clickビーコンを送信するfluctのクライアント側)
    * [clickビーコン送信に用いられる手法について](#clickビーコン送信に用いられる手法について)
  * [c. マクロ置換](#c-マクロ置換)
  * [d. CLICK_URL_ENC マクロ廃止について](#d-click_url_enc-マクロ廃止について)
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

DSPとfluct間でのHTTPトラフィックを最小限に抑えるため、ビッドリクエスト・ビッドレスポンス **両方** の圧縮を **推奨** しています。

### a. リクエストのエンコーディング

ビッドリクエストをgzip圧縮することが可能です。
リクエストのgzip圧縮をご希望の際は、担当者までご連絡ください。

リクエスト本文がgzip圧縮されている場合、以下のヘッダが追加されます:

    Content-Encoding: gzip

### b. レスポンスのエンコーディング

リクエストに以下のようなヘッダが含まれる場合、レスポンス本文を圧縮することができます:

    Accept-Encoding: gzip

レスポンス本文を圧縮する場合、以下のようなヘッダを追加してください:

    Content-Encoding: gzip

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


#### Bid Request Object (Top Level)

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>オークション毎にSSP側でユニークに採番されるID</td>
  </tr>
  <tr>
    <td>imp</td>
    <td>imp object; required</td>
    <td>広告枠に関する情報</td>
  </tr>
  <tr>
    <td>source</td>
    <td>source object</td>
    <td>ヘッダー入札のような、広告エクスチェンジによる上流情報</td>
  </tr>
  <tr>
    <td>site</td>
    <td>site object</td>
    <td>掲載されるサイトに関する情報</td>
  </tr>
  <tr>
    <td>app</td>
    <td>app object</td>
    <td>掲載されるアプリに関する情報</td>
  </tr>
  <tr>
    <td>user</td>
    <td>user object</td>
    <td>ユーザに関する情報</td>
  </tr>
  <tr>
    <td>bcat</td>
    <td>array of strings; required</td>
    <td>
      パブリッシャー側でブロックしたい広告のカテゴリ情報。
      IAB OpenRTB 2.5 仕様 5.1 Content Categories を参照してください。
    </td>
  </tr>
  <tr>
    <td>badv</td>
    <td>array of strings</td>
    <td>パブリッシャー側でブロックしたい広告のドメイン情報</td>
  </tr>
  <tr>
    <td>tmax</td>
    <td>integer</td>
    <td>オークションのタイムアウトの時間
120 は 120ms以内を意味します。</td>
  </tr>
  <tr>
    <td>device</td>
    <td>device object</td>
    <td>デバイスに関する情報</td>
  </tr>
  <tr>
    <td>at</td>
    <td>integer</td>
    <td>1=ファーストプライスオークション, 2=セカンドプライスオークション</td>
  </tr>
  <tr>
    <td>wseat</td>
    <td>array of strings</td>
    <td>バイヤーシートのホワイトリスト</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>array of strings</td>
    <td>入札できる通貨</td>
  </tr>
</table>

* site、app いずれかは必須


#### imp Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>SSP側で採番したID</td>
  </tr>
  <tr>
    <td>tagid</td>
    <td>string; required</td>
    <td>SSP側で管理している広告枠を表すID。 ex) 1234:987654321</td>
  </tr>
  <tr>
    <td>secure</td>
    <td>integer</td>
    <td>
      掲載面がhttpsページであるかを示す情報。
      0=nonsecure,
      1=secure
    </td>
  </tr>
  <tr>
    <td>banner</td>
    <td>banner object</td>
    <td>banner に関する情報</td>
  </tr>
  <tr>
    <td>video</td>
    <td>video object</td>
    <td>video に関する情報</td>
  </tr>
  <tr>
    <td>native</td>
    <td>native object</td>
    <td>native に関する情報</td>
  </tr>
  <tr>
    <td>pmp</td>
    <td>pmp object</td>
    <td>pmp に関する情報</td>
  </tr>
  <tr>
    <td>instl</td>
    <td>integer</td>
    <td>掲載方法がインタースティシャルであるかを示す情報
インタースティシャルでない = 0, インタースティシャルである = 1</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>float</td>
    <td>フロアプライス</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>string</td>
    <td>フロアプライスの通貨</td>
  </tr>
  <tr>
    <td>ext.dfp_ad_unit_code</td>
    <td>string; experimental</td>
    <td>Google AdManager経由の場合の、広告ユニットフルパス</td>
  </tr>
  <tr>
    <td>ext.skadn</td>
    <td>skadn Request object</td>
    <td>SKAdNetwork に関する情報</td>
  </tr>
</table>


#### source Object

[Sellers.json](https://iabtechlab.com/sellers-json/), [OpenRTB SupplyChain オブジェクト](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md) に対応しています。

fluct社が公開している Sellers.json は https://adingo.jp/sellers.json を参照してください。

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>fd</td>
    <td>integer; required</td>
    <td>上流で購入の意思決定がされる場合は <code>1</code>, それ以外は <code>0</code> となります。</td>
  </tr>
  <tr>
    <td>tid</td>
    <td>string; experimental</td>
    <td>上流でトランザクションIDが発番された場合そのIDを送信いたします。取得できない場合はBidRequest.idと同じものを設定します。</td>
  </tr>
  <tr>
    <td>ext.stype</td>
    <td>string; experimental</td>
    <td>ヘッダ入札タイプ。内容はお問い合わせください。</td>
  </tr>
  <tr>
    <td>ext.schain</td>
    <td>supply-chain object</td>
    <td><a href="https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md">OpenRTB SupplyChain オブジェクト</a></td>
  </tr>
</table>


#### site Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>SSP側で管理しているサイトに関してのID。
※広告枠IDはimp.tagidを参照</td>
  </tr>
  <tr>
    <td>cat</td>
    <td>array of strings</td>
    <td>
      サイトのカテゴリ。
      IAB OpenRTB 2.5 仕様 5.1 Content Categories を参照してください。
    </td>
  </tr>
  <tr>
    <td>domain</td>
    <td>string</td>
    <td>掲載面のドメイン</td>
  </tr>
  <tr>
    <td>page</td>
    <td>string; required</td>
    <td>広告が掲載されたページのURL</td>
  </tr>
  <tr>
    <td>mobile</td>
    <td>integer</td>
    <td>レイアウトがモバイルデバイスに最適化されているか。 0=No, 1=Yes</td>
  </tr>
  </tr>
  <tr>
    <td>publisher</td>
    <td>publisher object</td>
    <td>パブリッシャーに関する情報</td>
  </tr>
</table>


#### app Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>SSP側で管理しているアプリに関してのID。
※広告枠IDはimp.tagidを参照</td>
  </tr>
  <tr>
    <td>cat</td>
    <td>array of strings</td>
    <td>
      アプリのカテゴリ。
      IAB OpenRTB 2.5 仕様 5.1 Content Categories を参照してください。
    </td>
  </tr>
  <tr>
    <td>storeurl</td>
    <td>string</td>
    <td>各store で利用されているURL</td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>string</td>
    <td>プラットフォーム上でのアプリケーション識別子。
Androidではパッケージ名で、iOSでは数字のID。
(例) Android: "com.foo.mygame", iOS: "1234567890"</td>
  </tr>
  <tr>
    <td>publisher</td>
    <td>publisher object</td>
    <td>パブリッシャーに関する情報</td>
  </tr>
</table>


#### publisher Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>SSP側で管理しているパブリッシャーに関してのID</td>
  </tr>
</table>


#### user Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string</td>
    <td>SSP側で管理しているユーザID</td>
  </tr>
  <tr>
    <td>buyeruid</td>
    <td>string</td>
    <td>cookie sync したことで得た、
DSPで管理しているユーザID</td>
  </tr>
</table>

* device.ifaを送る場合は、user.buyeruidは送らず、user.idにはdevice.ifaの値と同様の値が入ります。


#### device Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>ua</td>
    <td>string; required</td>
    <td>ユーザーエージェント</td>
  </tr>
  <tr>
    <td>geo</td>
    <td>geo object</td>
    <td>ジオに関する情報</td>
  </tr>
  <tr>
    <td>ip</td>
    <td>string</td>
    <td>IPv4 アドレス</td>
  </tr>
  <tr>
    <td>ipv6</td>
    <td>string</td>
    <td>IPv6 アドレス</td>
  </tr>
  <tr>
    <td>ifa</td>
    <td>string</td>
    <td>広告識別子情報（IDFA/ADID）</td>
  </tr>
  <tr>
    <td>lmt</td>
    <td>integer</td>
    <td>Limit Ad Tracking のステータス</td>
  </tr>
  <tr>
    <td>dnt</td>
    <td>integer</td>
    <td>Do Not Track ヘッダのステータス</td>
  </tr>
  <tr>
    <td>osv</td>
    <td>string</td>
    <td>OSのバージョン</td>
  </tr>
  <tr>
    <td>h</td>
    <td>integer</td>
    <td>画面の高さ (pixel)</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer</td>
    <td>画面の幅 (pixel)</td>
  </tr>
</table>

* device.w, device.h が利用可能な場合、画面の向きは以下のように区別できます:
    * w > h のとき: ランドスケープ
    * h > w のとき: ポートレイト


#### geo Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>lat</td>
    <td>float</td>
    <td>緯度。 -90.0~90.0 で、負は南</td>
  </tr>
  <tr>
    <td>lon</td>
    <td>float</td>
    <td>経度。 -180.0~180.0 で、負は西</td>
  </tr>
  <tr>
    <td>type</td>
    <td>integer</td>
    <td>位置情報の由来。 1=GPS, 2=IP address, 3=ユーザの提供による</td>
  </tr>
  <tr>
    <td>accuracy</td>
    <td>integer</td>
    <td>精度 (メートル)</td>
  </tr>
  <tr>
    <td>ipservice</td>
    <td>integer</td>
    <td>IPアドレス由来の位置情報の場合、その提供元。 1=ip2location, 2=Neustar, 3=MaxMind, 4=NetAcuity</td>
  </tr>
  <tr>
    <td>country</td>
    <td>string</td>
    <td>国コード (ISO 3166-1 alpha-3)</td>
  </tr>
  <tr>
    <td>region</td>
    <td>string</td>
    <td>地域コード (ISO 3166-2)。 米国の場合のみ2文字州コード</td>
  </tr>
  <tr>
    <td>metro</td>
    <td>string</td>
    <td>Google metro code</td>
  </tr>
  <tr>
    <td>city</td>
    <td>string</td>
    <td>都市名</td>
  </tr>
  <tr>
    <td>zip</td>
    <td>string</td>
    <td>郵便番号</td>
  </tr>
  <tr>
    <td>utcoffset</td>
    <td>integer</td>
    <td>UTC との時差 (分)</td>
  </tr>
</table>


#### banner Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
  </tr>
    <td>format</td>
    <td>array of format objects</td>
    <td>
      フォーマットに関する情報
    </td>
  <tr>
  </tr>
  <tr>
    <td>h</td>
    <td>integer</td>
    <td>バナーの高さ</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer</td>
    <td>バナーの横幅</td>
  </tr>
  <tr>
    <td>pos</td>
    <td>integer; required</td>
    <td>バナーの掲載位置。
IABに準拠。
但し、スマートフォンのオーバーレイ広告は 9 で送ります</td>
  </tr>
  <tr>
    <td>vcm</td>
    <td>integer</td>
    <td>
      imp.video.companionad の場合でのみ有効。
      0=concurrent,
      1=end-card
    </td>
  </tr>
</table>


#### format Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>h</td>
    <td>integer; required</td>
    <td>高さ</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer; required</td>
    <td>幅</td>
  </tr>
</table>


#### video Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>mimes</td>
    <td>array of strings; required</td>
    <td>
      対応しているMIMEタイプ。
      "video/mp4", “video/x-flv” 等
    </td>
  </tr>
  <tr>
    <td>pos</td>
    <td>integer</td>
    <td>
      動画の掲載位置 (IABに準拠。 但し、スマートフォンのオーバーレイは、 9 で送ります)
    </td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>integer</td>
    <td>
      動画の最短再生時間 (秒)
    </td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>integer</td>
    <td>
      動画の最長再生時間 (秒)
    </td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>array of integers</td>
    <td>
      対応している動画プロトコル。
      1=VAST 1.0,
      2=VAST 2.0,
      3=VAST 3.0,
      4=VAST 1.0 Wrapper,
      5=VAST 2.0 Wrapper,
      6=VAST 3.0 Wrapper,
      7=VAST 4.0,
      8=VAST 4.0 Wrapper
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>array of integers</td>
    <td>
      ブロックされたクリエイティブ属性 (IAB に準拠)
    </td>
  </tr>
  <tr>
    <td>h</td>
    <td>integer</td>
    <td>動画の高さ</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer</td>
    <td>動画の横幅</td>
  </tr>
  <tr>
    <td>startdelay</td>
    <td>integer</td>
    <td>
      再生開始までの時間 (秒)。
      0=pre-roll,
      &gt;0=mid-roll (指定される秒数後に再生される),
      -1=一般的な mid-roll,
      -2=post-roll
    </td>
  </tr>
  <tr>
    <td>linearity</td>
    <td>integer</td>
    <td>
      リニアリティ。
      1=in-stream,
      2=オーバーレイ
    </td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>integer</td>
    <td>
      最小ビットレート (Kbps)
    </td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>integer</td>
    <td>
      最大ビットレート (Kbps)
    </td>
  </tr>
  <tr>
    <td>skip</td>
    <td>integer</td>
    <td>
      スキップ有無。
      0=なし,
      1=あり
    </td>
  </tr>
  <tr>
    <td>api</td>
    <td>array of integers</td>
    <td>
      対応しているAPIフレームワーク。
      1=VPAID 1.0,
      2=VPAID 2.0,
      3=MRAID-1,
      4=ORMMA,
      5=MRAID-2
    </td>
  </tr>
  <tr>
    <td>placement</td>
    <td>integer</td>
    <td>
      配置方法。
      1=in-stream (動画コンテンツの pre-roll, mid-roll, もしくは post-roll),
      2=in-banner (バナーの位置で再生される),
      5=インタースティシャル、フローティング (画面の一部もしくはすべてを覆い、再生中は継続して画面に表示される),
      imp.instl との組み合わせで全画面インタースティシャルと区別する
    </td>
  </tr>
  <tr>
    <td>companionad</td>
    <td>array of banner objects</td>
    <td>
      コンパニオンアドがサポートされている場合、 banner object が入れられる
    </td>
  </tr>
  <tr>
    <td>ext</td>
    <td>video-ext object</td>
    <td>
      video 拡張オブジェクト
    </td>
  </tr>
</table>


#### video-ext Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>videotype</td>
    <td>string</td>
    <td>
      rewarded=動画リワードのインプレッション
    </td>
  </tr>
</table>


#### audio Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>mimes</td>
    <td>array of strings; required</td>
    <td>
      対応しているMIMEタイプ。 "audio/mp4" 等
    </td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>integer</td>
    <td>
      音声の最短再生時間 (秒)
    </td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>integer</td>
    <td>
      音声の最長再生時間 (秒)
    </td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>array of integers</td>
    <td>
      対応している音声プロトコル。
        1=VAST 1.0,
        2=VAST 2.0,
        3=VAST 3.0,
        4=VAST 1.0 Wrapper,
        5=VAST 2.0 Wrapper,
        6=VAST 3.0 Wrapper,
        7=VAST 4.0,
        8=VAST 4.0 Wrapper
    </td>
  </tr>
  <tr>
    <td>startdelay</td>
    <td>integer</td>
    <td>
      再生開始までの時間 (秒)。
      0=pre-roll,
      &gt;0=mid-roll (指定される秒数後に再生される),
      -1=一般的な mid-roll,
      -2=post-roll
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>array of integers</td>
    <td>
      ブロックされたクリエイティブ属性 (IAB に準拠)
    </td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>integer</td>
    <td>
      最小ビットレート (Kbps)
    </td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>integer</td>
    <td>
      最大ビットレート (Kbps)
    </td>
  </tr>
  <tr>
    <td>api</td>
    <td>array of integers</td>
    <td>
      対応しているAPIフレームワーク。
      1=VPAID 1.0,
      2=VPAID 2.0,
      3=MRAID-1,
      4=ORMMA,
      5=MRAID-2
    </td>
  </tr>
  <tr>
    <td>feed</td>
    <td>integer</td>
    <td>
      フィードの種類。
      1=音楽サービス,
      2=FM/AM放送,
      3=ポッドキャスト
    </td>
  </tr>
  <tr>
    <td>stitched</td>
    <td>integer</td>
    <td>
      音声コンテンツに結合されるか
      0=no,
      1=yes
    </td>
  </tr>
</table>


#### native Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>request</td>
    <td>string; required</td>
    <td><a href="native-ads-v1.ja.md">Native Ad Request Markup Object</a></td>
  </tr>
  <tr>
    <td>ver</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>api</td>
    <td>array of integers</td>
    <td>
      対応しているAPIフレームワーク
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>array of integers</td>
    <td>
      ブロックされたクリエイティブ属性 (IAB に準拠)
    </td>
  </tr>
</table>


#### pmp Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>private_auction</td>
    <td>integer; required</td>
    <td>
      Dealへの入札に限定するか。
      0=no, 1=yes
    </td>
  </tr>
  <tr>
    <td>deals</td>
    <td>array of deal objects; required</td>
    <td></td>
  </tr>
</table>


#### deal Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>SSP側で発行したdeal ID</td>
  </tr>
  <tr>
    <td>at</td>
    <td>integer</td>
    <td>1=ファーストプライスオークション, 2=セカンドプライスオークション, 3=固定価格</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>float</td>
    <td>at が 1, 2 の場合はフロアプライス、 3 の場合はディールの固定価格</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>string</td>
    <td>bidfloor の通貨</td>
  </tr>
  <tr>
    <td>wseat</td>
    <td>array of strings</td>
    <td>バイヤーシートのホワイトリスト</td>
  </tr>
  <tr>
    <td>wadomain</td>
    <td>array of strings</td>
    <td>広告主ドメインのホワイトリスト</td>
  </tr>
</table>

#### skadn Request Object

[SKAdNetwork Request Object](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/extensions/community_extensions/skadnetwork.md#bid-request)

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>version</td>
    <td>string; required</td>
    <td>サポートされているSKAdNetworkのバージョン。常に "2.0 "以上。</td>
  </tr>
  <tr>
    <td>sourceapp</td>
    <td>string; required</td>
    <td>
      プラットフォーム上でのアプリケーション識別子。
      (例) iOS: "1234567890
    </td>
  </tr>
  <tr>
    <td>skadnetids</td>
    <td>array of strings; required</td>
    <td>パブリッシャーアプリのinfo.plistのSKAdNetworkItemエントリ</td>
  </tr>
</table>

## 4. レスポンス仕様

### a. bidレスポンスパラメタ

DSPはJSONフォーマットで入札情報をシリアライズします。

入札しない場合はHTTP 204 No Contentとしてください。


#### Bid Response Object (Top Level)

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>レスポンスのID</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>string; required</td>
    <td>入札金額の通貨コード ISO-4217</td>
  </tr>
  <tr>
    <td>seatbid</td>
    <td>array of seatbid objects; required</td>
    <td>1+ seatbid objects</td>
  </tr>
</table>


#### seatbid Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>bid</td>
    <td>array of bid objects; required</td>
    <td>1+ bid objects</td>
  </tr>
  <tr>
    <td>seat</td>
    <td>string</td>
    <td>
      バイヤーシート ID。
      複数シートのbidをする場合は必須です。
    </td>
  </tr>
</table>


#### bid Object

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>impid</td>
    <td>string; required</td>
    <td>入札対象のBidRequest.imp.id</td>
  </tr>
  <tr>
    <td>price</td>
    <td>float; required</td>
    <td>入札金額</td>
  </tr>
  <tr>
    <td>adm</td>
    <td>string; required</td>
    <td>
      広告表示データ。
      広告フォーマットにより内容の形式は異なります。
      マクロ置換がおこなわれます。
      レスポンスサンプルを参照してください。
    </td>
  </tr>
  <tr>
    <td>adomain</td>
    <td>array of strings; required</td>
    <td>
      広告主ドメイン。
      返却されない場合、パブリッシャーが広告主をドメインでブロックしている枠への入札は無効です。
    </td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>string; recommended</td>
    <td>
      プラットフォーム上でのアプリケーション識別子。
      Androidではパッケージ名で、iOSでは数字のID。
      (例) Android: "com.foo.mygame", iOS: "1234567890"
    </td>
  </tr>
  <tr>
    <td>cid</td>
    <td>string; recommended</td>
    <td>キャンペーンID</td>
  </tr>
  <tr>
    <td>crid</td>
    <td>string; recommended</td>
    <td>広告クリエイティブID</td>
  </tr>
  <tr>
    <td>dealid</td>
    <td>string</td>
    <td>
      pmp dealへの入札の場合は必須項目。
      入札対象のBidRequest.imp.pmp.deal.id
    </td>
  </tr>
  <tr>
    <td>h</td>
    <td>integer; recommended</td>
    <td>クリエイティブの高さ</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer; recommended</td>
    <td>クリエイティブの幅</td>
  </tr>
  <tr>
    <td>attr</td>
    <td>array of integers; recommended</td>
    <td>
      クリエイティブ属性。
      IAB OpenRTB 2.5 仕様 5.3 Creative Attributes を参照してください。
    </td>
  </tr>
  <tr>
    <td>cat</td>
    <td>array of strings; recommended</td>
    <td>
      クリエイティブカテゴリ。
      IAB OpenRTB 2.5 仕様 5.1 Content Categories を参照してください。
    </td>
  </tr>
  <tr>
    <td>nurl</td>
    <td>string</td>
    <td>
      Win通知URL。
      入札が勝利した際に呼び出されます。
      約定・表示・請求を通知するものではなく、オークションでの勝利を通知するものです。
      マクロ置換がおこなわれます。
    </td>
  </tr>
  <tr>
    <td>lurl</td>
    <td>string</td>
    <td>
      Loss通知URL。
      入札が勝利しなかった際に呼び出されます。
      マクロ置換がおこなわれます。
    </td>
  </tr>
  <tr>
    <td>ext.skadn</td>
    <td>skadn Response object</td>
    <td>SKAdNetwork に関する情報</td>
  </tr>
  <tr>
    <td>ext.clicktrackers</td>
    <td>array of strings</td>
    <td>MoPub iOS 14 サポート提案のclicktrackers</td>
  </tr>
</table>

#### skadn Response Object

[SKAdNetwork Response Object](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/extensions/community_extensions/skadnetwork.md#bid-response)

<table>
  <tr>
    <th>Field</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>version</td>
    <td>string; required</td>
    <td>サポートされているskadnetworkのバージョン。"2.0" 以上。</td>
  </tr>
  <tr>
    <td>network</td>
    <td>string; required</td>
    <td>`BidRequest.imp.ext.skadn.skadnetids`内の1つにマッチしなければなりません。</td>
  </tr>
  <tr>
    <td>campaign</td>
    <td>string; required</td>
    <td>Appleの仕様に対応したキャンペーンID。</td>
  </tr>
  <tr>
    <td>itunesitem</td>
    <td>string; required</td>
    <td>広告主のアプリのAppStore ID。`BidResponse.seatbid.bid.bundle`と一致する必要があります。</td>
  </tr>
  <tr>
    <td>nonce</td>
    <td>string; required</td>
    <td>各広告レスポンスに固有のID。</td>
  </tr>
  <tr>
    <td>sourceapp</td>
    <td>string; required</td>
    <td>
      プラットフォーム上でのアプリケーション識別子。
      `BidRequest.imp.ext.skadn.sourceapp`と一致する必要があります。
    </td>
  </tr>
  <tr>
    <td>timestamp</td>
    <td>string; required</td>
    <td>文字列のミリ秒単位のUnix時間。</td>
  </tr>
  <tr>
    <td>signature</td>
    <td>string; required</td>
    <td>AppleのSKAdNetworkシグネチャ。</td>
  </tr>
</table>

### b. impressionまたは/clickビーコンの送信

fluctのクライアント制御スクリプトからビーコンを送信に関して, 各エンドポイントは以下の仕様に準拠しているという前提で送信を行います。

#### impressionビーコンを受けるエンドポイント

* HTTPS (TLS1.2以降)での受信に対応している

* GETメソッドでの受信に対応していること

* XMLHttpRequestではなくimgタグのsrc属性にURLを設定することでリクエストを行います。

#### impressionビーコンを送信するfluctのクライアント側

以下の条件で送信を行います。

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

以下の条件で送信を行います。

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

* 実際に広告が表示されるブラウザ側から送信する前提となっているため, XMLHttpRequestによるCross-Origin Requestが用いられます。
* 一部の対応環境では, より確実なビーコン送信のため, [http://www.w3.org/TR/beacon/](http://www.w3.org/TR/beacon/) にて定義された navigator.sendBeacon()による送信が行われる場合があります。


### c. マクロ置換

<table>
  <tr>
    <th>マクロ</th>
    <th>詳細</th>
    <th>adm</th>
    <th>nurl</th>
    <th>lurl</th>
  </tr>
  <tr>
    <td><code>${CLICK_URL_ENC}</code></td>
    <td>
      <strong>2020/12/31 で廃止します。</strong>
      <a href="#d-click_url_enc-マクロ廃止について">CLICK_URL_ENC マクロ廃止について</a>
    </td>
    <td>Yes</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td><code>${AUCTION_CURRENCY}</code></td>
    <td>
      入札で使用された通貨。
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_ID}</code></td>
    <td>
      オークション ID。
      ビッドリクエストの <code>id</code> に置換されます。
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_IMP_ID}</code></td>
    <td>
      インプレッション ID。
      ビッドリクエストの <code>imp.id</code> に置換されます。
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_LOSS}</code></td>
    <td>
      オークション敗因コード。
      オークション敗因コードについては、 IAB OpenRTB 2.5 仕様 5.25 Loss Reason Codes を参照してください。
    </td>
    <td></td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_PRICE}</code></td>
    <td>
      約定金額。暗号化可能。
      クリエイティブ審査プロセスによる描画の場合、<code>AUDIT</code> という文字列に置換されます。
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_PRICE_IV}</code></td>
    <td>
      約定金額暗号化初期化ベクトル。
      初期化ベクトルを生成する暗号化方式の場合に置換されます。
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_SECOND_PRICE}</code></td>
    <td>
      2位入札金額。暗号化可能。
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td></td>
  </tr>
  <tr>
    <td><code>${AUCTION_SECOND_PRICE_IV}</code></td>
    <td>
      2位入札金額暗号化用初期化ベクトル。
      初期化ベクトルを生成する暗号化方式の場合に置換されます。
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td></td>
  </tr>
  <tr>
    <td><code>${IS_PREVIEW}</code></td>
    <td>
      クリエイティブ審査プロセスによる描画の場合 <code>1</code> に、通常は <code>0</code> に置換されます。
    </td>
    <td>Yes</td>
    <td></td>
    <td></td>
  </tr>
</table>

* 暗号化方式（アルゴリズム、鍵長、暗号利用モード）については、事前に協議して決定します。（例：CFB 3DES + いわゆるWeb セーフ Base64など）
    * 暗号鍵は決定した方式に基づいて、 fluct が発行します。
* 特に明記されない限り、クリエイティブ審査プロセスによる描画ではマクロは置換されません。


### d. CLICK_URL_ENC マクロ廃止について

システム改修に伴い、ビッドレスポンスadmに入れていただいているFluct定義クリック計測用マクロ `${CLICK_URL_ENC}` を **2020/12/31** に廃止させていただきます。
期日以降、admに当マクロが存在すると、広告ランディングページへ正しく遷移しない可能性がありますので、期日前にadmから当マクロを撤去・削除していただきますよう、ご協力をお願いいたします。



## 5. コード表


## 6. リクエスト／レスポンス例

### リクエスト例

[version2.req-examples.md](./version2.req-examples.md) を参照してください。

### レスポンス例

[version2.res-examples.md](./version2.res-examples.md) を参照してください。
