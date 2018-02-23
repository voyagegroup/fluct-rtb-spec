# fluct RTB 仕様2.1.5

OpenRTB2.3に準拠しています。詳細は[IABのOpenRTB API Specification Version 2.3](https://www.iab.com/wp-content/uploads/2015/06/OpenRTB-API-Specification-Version-2-3.pdf)をご確認ください

注意

この仕様書には不完全な点があるかもしれません。不備や不明瞭な点がありましたら、担当者か [fluct_dev@voyagegroup.info](mailto:fluct_dev@voyagegroup.info) に教えてください。また、一般的なRTBのプロトコルそのものに対する説明はありません。


## Table of Contents

* [0. 変更履歴](#0-変更履歴)
* [1.cookie sync](#1cookie-sync)
* [2.リクエスト仕様](#2リクエスト仕様)
   * [a.エンドポイントURL](#aエンドポイントurl)
   * [b.bid リクエストパラメタ](#bbid-リクエストパラメタ)
      * [b-1. BidRequest Object (TopLevel)](#b-1-bidrequest-object-toplevel)
      * [b-2. imp Object](#b-2-imp-object)
      * [b-3. site Object](#b-3-site-object)
      * [b-4. app Object](#b-4-app-object)
      * [b-5. user Object](#b-5-user-object)
      * [b-6. device Object](#b-6-device-object)
      * [b-7. banner Object](#b-7-banner-object)
      * [b-8. video Object](#b-8-video-object)
      * [b-9. pmp Object](#b-9-pmp-object)
      * [b-10. Native Object (新)](#b-10-native-object-新)
      * [b-11. Native Markup Request Object](#b-11-native-markup-request-object)
      * [b-12. deals Object](#b-12-deals-object)
      * [b-13. assets Object](#b-13-assets-object)
      * [b-14. title Object](#b-14-title-object)
      * [b-15. img Object](#b-15-img-object)
      * [b-16. data Object](#b-16-data-object)
      * [b-17. Native Object (旧)](#b-17-native-object-旧)
* [3.レスポンス仕様](#3レスポンス仕様)
   * [a.レスポンスパラメタ](#aレスポンスパラメタ)
   * [b.imptrackers, jstracker, clicktrackersの取り扱い](#bimptrackers-jstracker-clicktrackersの取り扱い)
   * [c. impressionまたは/clickビーコンの送信](#c-impressionまたはclickビーコンの送信)
      * [impressionビーコンを受けるエンドポイント](#impressionビーコンを受けるエンドポイント)
      * [impressionビーコンを送信するfluctのクライアント側](#impressionビーコンを送信するfluctのクライアント側)
      * [clickビーコンを受けるエンドポイント](#clickビーコンを受けるエンドポイント)
      * [clickビーコンを送信するfluctのクライアント側](#clickビーコンを送信するfluctのクライアント側)
      * [clickビーコン送信に用いられる手法について](#clickビーコン送信に用いられる手法について)
   * [d. マクロ置換](#d-マクロ置換)
   * [e.リダイレクタ仕様](#eリダイレクタ仕様)
      * [■方法A)](#方法a)
      * [■方法B)](#方法b)
* [4.コード表](#4コード表)
* [5.リクエスト／レスポンスサンプル](#5リクエストレスポンスサンプル)
   * [【bid Request web】](#bid-request-web)
   * [【bid request app】](#bid-request-app)
   * [【bid request native(icon)】](#bid-request-nativeicon)
   * [【bid request native(main)】](#bid-request-nativemain)
   * [【bid request pmp】](#bid-request-pmp)
   * [【bid request video】](#bid-request-video)
   * [【bid response web,app】](#bid-response-webapp)
   * [【bid response native(icon/main)】](#bid-response-nativeiconmain)
   * [【bid response pmp】](#bid-response-pmp)
   * [【bid response video】](#bid-response-video)
   * [【jstracker 仕様/サンプルコード】](#jstracker-仕様サンプルコード)


## 0. 変更履歴

[CHANGELOG.md](CHANGELOG.md)

## 1.cookie sync

通常は以下のようなsyncを行なっていますが、他のフローも個別に対応可能です。（※オフラインのsyncは行なっていません。）

1. SSPが広告枠に、DSPのsync画像タグを配信する
2. DSPはsyncタグへのアクセスを受けた際に、SSPのsync URLにリダイレクト
3. DSPはsync URLにパラメタとしてIDを付与し、SSPへのID通知とする

DSPのsyncタグは事前にお知らせ下さい。（DSP作業）syncタグはイメージタグ・SSL通信に限定させていただきます。fluct側のsync URL は以下の例のようになります。

    https://cs.adingo.jp/sync/?from=[DSP_NAME]&id=[DSP_USER_ID]

DSP_NAMEはつなぎ込みに先立ってSSPが発行します（SSP作業）。お問い合わせ下さい。syncの有効期限はデフォルトでは30日ですが、expireパラメタを指定することにより任意の日数を指定できます。以下の例は90日有効なsyncになります。

    https://cs.adingo.jp/sync/?from=your_dsp&id=XXXXXX&expire=90

## 2.リクエスト仕様

### a.エンドポイントURL

bid リクエストを送信すべきエンドポイントURLをSSPに通知して下さい。（DSP作業）

SSPは指定されたエンドポイントURLにbidリクエストをPOSTします。高速化のため、可能であれば HTTP keep aliveをサポートしてください。なお、httpsにも対応しております。また、個別のportの指定がある場合は、事前にご連絡ください。

### b.bid リクエストパラメタ

シリアライズフォーマット：Google Protobuf、JSONのいずれか。

（※文字列型サポート以前のMessagePackを使用した接続実績がありますが、MessagePackは非推奨です。文字列型サポート版以降のMessagePackに対応する予定はありません。）

DSPは使用するシリアライズフォーマットをSSPに通知してください。（DSP作業）

#### b-1. BidRequest Object (TopLevel)

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
    <td>通常は、 2 を送ります。
2が意味するのはセカンドプライスオークションです。
default 2(2nd price auction)
integer</td>
  </tr>
</table>


※ site、app いずれかは必須

#### b-2. imp Object

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
    <td>掲載面がhttpsページであるかを示す情報
nonsecure = 0, secure=1
banner, videoの場合、
HTTP_REFERRERがhttp/httpsで判断
nativeadの場合
secure固定
integer</td>
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
</table>


#### b-3. site Object

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
  </tr>
  <tr>
    <td>publisher</td>
    <td>optional</td>
    <td>パブリッシャーに関する情報</td>
  </tr>
</table>


#### b-4. app Object

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
    <td>Application bundle（iOS）あるいはpackage name （And）
(例） com.foo.mygame
string</td>
  </tr>
  <tr>
    <td>appid</td>
    <td>optional</td>
    <td>Appstoreurlに含まれるID（iOSのみ）
例：Angry Birds (iOS)  "343200656"
string</td>
  </tr>
  </tr>
  <tr>
    <td>publisher</td>
    <td>optional</td>
    <td>パブリッシャーに関する情報</td>
  </tr>
</table>


#### b-5. user Object

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
値がcookieから取得できない場合、
"buyeruid": "undefined"
string</td>
  </tr>
</table>


※ device.ifaを送る場合は、user.buyeruidは送らず、user.idにはdevice.ifaの値と同様の値が入ります

#### b-6. device Object

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
アプリかつSSP側でifaが取得できる場合に、ifaがセットされます
(取得できない場合、パラメタ自体がなくなります)
string</td>
  </tr>
  <tr>
    <td>lmt</td>
    <td>optional</td>
    <td>LimitAdTracking のステータス
(取得できない場合、パラメタ自体がなくなります)
integer</td>
  </tr>
</table>


#### b-7. banner Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>h</td>
    <td>required</td>
    <td>バナーの高さ
integer</td>
  </tr>
  <tr>
    <td>w</td>
    <td>required</td>
    <td>バナーの横幅
integer</td>
  </tr>
  <tr>
    <td>pos</td>
    <td>required</td>
    <td>バナーの掲載位置
IABに準拠
但し、スマートフォンのオーバーレイ広告は、 9 で送ります。
integer</td>
  </tr>
</table>


#### b-8. video Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>mimes</td>
    <td>required</td>
    <td>対応しているMIMEタイプ
"video/mp4", “video/x-flv” 等
string array</td>
  </tr>
  <tr>
    <td>pos</td>
    <td>optional</td>
    <td>動画の掲載位置
IABに準拠
但し、スマートフォンのオーバーレイは、 9 で送ります。
integer</td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>optional</td>
    <td>動画の最短再生時間 (秒)
integer</td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>optional</td>
    <td>動画の最長再生時間 (秒)
integer</td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>optional</td>
    <td>対応している動画プロトコル
1=VAST 1.0
2=VAST 2.0
3=VAST 3.0
4=VAST 1.0 Wrapper
5=VAST 2.0 Wrapper
6=VAST 3.0 Wrapper
7=VAST 4.0
8=VAST 4.0 Wrapper
integer array</td>
  </tr>
  <tr>
    <td>h</td>
    <td>optional</td>
    <td>動画の高さ
integer</td>
  </tr>
  <tr>
    <td>w</td>
    <td>optional</td>
    <td>動画の横幅
integer</td>
  </tr>
  <tr>
    <td>startdelay</td>
    <td>optional</td>
    <td>再生開始までの時間 (秒)
0=pre-roll
>0=mid-roll (指定される秒数後に再生される)
-1=一般的な mid-roll
-2=post-roll
integer</td>
  </tr>
  <tr>
    <td>linearity</td>
    <td>optional</td>
    <td>リニアリティ
1=in-stream
2=オーバーレイ
integer</td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>optional</td>
    <td>最小ビットレート (Kbps)
integer</td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>optional</td>
    <td>最大ビットレート (Kbps)
integer</td>
  </tr>
  <tr>
    <td>skip</td>
    <td>optional</td>
    <td>スキップ有無
0=なし, 1=あり
integer</td>
  </tr>
  <tr>
    <td>api</td>
    <td>optional</td>
    <td>対応しているAPIフレームワーク
1=VPAID 1.0
2=VPAID 2.0
3=MRAID-1
4=ORMMA
5=MRAID-2
integer array</td>
  </tr>
  <tr>
    <td>placement</td>
    <td>optional</td>
    <td>配置方法
1=in-stream (動画コンテンツの pre-roll, mid-roll, もしくは post-roll)
2=in-banner (バナーの位置で再生される)
5=インタースティシャル、フローティング (画面の一部もしくはすべてを覆い、再生中は継続して画面に表示される)
imp.instl との組み合わせで全画面インタースティシャルと区別する
integer</td>
  </tr>
</table>


#### b-9. pmp Object

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

#### b-10. Native Object (新)

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>request</td>
    <td>required</td>
    <td>Native Markup Request Object or string(toJsonString(Native Markup Request Object))</td>
  </tr>
  <tr>
    <td>ver</td>
    <td>recommended</td>
    <td>string</td>
  </tr>
  <tr>
    <td>api</td>
    <td>optional</td>
    <td>VPAIDやMRAIDのAPI区分を示す値
integer array</td>
  </tr>
  <tr>
    <td>battr</td>
    <td>optional</td>
    <td>ブロックしたいクリエイティブID
integer array</td>
  </tr>
</table>

openRTBの仕様上、NativeObjectにrequestが含まれるのが正しいです。
接続済みのDSPにおいてはnativeObjectにassetsを設定して接続したケースがございます。 
その仕様で接続済みの事業者に関しては変更無しで接続可能です。 
以前のNativeObjectの仕様を `b-17. Native Object (旧)` として表現します。 
<br/>
旧から新への変更の必要はありませんが、変更したいケースはお申し出ください
弊社から、とあるタイミングで新仕様の方に変更する旨の依頼を行う可能性もございます。

#### b-11. Native Markup Request Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>ver</td>
    <td>optional</td>
    <td>string</td>
  </tr>
  <tr>
    <td>layout</td>
    <td>recommended</td>
    <td>対応してるレイアウト
integer</td>
  </tr>
  <tr>
    <td>adunit</td>
    <td>recommended</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>plcmtcnt</td>
    <td>optional</td>
    <td>広告表示数
integer</td>
  </tr>
  <tr>
    <td>seq</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>assets</td>
    <td>required</td>
    <td>array of Object</td>
  </tr>
  <tr>
    <td>ext</td>
    <td>optional</td>
    <td>object</td>
  </tr>
</table>

※assetsはBidResponseにも同じ構成で含まれていることを前提としています
assetsに設定されている項目でも、メディア側の設定によって項目が非表示になることがあります。(必須表示項目がある場合、接続前にご一報いただけると幸いです)

※layoutについては末尾に補足がございます


#### b-12. deals Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>SSP側で発行したdeal ID
string</td>
  </tr>
</table>


#### b-13. assets Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>アセット毎のID</td>
  </tr>
  <tr>
    <td>title</td>
    <td>optional</td>
    <td>titleオブジェクト</td>
  </tr>
  <tr>
    <td>img</td>
    <td>optional</td>
    <td>imageオブジェクト</td>
  </tr>
  <tr>
    <td>data</td>
    <td>optional</td>
    <td>dataオブジェクト</td>
  </tr>
</table>


※ bidrequestとしてtitle,img,data.type=1(sponsord),data.type=2(desc) のみを送信します。

#### b-14. title Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>len</td>
    <td>required</td>
    <td>タイトルの最大文字列長
(デザインによっては表示時に短くなることもある)</td>
  </tr>
</table>


#### b-15. img Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>wmin</td>
    <td>required</td>
    <td>最小幅(ピクセル)</td>
  </tr>
  <tr>
    <td>hmin</td>
    <td>required</td>
    <td>最小高さ(ピクセル)</td>
  </tr>
  <tr>
    <td>type</td>
    <td></td>
    <td>1(Icon) / 3(Main)</td>
  </tr>
</table>


※imgのwmin/hminに関しては事前の取り決めに応じて送信します
(NewsFeedのdefault : type:1 の場合 160x160 / type3の場合デザインに依存します)

#### b-16. data Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>type</td>
    <td>required</td>
    <td>アセットタイプ</td>
  </tr>
  <tr>
    <td>len</td>
    <td>required</td>
    <td>文字長(文字列他)</td>
  </tr>
</table>

#### b-17. Native Object (旧)

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>ver</td>
    <td></td>
    <td>string</td>
  </tr>
  <tr>
    <td>assets</td>
    <td>assets Object</td>
    <td>※1</td>
  </tr>
  <tr>
    <td>layout</td>
    <td></td>
    <td>対応してるレイアウト
integer</td>
  </tr>
</table>

※assetsはBidResponseにも同じ構成で含まれていることを前提としています
assetsに設定されている項目でも、メディア側の設定によって項目が非表示になることがあります。(必須表示項目がある場合、接続前にご一報いただけると幸いです)

※layoutについては末尾に補足がございます


※BidRequest/ResponseにおけるレイアウトIDとアセットの関連

<table>
  <tr>
    <th>layout</th>
    <th>required</th>
  </tr>
  <tr>
    <td>3 (NewsFeed)</td>
    <td>img,title,data(sponsored.desc)</td>
  </tr>
  <tr>
    <td>501 (TextAd)</td>
    <td>title,data(sponsored,desc)</td>
  </tr>
</table>


※ レイアウトID毎にrequiredとなっている要素はBidRequestに必ず含めて送信します。

BidResponseに含まれない場合はRTBで落札できた場合でも広告表示/imp通知を行いません。

imgを保持するassetオブジェクトが複数あるケースもあります。

#### b-18. Publisher Object

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

## 3.レスポンス仕様

###  a.レスポンスパラメタ

DSPはリクエストに採用したのと同じシリアライズフォーマットで入札情報をシリアライズします。

入札しない場合はHTTP 204 No Contentとしてください。

（以下はJSONの場合の例）

<table>
  <tr>
    <th>format</th>
    <th>必須項目</th>
    <th>推奨項目</th>
  </tr>
  <tr>
    <td>banner
app
video</td>
    <td>id
cur
seatbid.bid.impid
seatbid.bid.price
seatbid.bid.adm</td>
    <td>seatbid.bid.adomain</td>
  </tr>
  <tr>
    <td>pmp</td>
    <td>id
cur
seatbid.bid.impid
seatbid.bid.price
seatbid.bid.adm
seatbid.bid.dealid</td>
    <td></td>
  </tr>
  <tr>
    <td>native</td>
    <td>id
cur
seatbid.bid.impid
seatbid.bid.price
seatbid.bid.adm
seatbid.bid.adm.native.optouturl
seatbid.bid.adm.native.link.url
seatbid.bid.adm.native.imptrackers
seatbid.bid.adm.native.assets.id
seatbid.bid.adm.native.assets.title.text
seatbid.bid.adm.native.assets.img.url
seatbid.bid.adm.native.assets.img.w
seatbid.bid.adm.native.assets.img.h
seatbid.bid.adm.native.assets.data.value</td>
    <td>seatbid.bid.adm.native.jstracker
seatbid.bid.adm.native.link.clicktrackers</td>
  </tr>
</table>


※seatbid.bid.adm.native.assets の各要素は title, img, data のいずれかをひとつ含んでいます。 5.Bid Request/Response Samples bid response native(icon/main) を参考にしてください。

(同一impidのBidRequestのassetと同じものが返却されてくることを想定しています)

### b.imptrackers, jstracker, clicktrackersの取り扱い

<table>
  <tr>
    <td>imptrackers</td>
    <td>impressionビーコンのリクエストの送信先のURLエンドポイント
${AUCTION_PRICE}などのマクロ文字列を必要に応じて組み込んでください
用いるプロトコルについて別途定義します.
複数項目が格納されている場合でも, 配列の一番目のみ使用します.

 実行タイミングについて
実際に広告がページ中に表示されたタイミングでリクエストを発行します.
viewport(*1)中に表示されたか否かではなく,
ページ中すなわちcanvas(*2)において表示されているか否かのタイミングでのリクエストの発行となります.

*1: http://www.w3.org/TR/CSS21/visuren.html#viewport
*2: http://www.w3.org/TR/CSS21/intro.html#canvas 

制約事項
- エンドポイントの仕様は, 後述の「 impressionまたはclickビーコンの送信について」に準拠しているものとします</td>
  </tr>
  <tr>
    <td>jstracker</td>
    <td>DSP側で任意のスクリプトを実行したい場合に, JavaScript(*1)として実行可能な文字列.
複数項目が格納されている場合でも, 配列の一番目のみ使用します.

 利用用途
viewable impressionの測定, クリック位置の計測など, 表示された広告に関する情報の計測目的の利用を想定しています.
上述の目的以外（第三者配信, 表示された広告要素の見た目の動的な書き換え）などには用いないでください.
各レスポンスに対応する広告要素の特定について
NOTE: 本機能（各レスポンスに対応する広告要素の特定）に関しては, 現時点のfluctではサポートされていません（併記されている内容は, 現在検討中の手法の例となります）.
 本項の機能が必要な場合はfluct担当者までお問い合わせください.
ページ中から当該の広告要素にアクセスしたい場合, 広告要素をあわらすDOMのサブツリーのrootとなる要素に対して, fluct-native-rtb-container--XXXXの形式で表現される`id`属性を指定しているので, それを用いてアクセスしてください.
XXXXはDSP側でオークション時に算出の可能な任意の識別子文字列に置換されます.
例: var element = document.getElementById('fluct-native-rtb-container-123456');
 制約事項
 スクリプト文字列は(function(){...})();`で囲ってください(...がスクリプト本体を表します）
スクリプト文字列はstrict modeとして実行可能なコードである必要があります
Content Security Policy(*2)の制約などにより, 広告が掲載されるメディアによっては実行されない場合があります.
スクリプトが実行される可能性のあるWebブラウザまたはJavaScriptエンジンの環境に関しては本仕様の範囲では定義しません.
このスクリプトの実行に伴い, なんらかのエラーが発生しのimpビーコンまたはclickビーコンの発行を保証できない場合があります.
実行されるタイミング
ページ中に要素が挿入された時点で実行を開始します.
NOTE: 広告要素が表示されたタイミング（impビーコンの発行タイミング）の以前に実行される場合があります.
*1: www.ecma-international.org/ecma-262/5.1/ で定義された言語仕様とする.
*2: http://www.w3.org/TR/CSP/
</td>
  </tr>
  <tr>
    <td>clicktrackers</td>
    <td>clickビーコンのリクエストの送信先のURLエンドポイント.
用いるプロトコルについては別途定義します.
複数項目が格納されている場合でも, 配列の一番目のみ使用します.
 実行タイミングについて
- 広告要素のリンクがクリックされた時点でビーコンへのリクエスト発行処理を開始します.
制約事項
 - Webブラウザによってはページ遷移時に, 遷移前のページで発行されたリクエストの完了を待たずに
   遷移前のページで発行されたリクエスト全てを中断処理する挙動をするものがあります.
   そのため, タイミングによってはclickビーコンのリクエストが行われない場合があります.
 - SSPおよびDSP間での乖離率に関しては, impビーコン同様に別途約定を締結するものとします.
- エンドポイントの仕様は, 後述の「 impressionまたはclickビーコンの送信について」に準拠しているものとします</td>
  </tr>
</table>


### c. impressionまたは/clickビーコンの送信

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

### d. マクロ置換

SSPは広告HTML(adm)内の以下の文字列を置換したうえで配信します。iab定義の必要な項目をお申し付けください。（他にも必要な項目があれば対応致します）

<table>
  <tr>
    <th>マクロ</th>
  </tr>
  <tr>
    <td>${AUCTION_ID}</td>
  </tr>
  <tr>
    <td>${AUCTION_BID_ID}</td>
  </tr>
  <tr>
    <td>${AUCTION_IMP_ID}</td>
  </tr>
  <tr>
    <td>${AUCTION_SEAT_ID}</td>
  </tr>
  <tr>
    <td>${AUCTION_AD_ID}</td>
  </tr>
  <tr>
    <td>${AUCTION_PRICE} </td>
  </tr>
  <tr>
    <td>${AUCTION_PRICE_IV}</td>
  </tr>
  <tr>
    <td>${AUCTION_CURRENCY}</td>
  </tr>
  <tr>
    <td>${CLICK_URL_ENC} </td>
  </tr>
</table>


暗号化方式（アルゴリズム、鍵長、暗号利用モード）については、事前にSSPとDSPが協議して決定します。（例：CFB 3DES + いわゆるWeb セーフ Base64など）

暗号鍵は決定した方式に基づいて、SSPが発行します。（SSP作業）

### e.リダイレクタ仕様

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

## 4.コード表

ネイティブアドレイアウトIDコード

<table>
  <tr>
    <th>ID</th>
    <th>レイアウト名</th>
    <th>fluctステータス</th>
    <th>必須フィールド</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Content Wall</td>
    <td>-</td>
    <td></td>
  </tr>
  <tr>
    <td>2</td>
    <td>App Wall</td>
    <td>-</td>
    <td></td>
  </tr>
  <tr>
    <td>3</td>
    <td>News Feed</td>
    <td>配信可能</td>
    <td>img,title,data(sponsored,desc)</td>
  </tr>
  <tr>
    <td>4</td>
    <td>Chat List</td>
    <td>-</td>
    <td></td>
  </tr>
  <tr>
    <td>5</td>
    <td>Carousel</td>
    <td>-</td>
    <td></td>
  </tr>
  <tr>
    <td>6</td>
    <td>Content Stream</td>
    <td>-</td>
    <td></td>
  </tr>
  <tr>
    <td>7</td>
    <td>Grid adjoining the content</td>
    <td>-</td>
    <td></td>
  </tr>
  <tr>
    <td>501</td>
    <td>Text Ad</td>
    <td>配信可能</td>
    <td>title,data(sponsored,desc)</td>
  </tr>
  <tr>
    <td>+500</td>
    <td></td>
    <td>他</td>
    <td></td>
  </tr>
</table>


※ レイアウトID毎にrequiredとなっている要素はBidRequestに必ず含めて送信します。

BidResponseに含まれない場合はRTBで落札できた場合でも広告表示/imp通知を行いません。

imgを保持するassetオブジェクトが複数あるケースもあります。

## 5.リクエスト／レスポンスサンプル

### 【bid Request web】

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 0,
      "banner": {
        "h": 50,
        "w": 320,
        "pos": 9
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB1-1", "IAB2" ],
    "domain": "fluct.jp",
    "page": "http://fluct.jp/hoge.html",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "undefined"
  },
  "bcat": [ "IAB5-1", "IAB5-2" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "220.110.139.200"
  },
  "at": 2
}
```

### 【bid request app】

※SSP側で ifa が取得できた場合

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 0,
      "banner": {
        "h": 50,
        "w": 320,
        "pos": 9
      }
    }
  ],
  "app": {
    "id": "1000012671",
    "cat": [ "IAB1-1", "IAB2" ],
    "bundle": "com.example.fluct",
    "storeurl": "https://itunes.apple.com/id123456789",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "2fac1234-31f8-11b4-a222-08002b34c003"
  },
  "bcat": [ "IAB5-1", "IAB5-2" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238",
    "ip": "220.110.139.200",
    "ifa": "2fac1234-31f8-11b4-a222-08002b34c003",
    "lmt": 0
  },
  "at": 2
}
```

### 【bid request native(icon)】

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 0,
      "native": {
        "ver": "1",
        "request":"{\"native\":{\"assets\": [{\"id\": 1,\"title\": {\"len\": 20}},{\"id\": 2,\"img\": {\"hmin\": 160,\"type\": 1,\"wmin\": 160}},{\"id\": 3,\"data\": {\"len\": 30,\"type\": 1}},{\"data\": {\"len\": 50,\"type\": 2},\"id\": 4}],\"layout\": 3}}"
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB1-1", "IAB2" ],
    "domain": "fluct.jp",
    "page": "http://fluct.jp/hoge.html",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "8hekfu378f90dkjdkjl998jkl3jndf98d98732old"
  },
  "bcat": [ "IAB5-1", "IAB5-2" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238",
    "ip": "220.110.139.200"
  },
  "at": 2
}
```

### 【bid request native(main)】

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 0,
      "native": {
        "ver": "1",
        "request":"{\"native\":{\"assets\": [{\"id\": 1,\"title\": {\"len\": 20}},{\"id\": 2,\"img\": {\"hmin\": 320,\"type\": 3,\"wmin\":640}},{\"id\": 3,\"data\": {\"len\": 30,\"type\": 1}},{\"data\": {\"len\": 50,\"type\": 2},\"id\": 4}],\"layout\": 3}}"
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB1-1", "IAB2" ],
    "domain": "fluct.jp",
    "page": "http://fluct.jp/hoge.html",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "8hekfu378f90dkjdkjl998jkl3jndf98d98732old"
  },
  "bcat": [ "IAB5-1", "IAB5-2" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238",
    "ip": "220.110.139.200"
  },
  "at": 2
}
```

### 【bid request pmp】

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 0,
      "banner": {
        "h": 50,
        "w": 320,
        "pos": 9
      },
      "pmp":{
        "private_auction": 1,
        "deals":{
          "id":"AAAA-jndf98d9-dalda"
        }
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB1-1", "IAB2" ],
    "domain": "fluct.jp",
    "page": "http://fluct.jp/hoge.html",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "8hekfu378f90dkjdkjl998jkl3jndf98d98732old"
  },
  "bcat": [ "IAB5-1", "IAB5-2" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "220.110.139.200",
    "ifa": "2fac1234-31f8-11b4-a222-08002b34c003",
    "lmt": 0
  },
  "at": 2
}
```

### 【bid request video】

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "imp": [
    {
      "id": "1",
      "tagid": "14444:1000075047",
      "secure": 0,
      "video": {
        "mimes": [ "video/mp4" ],
        "minduration": 5,
        "maxduration": 60,
        "protocols": [ 2, 3 ],
        "h": 640,
        "w": 480,
        "pos": 1,
        "linearity": 1,
        "placement": 2
      }
    }
  ],
  "site": {
    "id": "1000012671",
    "cat": [ "IAB1-1", "IAB2" ],
    "domain": "fluct.jp",
    "page": "http://fluct.jp/hoge.html",
    "publisher": {
      "id": "461"
    }
  },
  "user": {
    "id": "j98790jjh767yjnijhoou9707c321j313cdag234g",
    "buyeruid": "undefined"
  },
  "bcat": [ "IAB5-1", "IAB5-2" ],
  "badv": [ "blockdomain.com", "blockdomain2.jp" ],
  "tmax": 120,
  "device": {
    "ua": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1",
    "ip": "220.110.139.200"
  },
  "at": 2
}
```

### 【bid response web,app】

```js
{
    "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
    "cur": "JPY",
    "seatbid": [{
        "bid": [{
            "impid": "aud384920dieksjvpowlek231f9d8umxnd87ytgs",
            "price": 50,
            "adm": "<iframe width=\"468\" height=\"60\" marginwidth=\"0\" marginheight=\"0\" hspace=\"0\" vspace=\"0\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\" src=\"http://xxx.net/imp/${AUCTION_PRICE}/${CLICK_URL_ENC}\"></iframe>",
            "adomain": ["adomain.com"]
        }]
    }]
}
```

### 【bid response native(icon/main)】

```js
{
 "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
 "cur": "JPY",
  "seatbid": [{
    "bid": [{
      "impid": "aud384920dieksjvpowlek231f9d8umxnd87ytgs",
      "price": 50,
      "adm": "{\"native\":{\"optouturl\":\"https://dsp.com/optout/\",\"link\":{\"url\":\"http:example.com/click\"},\"imptrackers\":[\"http:example.com/imp/a\",\"http:example.com/imp/b\"],\"assets\":[{\"id\": 1,\"title\":{\"text\":\"タイトルテキスト\"}},{\"img\":{\"url\":\"https://example.com/nativeImage.jpg\",\"w\": 160,\"h\": 160},\"id\": 2},{\"id\": 3,\"data\":{\"value\":\"株式会社fluct\"}},{\"id\": 4,\"data\":{\"value\":\"広告の説明文、fluctは日本で最大手のSSPです。\"}}]}}"
    }]
  }]
}
```

### 【bid response pmp】

```js
{
    "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
    "cur": "JPY",
    "seatbid": [{
        "bid": [{
            "impid": "aud384920dieksjvpowlek231f9d8umxnd87ytgs",
            "price": 50,
            "adm": "<iframe width=\"468\" height=\"60\" marginwidth=\"0\" marginheight=\"0\" hspace=\"0\" vspace=\"0\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\" src=\"http://xxx.net/imp/${AUCTION_PRICE}/${CLICK_URL_ENC}\"></iframe>",
            "dealid": "83921das"
        }]
    }]
}
```

### 【bid response video】

```js
{
  "id": "a954e569-7d4b-4d8a-b39e-414c3ff8c5dc",
  "cur": "JPY",
  "seatbid": [{
    "bid": [{
        "impid": "1",
        "price": 5000,
        "adm": "http://xxx.net/vast/${AUCTION_PRICE}/${CLICK_URL_ENC}",
        "adomain": ["adomain.com"]
    }]
  }]
}
```

### 【jstracker 仕様/サンプルコード】

```js
/**
 *  # fluct SSP's jstracker example
 *
 *
 *  ## Conformance requirements
 *
 *    The key words "MUST", "MUST NOT", "REQUIRED", "SHOULD", "SHOULD NOT",
 *    "RECOMMENDED", "MAY", and "OPTIONAL"
 *    in the normative parts of this document are to be interpreted as described in RFC2119.
 *    https://www.ietf.org/rfc/rfc2119.txt
 *
 *
 *  ## Abstract
 *
 *    fluct SSP's jstracker enables to execute a script provided by DSP,
 *    to fill a gap which other generic protocol feature cannot support.
 *
 *    fluct SSP ensures to invoke jstracker script.
 *    But fluct SSP do not ensure and control the result of evaluating jstracker.
 *
 *  ### Usecases
 *
 *    - DSP MAY:
 *      - measure custom metrics which are not covered by imptrackers or clicktrackers.
 *
 *    - DSP MUST NOT:
 *      - hijack all publisher contents including advertisements.
 *      - or other all violation which breaks real time bidding.
 *        - e.g. display some extra advertisements which are not through RTB.
 *
 *
 *  ## Remarks
 *
 *  ### Execution Environment
 *
 *    - fluct SSP's jstracker is evaluated with using `eval()` or other JavaScript features
 *      to evaluate a string as an executable script.
 *      And jstracker is evaluated as "strict mode" as defined
 *      in [ECMA262 5.1th](http://www.ecma-international.org/ecma-262/5.1/).
 *
 *    - fluct SSP delivers the advertisement to very various user agents.
 *      In some environments (e.g. a page applied [Content Security Policy](https://www.w3.org/TR/CSP/)),
 *      fluct SSP might be failed to evaluate jstracker, or you cannot get the result of it correctly.
 *
 *    - fluct SSP calls jstracker in a timing which cannot call `document.write()`
 *      or other features because fluct SSP is called from `script` element with `async` attributes
 *      or other asynchronous calling. So jstracker must be able to run in such calling timing.
 *
 *  #### non-normative section:
 *
 *  At this moment (September 2016), the bottom line fluct SSP's native RTB supports
 *  are Android 4.1 or iOS 5.1 for mobile web advertisement.
 *  But this bottom line is always flux.
 *  If you'd like to know about it, please contact the person in charge of fluct SSP.
 *
 *
 *  ### Execution Timing
 *
 *    fluct SSP's jstracker will be invoked __BEFORE the advertisement is visible in the page,
 *    CSS rev.2.1, section 2.3.1, The Canvas (https://www.w3.org/TR/CSS2/intro.html#the-canvas)__.
 *    In other words, fluct SSP does not ensure that
 *    whether the advertisement is visible actually when invoking jstracker.
 *
 *    This is by design to integrate with a publisher's page which requires that
 *    to delay displaying an advertisement until they'd like to display it
 *    for a rich pager or other effects for their user.
 *
 *    So if you'd like to track the advertisement impression in jstracker,
 *    you should handle the DOM event which fluct SSP's script fires on the impression.
 *
 *    And we recommend to you that to extend a time limit which your impression beacon lives.
 *
 *
 *  ### Be careful about performance
 *
 *  - If it's available, we recommend to keep down to execute high computational cost operations
 *    for a publisher
 *    - Reduce causing layout computation.
 *    - Handle a scrolling with passive event listener.
 *    - Use Intersection Observer API.
 *
 *  - If it's available, we recommend to keep down a jstracker size for publisher and user.
 *    jstracker will be delivered from fluct's server to the page of publisher.
 *    So the large size jstracker will causes a latency to display the advertisement.
 */

/**
 *  Example of jstracker (non-normative contents).
 *
 *  If you use jstracker in your production, please reduce the byte size of yours.
 *
 *  You can access these variables:
 *    - `aId` {string}
 *      - The value of RTB's `BidResponse.id`.
 */

// Use `img` element to send an impression beacon.
function impByImgElement() {
  var img = document.createElement('img');

  // If your request uses plain http, it will be blocked by user agent (web browser)
  // because of applying mixed content restrictions.
  //  - http://www.w3.org/TR/mixed-content/
  //  - https://developer.mozilla.org/en-US/docs/Web/Security/Mixed_content
  //
  // We recommend to request over TLS (use https scheme).
  img.src = 'https://example.fluct.jp/beacon/special/imgelement';

  // To prevent breaking a page layout by a loaded beacon image,
  // Please dispose them after completing to send a beacon.
  function remover(event) {
    img.removeEventListener('load', remover, false);
    img.removeEventListener('error', remover, false);

    document.body.removeChild(img);
  }
  img.addEventListener('load', remover, false);
  img.addEventListener('error', remover, false);

  document.body.appendChild(img);
}

// Use `XMLHttpReuqest` to send an impression beacon.
//
//  - Your request will be restricted by Cross-Origin Resource Sharing
//    if you use this approach.
//    https://www.w3.org/TR/cors/
//
//  - You might be able to use [`navigator.sendBeacon()`](https://www.w3.org/TR/beacon/)
//    to send an impression beacon instead of `XMLHttpRequest`.
function impByXHR() {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'https://example.fluct.jp/beacon/special/xhr', true);
  xhr.send(null);
}

// this example assign `aId` to `UNIQUE_ID` to explain it clearly.
// If you construct jstracker, you can access to `aId` directly.
var UNIQUE_ID = aId;

// To detect the advertisement is actually shown in
// [CSS rev.2.1, section 2.3.1, The Canvas"](https://www.w3.org/TR/CSS2/intro.html#the-canvas),
// use this event name. fluct SSP will dispatch the DOM Event to `window` on it.
var IMP_EVENT_BY_FLUCT = 'FluctNativeNewsfeedAdShownInCanvas';

window.addEventListener(IMP_EVENT_BY_FLUCT, function onImpression(event) {
  // some advertisement script of fluct SSP might be embedded in the publisher's document at the same time.
  // Thus you should compare `event.uniqueId` with `UNIQUE_ID` to identify the advertisement
  // which this jstracker belongs to.
  if (event.uniqueId !== UNIQUE_ID) {
    return;
  }

  // After identifying, please unregister the needless event handler to release a resource.
  window.removeEventListener(IMP_EVENT_BY_FLUCT, onImpression, false);

  // You can get the node which is the root of the subtree of this advertisement
  // by following operation.
  //
  // This might not an actually advertisement element.
  // This might contain some elements to style the advertisement.
  var FLUCT_PREFIX = 'fluct-native-rtb-container-'
  var subtreeRootOfAdvertisement = document.getElementById(FLUCT_PREFIX + UNIQUE_ID);

  // If you'd like to measure a CSSOM View of the actual advertisement element.
  // You should call this.
  var actualAdvertisement = subtreeRootOfAdvertisement.querySelector('[data-fluct-native-newsfeed-ad-wrapper]');

  // Request custom impression beacons.
  impByImgElement();
  impByXHR();
}, false);
```

