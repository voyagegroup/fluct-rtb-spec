# fluct Native Ads Spec 1.0

fluct Native Ads Spec 1.0 is based on IAB OpenRTB Native Ads Spec 1.0.


## Table of Contents

* [Changelog](#changelog)
* [Native Ad Request Markup Object](#native-ad-request-markup-object)
  * [assets Object](#assets-object)
  * [title Object](#title-object)
  * [img Object](#img-object)
  * [data Object](#data-object)
* [Native Ad Response Markup Object](#native-ad-response-markup-object)
  * [imptrackers, jstracker, clicktrackers](#imptrackers-jstracker-clicktrackers)
    * [imptrackers](#imptrackers)
    * [jstracker](#jstracker)
    * [clicktrackers](#clicktrackers)
* [Layout ID and Assets Relationship in Bid Request/Response](#layout-id-and-assets-relationship-in-bid-requestresponse)
* [Examples](#examples)
  * [Native jstracker example](#native-jstracker-example)


## Changelog

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
    <td>The number of identical placements in this layout. integer</td>
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

* Assets in the Bid Response is to be the same structure of that in the Bid Request.
* Some assets may be unused depending on media implementation.
* See the end of this document for details


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
    <td></td>
  </tr>
  <tr>
    <td>title</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>img</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>data</td>
    <td>optional</td>
    <td></td>
  </tr>
</table>

* Only one of the "title", “img” and “data” sections will be necessary in “assets object”.


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
    <td></td>
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
    <td></td>
  </tr>
  <tr>
    <td>hmin</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>type</td>
    <td></td>
    <td>1(Icon) / 3(Main)</td>
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
    <td></td>
  </tr>
  <tr>
    <td>len</td>
    <td>required</td>
    <td></td>
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
    <td>Each element of "native.assets" must include one of "title", "img", or "data". The fields in the response are expected to match those of the bid request, see Bid Response Samples below.</td>
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


### imptrackers, jstracker, clicktrackers

#### imptrackers

* URL of the impression beacon
* Macros (${AUCTION_PRICE}, etc.) must be included in the URL.
* Protocol will be determined separate from this document.
* In the case of multiple values only the first will be used.

The imptracker URL will be called when the advertisement is displayed in the page/"canvas"(\*1).  (as opposed to in the "viewport"(\*2))

* \*1: http://www.w3.org/TR/CSS21/intro.html#canvas
* \*2: http://www.w3.org/TR/CSS21/visuren.html#viewport

also refer to section below information

#### jstracker

* Optional JavaScript(\*1) to be executed.
* In the case of multiple values only the first will be used.

**Uses**

* For measurement of viewable impressions, click position, or other ad properties not for 3rd party delivery, dynamic display, etc.

**Custom advertisement elements**

NOTE: The specification for this functionality is for future use and not yet implemented. Contact fluct if you require custom functionality.

* Advertisement elements are accessed from within the page via the fluct-native-rtb-container-XXXX element (relative to the DOM root).
* "XXXX" is replaced on the DSP side by an optional suffix.

example:

```javascript
var element = document.getElementById('fluct-native-rtb-container-123456');
```

**Restrictions**

* Script must be wrapped with `(function(){...})();`
* Script must be executable in strict mode.
* Content Security Policy(\*2) may prevent certain media from being displayed.
* This document does not specify web browsers or JavaScript engines needed to execute the script.
* fluct is not responsible for errors in the script which prevent proper functioning of the impression and click beacons.

**Execution timing**

* Begins when the element is inserted into the page.

NOTE: In certain cases this may be prior to the advertisement being shown.

* \*1: www.ecma-international.org/ecma-262/5.1/
* \*2: http://www.w3.org/TR/CSP/

#### clicktrackers

* URL of the click beacon
* Protocol will be determined separate from this document.
* In the case of multiple values only the first will be used.

**Execution timing**

* Occurs when the link in the advertisement is clicked..

**Restrictions**

* There may be browsers for which redirection occurs before the beacon request is completed.
* Method of resolution of discrepancies between SSP and DSP will be determined separate from this document.
* also refer to section below information


## Layout ID and Assets Relationship in Bid Request/Response

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

* The above required items will be sent for each native layout.
* Impressions will not be generated for responses which do not also contain the corresponding items.
* There may be requests with multiple img asset objects.


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
