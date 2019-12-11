# fluct Native Ads Spec 1.0

fluct Native Ads Spec 1.0 は、 IAB OpenRTB Native Ads Spec 1.0 に準拠しています。


## Table of Contents

* [変更履歴](#変更履歴)
* [Native Ad Request Markup Object](#native-ad-request-markup-object)
  * [assets Object](#assets-object)
  * [title Object](#title-object)
  * [img Object](#img-object)
  * [data Object](#data-object)
* [Native Ad Response Markup Object](#native-ad-response-markup-object)
  * [imptrackers, jstracker, clicktrackers の取り扱い](#imptrackers-jstracker-clicktrackers-の取り扱い)
    * [imptrackers](#imptrackers)
    * [jstracker](#jstracker)
    * [clicktrackers](#clicktrackers)
* [Bid Request/Response におけるレイアウト ID とアセットの関連](#bid-requestresponse-におけるレイアウト-id-とアセットの関連)
* [Examples](#examples)
  * [Native jstracker example](#native-jstracker-example)


## 変更履歴

[CHANGELOG-NATIVE-ADS](./CHANGELOG-NATIVE-ADS.md)


## Native Ad Request Markup Object

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
    <td>integer</td>
  </tr>
  <tr>
    <td>adunit</td>
    <td>recommended</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>plcmtcnt</td>
    <td>optional</td>
    <td>広告表示数 integer</td>
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

* assetsはBid Responseにも同じ構成で含まれていることを前提としています。
* assetsに設定されている項目でも、メディア側の設定によって項目が非表示になることがあります。(必須表示項目がある場合、接続前にご一報いただけると幸いです)
* layoutについては末尾に補足がございます。


### assets Object

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

* bid request として title, img, data.type=1 (sponsored), data.type=2 (desc) のみを送信します。


### title Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>len</td>
    <td>required</td>
    <td>タイトルの最大文字列長 (デザインによっては表示時に短くなることもある)</td>
  </tr>
</table>


### img Object

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
    <td>1=Icon, 3=Main</td>
  </tr>
</table>


### data Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>type</td>
    <td>required</td>
    <td>
      アセットタイプ
      1=sponsored, 2=desc
    </td>
  </tr>
  <tr>
    <td>len</td>
    <td>required</td>
    <td>文字長(文字列他)</td>
  </tr>
</table>


## Native Ad Response Markup Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <td>detail</td>
  </tr>
  <tr>
    <td>native.optouturl</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.link.url</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.imptrackers</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.assets</td>
    <td>required</td>
    <td>native.assets の各要素は title, img, data のいずれかをひとつ含んでいます。 後述のレスポンスサンプルを参考にしてください。 (同一impidのBid Requestのassetと同じものが返却されてくることを想定しています)</td>
  </tr>
  <tr>
    <td>native.assets.id</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.assets.title.text</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.assets.img.url</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.assets.img.w</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.assets.img.h</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.assets.data.value</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>native.jstracker</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>native.link.clicktrackers</td>
    <td>optional</td>
    <td></td>
  </tr>
</table>


### imptrackers, jstracker, clicktrackers の取り扱い

#### imptrackers

* impressionビーコンのリクエストの送信先のURLエンドポイント.
* ${AUCTION_PRICE} などのマクロ文字列を必要に応じて組み込んでください.
* 用いるプロトコルについて別途定義します.
* 複数項目が格納されている場合でも, 配列の一番目のみ使用します.

**実行タイミングについて**

* 実際に広告がページ中に表示されたタイミングでリクエストを発行します.
* viewport(\*1)中に表示されたか否かではなく, ページ中すなわちcanvas(\*2)において表示されているか否かのタイミングでのリクエストの発行となります.

* \*1: http://www.w3.org/TR/CSS21/visuren.html#viewport
* \*2: http://www.w3.org/TR/CSS21/intro.html#canvas

**制約事項**

* エンドポイントの仕様は, 後述の「 impressionまたはclickビーコンの送信について」に準拠しているものとします

#### jstracker

* DSP側で任意のスクリプトを実行したい場合に, JavaScript(\*1)として実行可能な文字列.
* 複数項目が格納されている場合でも, 配列の一番目のみ使用します.

**利用用途**

* viewable impressionの測定, クリック位置の計測など, 表示された広告に関する情報の計測目的の利用を想定しています.
* 上述の目的以外（第三者配信, 表示された広告要素の見た目の動的な書き換え）などには用いないでください.

**各レスポンスに対応する広告要素の特定について**

NOTE: 本機能（各レスポンスに対応する広告要素の特定）に関しては, 現時点のfluctではサポートされていません（併記されている内容は, 現在検討中の手法の例となります）.

* 本項の機能が必要な場合はfluct担当者までお問い合わせください.
* ページ中から当該の広告要素にアクセスしたい場合, 広告要素をあわらすDOMのサブツリーのrootとなる要素に対して, fluct-native-rtb-container--XXXXの形式で表現される`id`属性を指定しているので, それを用いてアクセスしてください.
* XXXXはDSP側でオークション時に算出の可能な任意の識別子文字列に置換されます.

例:

```javascript
var element = document.getElementById('fluct-native-rtb-container-123456');
```

**制約事項**

* スクリプト文字列は `(function(){...})();` で囲ってください(...がスクリプト本体を表します）
* スクリプト文字列はstrict modeとして実行可能なコードである必要があります.
* Content Security Policy(\*2)の制約などにより, 広告が掲載されるメディアによっては実行されない場合があります.
* スクリプトが実行される可能性のあるWebブラウザまたはJavaScriptエンジンの環境に関しては本仕様の範囲では定義しません.
* このスクリプトの実行に伴い, なんらかのエラーが発生しのimpビーコンまたはclickビーコンの発行を保証できない場合があります.

**実行されるタイミング**

* ページ中に要素が挿入された時点で実行を開始します.

NOTE: 広告要素が表示されたタイミング（impビーコンの発行タイミング）の以前に実行される場合があります.

* \*1: www.ecma-international.org/ecma-262/5.1/ で定義された言語仕様とする.
* \*2: http://www.w3.org/TR/CSP/

#### clicktrackers

* clickビーコンのリクエストの送信先のURLエンドポイント.
* 用いるプロトコルについては別途定義します.
* 複数項目が格納されている場合でも, 配列の一番目のみ使用します.

**実行タイミングについて**

* 広告要素のリンクがクリックされた時点でビーコンへのリクエスト発行処理を開始します.

**制約事項**

* Webブラウザによってはページ遷移時に, 遷移前のページで発行されたリクエストの完了を待たずに遷移前のページで発行されたリクエスト全てを中断処理する挙動をするものがあります. そのため, タイミングによってはclickビーコンのリクエストが行われない場合があります.
* SSPおよびDSP間での乖離率に関しては, impビーコン同様に別途約定を締結するものとします.
* エンドポイントの仕様は, 後述の「 impressionまたはclickビーコンの送信について」に準拠しているものとします


## Bid Request/Response におけるレイアウト ID とアセットの関連

<table>
  <tr>
    <th>layout</th>
    <th>required</th>
  </tr>
  <tr>
    <td>3 (NewsFeed)</td>
    <td>img,title,data(sponsored, desc)</td>
  </tr>
  <tr>
    <td>501 (TextAd)</td>
    <td>title,data(sponsored, desc)</td>
  </tr>
</table>

* レイアウト ID 毎に required となっている要素は Bid Request に必ず含めて送信します。
* Bid Response に含まれない場合は RTB で落札できた場合でも広告表示/imp通知を行いません。
* imgを保持するassetオブジェクトが複数あるケースもあります。


## Examples

### Native jstracker example

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
