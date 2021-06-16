# fluct RTB Specification ver 2.2

This specification complies with OpenRTB Version 2.5.

See [IAB OpenRTB API Specification Version 2.5](https://www.iab.com/wp-content/uploads/2016/03/OpenRTB-API-Specification-Version-2-5-FINAL.pdf) for details.

### Attention

This specification may be incomplete. If you find any inadequacy or encounter confusion, please contact the person in charge: [developer@fluct.jp](mailto:developer@fluct.jp).

Moreover, this specification does not contain description of general RTB protocol (e.g., OpenRTB).

## Table of Contents

* [1. Cookie Sync](#1-cookie-sync)
* [2. Request/Response Encoding](#2-requestresponse-encoding)
  * [a. Request Encoding](#a-request-encoding)
  * [b. Response Encoding](#b-response-encoding)
* [3. Request Specification](#3-request-specification)
  * [a. Endpoint URL](#a-endpoint-url)
  * [b. OpenRTB Version HTTP Header](#b-openrtb-version-http-header)
  * [c. Bid Request Throttling](#c-bid-request-throttling)
  * [d. Bid Request parameters](#d-bid-request-parameters)
    * [Bid Request Object (Top Level)](#bid-request-object-top-level)
    * [imp Object](#imp-object)
    * [imp.ext Object](#impext-object)
    * [source Object](#source-object)
    * [source.ext Object](#sourceext-object)
    * [site Object](#site-object)
    * [app Object](#app-object)
    * [publisher Object](#publisher-object)
    * [user Object](#user-object)
    * [user.ext Object](#userext-object)
    * [device Object](#device-object)
    * [geo Object](#geo-object)
    * [banner Object](#banner-object)
    * [format Object](#format-object)
    * [video Object](#video-object)
    * [video.ext Object](#videoext-object)
    * [audio Object](#audio-object)
    * [native Object](#native-object)
    * [pmp Object](#pmp-object)
    * [deal Object](#deal-object)
    * [skadn Request Object](#skadn-request-object)
    * [Extended User Identification Object](#extended-user-identification-object)
    * [User ID Object](#user-id-object)
* [4. Response Specification](#4-response-specification)
  * [a. Bid Response Parameters](#a-bid-response-parameters)
    * [Bid Response Object (Top Level)](#bid-response-object-top-level)
    * [seatbid Object](#seatbid-object)
    * [bid Object](#bid-object)
    * [bid.ext Object](#bidext-object)
    * [skadn Response Object](#skadn-response-object)
  * [b. Impression/Click Beacon](#b-impressionclick-beacon)
    * [Endpoint for Impression Beacon](#endpoint-for-impression-beacon)
    * [fluct transmits according to the following conditions (imp beacon):](#fluct-transmits-according-to-the-following-conditions-imp-beacon)
    * [Endpoint for Click Beacon](#endpoint-for-click-beacon)
    * [fluct transmits according to the following conditions (click beacon):](#fluct-transmits-according-to-the-following-conditions-click-beacon)
  * [c. Macro Substitution](#c-macro-substitution)
  * [d. End of CLICK_URL_ENC Macro Support](#d-end-of-click_url_enc-macro-support)
* [5. Code Table](#5-code-table)
* [6. Bid Request/Response Examples](#6-bid-requestresponse-examples)
* [7. iOS 14 Click Logic](#7-ios-14-click-logic)

## 1. Cookie Sync

Usually the following sync will be performed, however we are also able to provide specified flows separately.

1. SSP delivers sync image tags of DSP to ad inventories.
2. DSP redirects to SSP’s sync URL when received access to sync tag.
3. DSP adds an ID parameter to sync URL as a notification to SSP.

DSP should prepare sync tags for SSP in advance. (DSP reponsibility)

Currently we only support image sync tags and https requests.

Below is an example of sync URLs of fluct. HTTPs sync is also supported.

    https://cs.adingo.jp/sync/?from=[DSP_NAME]&id=[DSP_USER_ID]

The DSP_NAME parameter will be provided by SSP beforehand (SSP responsibility), please contact SSP for that.

The expiry date of sync is default to 30 days, however it can also be customized to any length. Below is an example of a sync with 90 days of expiry date.

    https://cs.adingo.jp/sync/?from=your_dsp&id=XXXXXX&expire=90

## 2. Request/Response Encoding

To minimize HTTP traffic exchanged between DSP and Fluct, it is **recommended** to have **both** bid request and response bodies **compressed**.

### a. Request Encoding

Bid requests can be gzip-compressed.
If DSPs wish to receive gzip-compressed bid requests, contact an alliance representative.

Following header is added to a request when its body is gzip-compressed:

    Content-Encoding: gzip

### b. Response Encoding

A response body can be compressed when its request has a header similar to:

    Accept-Encoding: gzip

When returning a compressed response body, such response should have a header similar to:

    Content-Encoding: gzip

## 3. Request Specification

### a. Endpoint URL

The endpoint URL which will be used by bid request should be passed to SSP. (DSP reponsibility)

SSP conducts bid request with POST method to the specified endpoint URL.

For the optimal performance, DSP should enable HTTP keep-alive whenever possible.

https request is also supported.

Please let us know if we need to set the specific Port.

### b. OpenRTB Version HTTP Header

The OpenRTB Version of the request will be passed in bid request HTTP header as:

    X-OpenRTB-Version: 2.5

The version is in format `<major>.<minor>`, and patch version is not included.

Fluct will follow backward-compatible OpenRTB 2 minor version updates, and the version in HTTP header will be updated, accordingly.

### c. Bid Request Throttling

Bid request QPS is controlled based on the ratio of response errors (HTTP status code 500 or above, or receive timeout) per unit time.

As error responses increase, the bid request QPS will be gradually decreased.  Contrarily, as such responses decrease, the QPS will be gradually increased.

### d. Bid Request Parameters

Serialization format: JSON only.


#### Bid Request Object (Top Level)

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td></td>
  </tr>
  <tr>
    <td>imp</td>
    <td>array of imp objects; required</td>
    <td></td>
  </tr>
  <tr>
    <td>site</td>
    <td>site object</td>
    <td></td>
  </tr>
  <tr>
    <td>app</td>
    <td>app object</td>
    <td></td>
  </tr>
  <tr>
    <td>user</td>
    <td>user object</td>
    <td></td>
  </tr>
  <tr>
    <td>bcat</td>
    <td>array of strings; required</td>
    <td></td>
  </tr>
  <tr>
    <td>badv</td>
    <td>array of strings</td>
    <td></td>
  </tr>
  <tr>
    <td>tmax</td>
    <td>integer</td>
    <td>auction timeout in msec</td>
  </tr>
  <tr>
    <td>device</td>
    <td>device object</td>
    <td></td>
  </tr>
  <tr>
    <td>at</td>
    <td>integer</td>
    <td>1=first price auction, 2=second price auction</td>
  </tr>
  <tr>
    <td>wseat</td>
    <td>array of strings</td>
    <td>Whitelist of buyer seats</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>array of strings</td>
    <td>a list of accepted currencies</td>
  </tr>
</table>

* Only one of the "site" and “app” sections will be necessary.


#### imp Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td></td>
  </tr>
  <tr>
    <td>tagid</td>
    <td>string; required</td>
    <td>ex) 1234:987654321</td>
  </tr>
  <tr>
    <td>secure</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>banner</td>
    <td>banner object</td>
    <td></td>
  </tr>
  <tr>
    <td>video</td>
    <td>video object</td>
    <td></td>
  </tr>
  <tr>
    <td>native</td>
    <td>native object</td>
    <td></td>
  </tr>
  <tr>
    <td>pmp</td>
    <td>pmp object</td>
    <td></td>
  </tr>
  <tr>
    <td>instl</td>
    <td>integer</td>
    <td>0=no, 1=yes</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>float</td>
    <td>Floor price</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>string</td>
    <td>Floor price currency</td>
  </tr>
  <tr>
    <td>ext</td>
    <td>imp.ext object</td>
    <td>imp extension object</td>
  </tr>
</table>


#### imp.ext Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>dfp_ad_unit_code</td>
    <td>string; experimental</td>
    <td>Google AdManager Ad unit full path</td>
  </tr>
  <tr>
    <td>skadn</td>
    <td>skadn Request object</td>
    <td>SKAdNetwork request object</td>
  </tr>
</table>


#### source Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>fd</td>
    <td>integer; required</td>
    <td><code>1</code> when upstream source is responsible for the final impression sale decision, or <code>0</code> otherwise.</td>
  </tr>
  <tr>
    <td>tid</td>
    <td>string; experimental</td>
    <td>Transaction ID that is issued by upstream. Otherwise, same as BidRequest.id.</td>
  </tr>
  <tr>
    <td>ext</td>
    <td>source.ext object</td>
    <td>source extension object</td>
  </tr>
</table>


#### source.ext Object

Both [Sellers.json](https://iabtechlab.com/sellers-json/) and [OpenRTB SupplyChain](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md) are available.

Refer to https://adingo.jp/sellers.json for sellers available through fluct.

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>stype</td>
    <td>string; experimental</td>
    <td>Header Bidding type. Contact us for details.</td>
  </tr>
  <tr>
    <td>schain</td>
    <td>supply-chain object</td>
    <td><a href="https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md">OpenRTB SupplyChain object</a></td>
  </tr>
</table>

#### site Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td></td>
  </tr>
  <tr>
    <td>cat</td>
    <td>array of strings</td>
    <td></td>
  </tr>
  <tr>
    <td>domain</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>page</td>
    <td>string; required</td>
    <td></td>
  </tr>
  <tr>
    <td>mobile</td>
    <td>integer</td>
    <td>Indicates if the layout is optimized for mobile devices. 0=No, 1=Yes</td>
  </tr>
  <tr>
    <td>publisher</td>
    <td>publisher object</td>
    <td></td>
  </tr>
</table>


#### app Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td></td>
  </tr>
  <tr>
    <td>cat</td>
    <td>array of strings</td>
    <td></td>
  </tr>
  <tr>
    <td>storeurl</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>string</td>
    <td>Platform-specific application identifier.
ex) Android: "com.foo.mygame", iOS: "1234567890"</td>
  </tr>
  <tr>
    <td>publisher</td>
    <td>publisher object</td>
    <td></td>
  </tr>
</table>


#### publisher Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td></td>
  </tr>
</table>


#### user Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>buyeruid</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>gender</td>
    <td>string</td>
    <td>"M" or "F"</td>
  </tr>
  <tr>
    <td>yob</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>ext</td>
    <td>object</td>
    <td>User extension object</td>
  </tr>
</table>

* When "ifa" is sent, “user.buyeruid” is not sent and “user.id” is set to be the value of “device.ifa”.


#### user.ext Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>eids</td>
    <td>array of eid objects</td>
    <td>[Extended User Identification Objects](#extended-user-identification-object)</td>
  </tr>
</table>


#### device Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>ua</td>
    <td>string; required</td>
    <td></td>
  </tr>
  <tr>
    <td>geo</td>
    <td>geo object</td>
    <td></td>
  </tr>
  <tr>
    <td>ip</td>
    <td>string</td>
    <td>IPv4 Address</td>
  </tr>
  <tr>
    <td>ipv6</td>
    <td>string</td>
    <td>IPv6 Address</td>
  </tr>
  <tr>
    <td>ifa</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>lmt</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>dnt</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>osv</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>h</td>
    <td>integer</td>
    <td>screen height in pixels</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer</td>
    <td>screen width in pixels</td>
  </tr>
</table>

* When device.w and device.h are available, screen orientation can be determined as:
    * when w > h: landscape
    * when h > w: portrait


#### geo Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>lat</td>
    <td>float</td>
    <td>Latitude; -90.0~90.0 where negative is south</td>
  </tr>
  <tr>
    <td>lon</td>
    <td>float</td>
    <td>Longitude; -180.0~180.0 where negative is west</td>
  </tr>
  <tr>
    <td>Type</td>
    <td>integer</td>
    <td>Source of location data; 1=GPS, 2=IP address, 3=User provided</td>
  </tr>
  <tr>
    <td>accuracy</td>
    <td>integer</td>
    <td>Accuracy in meters</td>
  </tr>
  <tr>
    <td>ipservice</td>
    <td>integer</td>
    <td>Provider of IP address geolocation service; 1=ip2location, 2=Neustar, 3=MaxMind, 4=NetAcuity</td>
  </tr>
  <tr>
    <td>country</td>
    <td>string</td>
    <td>Country code in ISO 3166-1 alpha-3</td>
  </tr>
  <tr>
    <td>region</td>
    <td>string</td>
    <td>Region code in ISO 3166-2; 2-letter state code if US</td>
  </tr>
  <tr>
    <td>metro</td>
    <td>string</td>
    <td>Google metro code</td>
  </tr>
  <tr>
    <td>city</td>
    <td>string</td>
    <td>City name</td>
  </tr>
  <tr>
    <td>zip</td>
    <td>string</td>
    <td>Zip or postalcode</td>
  </tr>
  <tr>
    <td>utcoffset</td>
    <td>integer</td>
    <td>Local time offset from UTC in minutes</td>
  </tr>
</table>


#### banner Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>format</td>
    <td>array of format objects</td>
    <td></td>
  </tr>
  <tr>
    <td>h</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>pos</td>
    <td>integer; required</td>
    <td>overlay ad = 9</td>
  </tr>
  <tr>
    <td>vcm</td>
    <td>integer</td>
    <td>
      Relavant only for banner objects in imp.video.companionad.
      0=concurrent,
      1=end-card
    </td>
  </tr>
</table>


#### format Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>h</td>
    <td>integer; required</td>
    <td>height</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer; required</td>
    <td>width</td>
  </tr>
</table>


#### video Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>mimes</td>
    <td>array of strings; required</td>
    <td>
      "video/mp4"
    </td>
  </tr>
  <tr>
    <td>pos</td>
    <td>integer</td>
    <td>overlay ad = 9</td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>array of integers</td>
    <td></td>
  </tr>
  <tr>
    <td>battr</td>
    <td>array of integers</td>
    <td></td>
  </tr>
  <tr>
    <td>h</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>startdelay</td>
    <td>integer</td>
    <td>
      0=pre-roll,
      &gt;0=mid-roll,
      -1=mid-roll,
      -2=post-roll
    </td>
  </tr>
  <tr>
    <td>linearity</td>
    <td>integer</td>
    <td>
      1=in-stream
      2=overlay
    </td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>skip</td>
    <td>integer</td>
    <td>
      0=no, 1=yes
    </td>
  </tr>
  <tr>
    <td>api</td>
    <td>array of integers</td>
    <td></td>
  </tr>
  <tr>
    <td>placement</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>companionad</td>
    <td>array of banner objects</td>
    <td>
      Array of banner objects when supported.
    </td>
  </tr>
  <tr>
    <td>ext</td>
    <td>video.ext object</td>
    <td>
      video extension object
    </td>
  </tr>
</table>


#### video.ext Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>rewarded</td>
    <td>integer</td>
    <td>
      0=no, 1=yes
    </td>
  </tr>
</table>


#### audio Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>mimes</td>
    <td>array of strings; required</td>
    <td>
      "audio/mp4"
    </td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>array of integers</td>
    <td>
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
      0=pre-roll,
      &gt;0=mid-roll,
      -1=mid-roll,
      -2=post-roll
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>array of integers</td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>integer</td>
    <td></td>
  </tr>
  <tr>
    <td>api</td>
    <td>array of integers</td>
    <td>
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
      1=Music Service,
      2=FM/AM Broadcast,
      3=Podcast
    </td>
  </tr>
  <tr>
    <td>stitched</td>
    <td>integer</td>
    <td>
      0=no,
      1=yes
    </td>
  </tr>
</table>


#### native Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>request</td>
    <td>string; required</td>
    <td><a href="native-ads-v1.en.md">fluct Native Ads Spec</a></td>
  </tr>
  <tr>
    <td>ver</td>
    <td>string</td>
    <td></td>
  </tr>
  <tr>
    <td>api</td>
    <td>array of integers</td>
    <td>List of supported API frameworks for this impression</td>
  </tr>
  <tr>
    <td>battr</td>
    <td>array of integers</td>
    <td>Blocked creative attributes</td>
  </tr>
</table>


#### pmp Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>private_auction</td>
    <td>integer; required</td>
    <td></td>
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
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td></td>
  </tr>
  <tr>
    <td>at</td>
    <td>integer</td>
    <td>1=first price auction, 2=second price auction, 3=fixed price</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>float</td>
    <td>Floor price when "at" is 1 or 2, deal price when "at" is 3</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>string</td>
    <td>Floor price currency</td>
  </tr>
  <tr>
    <td>wseat</td>
    <td>array of strings</td>
    <td>Whitelist of buyer seats</td>
  </tr>
  <tr>
    <td>wadomain</td>
    <td>array of strings</td>
    <td>Whitelist of advertiser domains</td>
  </tr>
</table>


#### skadn Request Object

[SKAdNetwork Request Object](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/extensions/community_extensions/skadnetwork.md#bid-request)

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>version</td>
    <td>string; required</td>
    <td>Version of SKAdNetwork supported. Always "2.0" or higher.</td>
  </tr>
  <tr>
    <td>sourceapp</td>
    <td>string; required</td>
    <td>
      Platform-specific application identifier.
      ex) iOS: "1234567890"
    </td>
  </tr>
  <tr>
    <td>skadnetids</td>
    <td>array of strings; required</td>
    <td>SKAdNetworkItem entries in the publisher app's info.plist</td>
  </tr>
</table>


#### Extended User Identification Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>source</td>
    <td>string</td>
    <td>Ad system identifier</td>
  </tr>
  <tr>
    <td>uids</td>
    <td>array of objects</td>
    <td>[User ID Object](#user-id-object)</td>
  </tr>
</table>

Supported ad system identifiers:

* `adserver.org`
* `intimatemerger.com`
* `liveramp.com`


#### User ID Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string</td>
    <td></td>
  </tr>
</table>


## 4. Response Specification

### a. Bid Response Parameters

DSP should serialize bid information with the JSON format.

HTTP 204 No Content is expected for no bid.


#### Bid Response Object (Top Level)

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>string; required</td>
    <td>ID of bid response</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>string; required</td>
    <td>Bid price currency using ISO-4217 code</td>
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
    <th>Type</th>
    <th>Description</th>
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
      ID of the buyer seat.
      Required when bidding for multiple seats.
    </td>
  </tr>
</table>


#### bid Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>impid</td>
    <td>string; required</td>
    <td>Bid target BidRequest.imp.id</td>
  </tr>
  <tr>
    <td>price</td>
    <td>float; required</td>
    <td>Bid price</td>
  </tr>
  <tr>
    <td>adm</td>
    <td>string; required</td>
    <td>
      Ad markup data.
      Substituting macros may be included.
      See response example for details.
    </td>
  </tr>
  <tr>
    <td>adomain</td>
    <td>array of strings; required</td>
    <td>
      A list of advertiser domains.
      When not returned, the bid to a frame where a publisher blocks advertisers by domain is invalid.
    </td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>string; recommended</td>
    <td>
      Platform-specific application identifier.
      ex) Android: "com.foo.mygame", iOS: "1234567890"
    </td>
  </tr>
  <tr>
    <td>cid</td>
    <td>string; recommended</td>
    <td>Campaign ID</td>
  </tr>
  <tr>
    <td>crid</td>
    <td>string; recommended</td>
    <td>Creative ID</td>
  </tr>
  <tr>
    <td>dealid</td>
    <td>string</td>
    <td>Required if bidding for a PMP deal. Reference to BidRequest.imp.pmp.deal.id</td>
  </tr>
  <tr>
    <td>h</td>
    <td>integer; recommended</td>
    <td>Creative height in pixels</td>
  </tr>
  <tr>
    <td>w</td>
    <td>integer; recommended</td>
    <td>Creative width in pixels</td>
  </tr>
  <tr>
    <td>attr</td>
    <td>array of integers; recommended</td>
    <td>
      Creative Attributes.
      See IAB OpenRTB 2.5 specification 5.3 Creative Attributes for details.
    </td>
  </tr>
  <tr>
    <td>cat</td>
    <td>array of strings; recommended</td>
    <td>
      Creative Categories.
      See IAB OpenRTB 2.5 specification 5.1 Content Categories for details.
    </td>
  </tr>
  <tr>
    <td>nurl</td>
    <td>string</td>
    <td>
      Win notice URL to be called if the bid wins the auction.
      Not necessarily indicating delivered, viewed, or billable.
      Substituting macros may be included.
    </td>
  </tr>
  <tr>
    <td>lurl</td>
    <td>string</td>
    <td>
      Loss notice URL to be called if the bid loses the auction.
      Substituting macros may be included.
    </td>
  </tr>
  <tr>
    <td>ext</td>
    <td>bid.ext Object</td>
    <td>bid extension object</td>
  </tr>
</table>


#### bid.ext Object

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>skadn</td>
    <td>skadn Response object</td>
    <td>SKAdNetwork response object</td>
  </tr>
  <tr>
    <td>clicktrackers</td>
    <td>array of strings</td>
    <td>Click trackers for SKAdnetwork response object</td>
  </tr>
</table>


#### skadn Response Object

[SKAdNetwork Response Object](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/extensions/community_extensions/skadnetwork.md#bid-response)

<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>version</td>
    <td>string; required</td>
    <td>Version of SKAdNetwork desired. 2.0 or above.</td>
  </tr>
  <tr>
    <td>network</td>
    <td>string; required</td>
    <td>Should be one of `BidRequest.imp.ext.skadn.skadnetids`.</td>
  </tr>
  <tr>
    <td>campaign</td>
    <td>string; required</td>
    <td>Campaign ID compatible with Apple’s spec.</td>
  </tr>
  <tr>
    <td>itunesitem</td>
    <td>string; required</td>
    <td>Advertiser app's Apple App Store ID. Should match `BidResponse.seatbid.bid.bundle`.</td>
  </tr>
  <tr>
    <td>nonce</td>
    <td>string; required</td>
    <td>Unique ID for each ad response</td>
  </tr>
  <tr>
    <td>sourceapp</td>
    <td>string; required</td>
    <td>
      Platform-specific application identifier.
      Should match `BidRequest.imp.ext.skadn.sourceapp`.
    </td>
  </tr>
  <tr>
    <td>timestamp</td>
    <td>string; required</td>
    <td>Unix time in milliseconds in string.</td>
  </tr>
  <tr>
    <td>signature</td>
    <td>string; required</td>
    <td>Apple SKAdNetwork signature.</td>
  </tr>
</table>


### b. Impression/Click Beacon

The following assumptions are made about URLs which serve beacons:

#### Endpoint for Impression Beacon

* GET method support

* sent by setting URL in src field on img tag (XMLHttpRequest not supported)

#### fluct transmits according to the following conditions (imp beacon):

<table>
  <tr>
    <td>endpoint (URL)</td>
    <td>specified in the bid response</td>
  </tr>
  <tr>
    <td>HTTP method</td>
    <td>GET</td>
  </tr>
</table>

#### Endpoint for Click Beacon

* HTTPS (TLS version 1.2 or above) support
* POST support
* Cross-Origin XMLHttpRequest support (see definition at http://www.w3.org/TR/cors/)

#### fluct transmits according to the following conditions (click beacon):

<table>
  <tr>
    <td>endpoint (URL)</td>
    <td>specified in the bid response</td>
  </tr>
  <tr>
    <td>HTTP method</td>
    <td>POST</td>
  </tr>
  <tr>
    <td>Origin</td>
    <td>origin of tranmission</td>
  </tr>
  <tr>
    <td>Access-Control-Allow-Credentials</td>
    <td>true</td>
  </tr>
  <tr>
    <td>Accept</td>
    <td> */*</td>
  </tr>
</table>


* It is assumed that transmission is done from the browser which delivers the advertisement; hence Cross-Origin XMLHttpRequest is used.
* For some environments navigator.sendBeacon() (as defined at http://www.w3.org/TR/beacon/) is also transmitted.

### c. Macro Substitution

<table>
  <tr>
    <th>Macro</th>
    <th>Description</th>
    <th>adm</th>
    <th>nurl</th>
    <th>lurl</th>
  </tr>
  <tr>
    <td><code>${CLICK_URL_ENC}</code></td>
    <td>
      <strong>(To Be Removed on 2020/12/31)</strong>
      <a href="#d-end-of-click_url_enc-macro-support">End of CLICK_URL_ENC Macro Support</a>
    </td>
    <td>Yes</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td><code>${AUCTION_CURRENCY}</code></td>
    <td>
      Currency code used in the bid.
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_ID}</code></td>
    <td>
      Auction ID from bid request <code>id</code>.
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_IMP_ID}</code></td>
    <td>
      Impression ID from bid request <code>imp.id</code>.
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_LOSS}</code></td>
    <td>
      Auction loss reason codes.
      See IAB OpenRTB 2.5 specification 5.25 Loss Reason Codes for details.
    </td>
    <td></td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_PRICE}</code></td>
    <td>
      Auction clearing price.
      Encryption is optional.
      Substituted to <code>AUDIT</code> in the creative review process.
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_PRICE_IV}</code></td>
    <td>
      Initialization vector (IV) for the auction clearing price encryption.
      Substituted when the encryption algorithm requires IV generation.
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><code>${AUCTION_SECOND_PRICE}</code></td>
    <td>
      Auction second price.
      Encryption is optional.
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td></td>
  </tr>
  <tr>
    <td><code>${AUCTION_SECOND_PRICE_IV}</code></td>
    <td>
      Initialization vector (IV) for the auction second price encryption.
      Substituted when the encryption algorithm requires IV generation.
    </td>
    <td>Yes</td>
    <td>Yes</td>
    <td></td>
  </tr>
  <tr>
    <td><code>${IS_PREVIEW}</code></td>
    <td>
      Substituted to <code>1</code> in the creative review pricess, otherwise substituted to <code>0</code>.
    </td>
    <td>Yes</td>
    <td></td>
    <td></td>
  </tr>
</table>

* Cipher system (algorithm, key length, block cipher modes of operation) should be decided beforehand. (e.g., CFB 3DES + the so called Web safe Base64 etc.)
    * Fluct issues the encryption key after cipher system has been determined.
* Unless otherwise specified, macros are not substituted during the creative review process.
* Additional macros may be implemented when demanded.


### d. End of CLICK_URL_ENC Macro Support

As a part of the systems improvement, Fluct is going to drop support for the Fluct-defined click-measurement macro, `${CLICK_URL_ENC}`, on **December 31, 2020**.
After the date, the ad click-through may not navigate viewer browser to the landing page if the macro exists in the ADM.
In order to prevent unexpected click behavior, please remove the macro completely before the date.


## 5. Code Table


## 6. Bid Request/Response Examples

### Request Examples

See [version2.req-examples.md](./version2.req-examples.md) for details.

### Response Examples

See [version2.res-examples.md](./version2.res-examples.md) for details.

## 7. iOS 14 Click Logic
When DSP returns skadn object with a valid itunesitem, fluct's iOS SDK supports below special click logic in addition to regular click logic. Please also see [clicktrackers in bid.ext](#bidext-object).

### Video
- Fluct supports click tracking through the VAST `<ClickThrough>`, and we stop redirecting once we reach non-redirect response.
- Fluct supports click tracking through the VAST `<CompanionClickThrough>`, and we stop redirecting once we reach non-redirect response.
- The same logic applies for static, iFrame and HTML end cards.

### Display
- Fluct supports click tracking through click through URL, and we stop redirecting once we reach non-redirect response. 
