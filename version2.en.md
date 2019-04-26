# fluct RTB Specification ver 2.2

This specification is based on OpenRTB 2.5.

See [IAB OpenRTB API Specification Version 2.5](https://www.iab.com/wp-content/uploads/2016/03/OpenRTB-API-Specification-Version-2-5-FINAL.pdf) for details.

### Attention

This specification may be incomplete. If you find any inadequacy or encounter confusion, please contact the person in charge: [fluct_dev@voyagegroup.info](mailto:fluct_dev@voyagegroup.info).

Moreover, this specification does not contain description of general RTB protocol (e.g., OpenRTB).

## Table of Contents

* [1. cookie sync](#1-cookie-sync)
* [2. Request specification](#2-request-specification)
   * [a. Endpoint URL](#a-endpoint-url)
   * [b. Bid request parameters](#b-bid-request-parameters)
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
      * [audio Object](#audio-object) (Experimental)
      * [pmp Object](#pmp-object)
      * [Native Object (new)](#native-object-new)
      * [Native Markup Request Object](#native-markup-request-object)
      * [deals Object](#deals-object)
      * [assets Object](#assets-object)
      * [title Object](#title-object)
      * [img Object](#img-object)
      * [data Object](#data-object)
      * [Native Object (old)](#native-object-old)
* [3. Response specification](#3-response-specification)
   * [a. Bid response parameters](#a-bid-response-parameters)
      * [BidResponse Object (TopLevel)](#bidresponse-object-toplevel)
      * [Bid Object](#bid-object)
      * [Seatbid Object](#seatbid-object)
      * [native response adm (serialized JSON object)](#native-response-adm-serialized-json-object)
   * [b. imptrackers, jstracker, clicktrackers](#b-imptrackers-jstracker-clicktrackers)
      * [imptrackers](#imptrackers)
      * [jstracker](#jstracker)
      * [clicktrackers](#clicktrackers)
      * [impression/click beacon](#impressionclick-beacon)
      * [endpoint for impression beacon](#endpoint-for-impression-beacon)
      * [fluct transmits according to the following conditions (imp beacon):](#fluct-transmits-according-to-the-following-conditions-imp-beacon)
      * [endpoint for click beacon](#endpoint-for-click-beacon)
      * [fluct transmits according to the following conditions (click beacon):](#fluct-transmits-according-to-the-following-conditions-click-beacon)
   * [c. Macro substitution](#c-macro-substitution)
   * [d. Click Measuring](#d-click-measuring)
* [4. Code table](#4-code-table)
* [5. Bid Request/Response Samples](#5-bid-requestresponse-samples)
   * [Bid Request: web](#bid-request-web)
   * [Bid request: app](#bid-request-app)
   * [Bid request: native(icon)](#bid-request-native-icon)
   * [Bid request: native(main)](#bid-request-native-main)
   * [Bid request: pmp](#bid-request-pmp)
   * [Bid request: video](#bid-request-video)
   * [Bid request: video with end-card](#bid-request-video-with-end-card)
   * [Bid request: audio](#bid-request-audio)
   * [Bid request: with source](#bid-request-with-source)
   * [Bid response: web,app](#bid-response-webapp)
   * [Bid response: native(icon/main)](#bid-response-native-iconmain)
   * [Bid response: pmp](#bid-response-pmp)
   * [Bid response: video](#bid-response-video)
   * [Bid response: audio](#bid-response-audio)
   * [Native jstracker example](#native-jstracker-example)

## 1. cookie sync

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

## 2. Request specification

### a. Endpoint URL

The endpoint URL which will be used by bid request should be passed to SSP. (DSP reponsibility)

SSP conducts bid request with POST method to the specified endpoint URL.

In order to speed up the process, please turn on HTTP keep alive support if possible.

https request is also supported.

Please let us know if we need to set the specific Port.

### b. Bid request parameters

Serialize format: one among Google Protobuf, JSON, MessagePack.

(* Although we have some integration experiences using non-text-based MessagePack, we strongly recommand not to use it, non-text-based MessagePack will not be supported in the future)

Please inform SSP which serialize format should be used. (DSP reponsibility)

The following is a JSON example:

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
    <td></td>
  </tr>
  <tr>
    <td>imp</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>site</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>app</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>user</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>bcat</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>badv</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>tmax</td>
    <td>optional</td>
    <td>120ms</td>
  </tr>
  <tr>
    <td>device</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>at</td>
    <td>optional</td>
    <td>1=first price auction, 2=second price auction, integer</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>optional</td>
    <td>string array</td>
  </tr>
</table>


* Only one of the "site" and “app” sections will be necessary.

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
    <td></td>
  </tr>
  <tr>
    <td>tagid</td>
    <td>required</td>
    <td>ex) 1234:987654321</td>
  </tr>
  <tr>
    <td>secure</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>banner</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>video</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>pmp</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>native</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>instl</td>
    <td>optional</td>
    <td>0=no, 1=yes, integer</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>optional</td>
    <td>Floor price, float</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>optional</td>
    <td>Floor price currency, string</td>
  </tr>
  <tr>
    <td>ext.dfp_ad_unit_code</td>
    <td>optional, experimental</td>
    <td>Google AdManager Ad unit full path</td>
  </tr>
</table>


#### source Object

It is set if the transaction in the ad exchange such as Header Bidding. Otherwise, empty (`{}`).

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>fd</td>
    <td>required</td>
    <td>integer. Always <code>1</code> if source object is set.</td>
  </tr>
  <tr>
    <td>tid</td>
    <td>optional, experimental</td>
    <td>string. Transaction ID that issued by upstream. Otherwise, same as BidRequest.id.</td>
  </tr>
  <tr>
    <td>ext.stype</td>
    <td>optional, experimental</td>
    <td>string. Header Bidding type. Please contact us for details.</td>
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
    <td></td>
  </tr>
  <tr>
    <td>cat</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>domain</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>page</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>mobile</td>
    <td>optional</td>
    <td>Indicates if the layout is optimized for mobile devices. 0=No, 1=Yes, integer</td>
  </tr>
  <tr>
    <td>publisher</td>
    <td>optional</td>
    <td></td>
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
    <td></td>
  </tr>
  <tr>
    <td>cat</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>storeurl</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>optional</td>
    <td>Platform-specific application identifier
ex) Android: "com.foo.mygame", iOS: "1234567890"</td>
  </tr>
  <tr>
    <td>publisher</td>
    <td>optional</td>
    <td></td>
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
    <td></td>
  </tr>
  <tr>
    <td>buyeruid</td>
    <td>optional</td>
    <td></td>
  </tr>
</table>


* When "ifa" is sent, “user.buyeruid” is not sent and “user.id” is set to be the value of “device.ifa”. 

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
    <td></td>
  </tr>
  <tr>
    <td>ip</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>ifa</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>lmt</td>
    <td>optional</td>
    <td></td>
  </tr>
  <tr>
    <td>dnt</td>
    <td>optional</td>
    <td></td>
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
    <td>h</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>w</td>
    <td>required</td>
    <td></td>
  </tr>
  <tr>
    <td>pos</td>
    <td>required</td>
    <td>overlay ad = 9</td>
  </tr>
  <tr>
    <td>vcm</td>
    <td>optional</td>
    <td>
      Relavant only for banner objects in imp.video.companionad.
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
    <td>height integer</td>
  </tr>
  <tr>
    <td>w</td>
    <td>required</td>
    <td>width integer</td>
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
      "video/mp4",
      string array
    </td>
  </tr>
  <tr>
    <td>pos</td>
    <td>optional</td>
    <td>overlay ad = 9, integer</td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>optional</td>
    <td>integer array</td>
  </tr>
  <tr>
    <td>battr</td>
    <td>optional</td>
    <td>
      integer array
    </td>
  </tr>
  <tr>
    <td>h</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>w</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>startdelay</td>
    <td>optional</td>
    <td>
      0=pre-roll,
      &gt;0=mid-roll,
      -1=mid-roll,
      -2=post-roll,
      integer
    </td>
  </tr>
  <tr>
    <td>linearity</td>
    <td>optional</td>
    <td>
      1=in-stream
      2=overlay
    </td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>skip</td>
    <td>optional</td>
    <td>
      0=no, 1=yes, integer
    </td>
  </tr>
  <tr>
    <td>api</td>
    <td>optional</td>
    <td>integer array</td>
  </tr>
  <tr>
    <td>placement</td>
    <td>optional</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>companionad</td>
    <td>optional</td>
    <td>
      Array of <a href="#banner-object">banner objects</a> when supported.
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
      "audio/mp4", string array
    </td>
  </tr>
  <tr>
    <td>minduration</td>
    <td>optional</td>
    <td>
      integer
    </td>
  </tr>
  <tr>
    <td>maxduration</td>
    <td>optional</td>
    <td>
      integer
    </td>
  </tr>
  <tr>
    <td>protocols</td>
    <td>optional</td>
    <td>
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
      0=pre-roll,
      &gt;0=mid-roll,
      -1=mid-roll,
      -2=post-roll,
      integer
    </td>
  </tr>
  <tr>
    <td>battr</td>
    <td>optional</td>
    <td>
      integer array
    </td>
  </tr>
  <tr>
    <td>minbitrate</td>
    <td>optional</td>
    <td>
      integer
    </td>
  </tr>
  <tr>
    <td>maxbitrate</td>
    <td>optional</td>
    <td>
      integer
    </td>
  </tr>
  <tr>
    <td>api</td>
    <td>optional</td>
    <td>
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
      1=Music Service,
      2=FM/AM Broadcast,
      3=Podcast,
      integer
    </td>
  </tr>
  <tr>
    <td>stitched</td>
    <td>optional</td>
    <td>
      0=no,
      1=yes,
      integer
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
    <td></td>
  </tr>
  <tr>
    <td>deals</td>
    <td>required</td>
    <td></td>
  </tr>
</table>


#### Native Object (new)

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
    <td>List of supported API frameworks for this impression. 
integer array</td>
  </tr>
  <tr>
    <td>battr</td>
    <td>optional</td>
    <td>Blocked creative attributes.
integer array</td>
  </tr>
</table>

In the specification of openRTB, request is correctly included in NativeObject. 
In a connected DSP, there are cases where assets is included in nativeObject.  
Connected DSPs can be connected without any change. 
Express the specification of the previous NativeObject as `b-17. Native Object (old)`. 

There is no need to change from old to new, but please request case to change. 
There is also the possibility of requesting that we change to the newer one at a certain timing from our company. 

#### Native Markup Request Object

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
    <td>adapting layoutId
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
    <td>integer</td>
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

* "assets" in BidResponse is to be the same structure of that in BidRequest.

* see the end of this document for details

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
    <td></td>
  </tr>
  <tr>
    <td>at</td>
    <td>optional</td>
    <td>1=first price auction, 2=second price auction, 3=fixed price, integer</td>
  </tr>
  <tr>
    <td>bidfloor</td>
    <td>optional</td>
    <td>Floor price when "at" is 1 or 2, deal price when "at" is 3, float</td>
  </tr>
  <tr>
    <td>bidfloorcur</td>
    <td>optional</td>
    <td>Floor price currency, string</td>
  </tr>
  <tr>
    <td>wseat</td>
    <td>optional</td>
    <td>Whitelist of buyer seats, string array</td>
  </tr>
  <tr>
    <td>wadomain</td>
    <td>optional</td>
    <td>Whitelist of advertiser domains, string array</td>
  </tr>
</table>


#### assets Object

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

#### title Object

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


#### img Object

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


※"wmin” and "hmin” are set as predetermined by DSP 
(NewsFeed type:1 as 160x160 , type:3 as depending on design)

#### data Object

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

#### Native Object (old)

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>ver</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>assets</td>
    <td>assets Object</td>
    <td></td>
  </tr>
  <tr>
    <td>layout</td>
    <td></td>
    <td>3/501</td>
  </tr>
</table>


* "assets" in BidResponse is to be the same structure of that in BidRequest.

* see the end of this document for details

* native layouts/required assets

<table>
  <tr>
    <th>layout</th>
    <th>required</th>
  </tr>
  <tr>
    <td>3 (NewsFeed)</td>
    <td>img,title,data(sponsored)</td>
  </tr>
  <tr>
    <td>501 (TextAd)</td>
    <td>title,data(sponsored)</td>
  </tr>
</table>


* The above required items will be sent for each native layout.

Impressions will not be generated for responses which do not also contain the corresponding items.

Multiple asset objects containing img items may exist.

#### publisher Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>required</td>
    <td>string</td>
  </tr>
</table>

## 3. Response specification

### a. Bid response parameters

DSP should serialize bid information with the same format used in request serialization. 

HTTP 204 No Content is expected for no bid

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
    <td>ID of bid response</td>
  </tr>
  <tr>
    <td>cur</td>
    <td>required</td>
    <td>string</td>
    <td>Bid price currency using ISO-4217 code</td>
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
    <td>Bid target BidRequest.imp.id</td>
  </tr>
  <tr>
    <td>price</td>
    <td>required</td>
    <td>float</td>
    <td>Bid price</td>
  </tr>
  <tr>
    <td>adm</td>
    <td>required</td>
    <td>string</td>
    <td>Ad data. 広告フォーマットにより内容の形式は異なります。レスポンスサンプルを参照してください。</td>
  </tr>
  <tr>
    <td>adomain</td>
    <td>optional (recommended)</td>
    <td>array of string</td>
    <td>広告遷移先のドメインのリスト</td>
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
    <td>pmp入札の場合必須項目. 入札対象のBidRequest.imp.pmp.dealid</td>
  </tr>
</table>

#### native response adm (serialized JSON object)

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

### b. imptrackers, jstracker, clicktrackers

#### imptrackers

URL of the impression beacon
Macros (${AUCTION_PRICE}, etc.) must be included in the URL.
Protocol will be determined separate from this document.
In the case of multiple values only the first will be used.

The imptracker URL will be called when the advertisement is displayed in the page/"canvas"(*1).  (as opposed to in the "viewport"(*2))

* *1: http://www.w3.org/TR/CSS21/intro.html#canvas
* *2: http://www.w3.org/TR/CSS21/visuren.html#viewport

also refer to section below information

#### jstracker

Optional JavaScript(*1) to be executed.
In the case of multiple values only the first will be used.

Uses

for measurement of viewable impressions, click position, or other ad properties
not for 3rd party delivery, dynamic display, etc.

Custom advertisement elements

NOTE: The specification for this functionality is for future use and not yet implemented. Contact fluct if you require custom functionality.
Advertisement elements are accessed from within the page via the fluct-native-rtb-container-XXXX element (relative to the DOM root).
"XXXX" is replaced on the DSP side by an optional suffix.

```
example: var element = document.getElementById('fluct-native-rtb-container-123456');
```

Restrictions

Script must be wrapped with `(function(){...})();` 
Script must be executable in strict mode.
Content Security Policy(*2) may prevent certain media from being displayed.
This document does not specify web browsers or JavaScript engines needed to execute the script.
fluct is not responsible for errors in the script which prevent proper functioning of the impression and click beacons.

Execution timing

Begins when the element is inserted into the page.
NOTE: In certain cases this may be prior to the advertisement being shown.

* *1: www.ecma-international.org/ecma-262/5.1/
* *2: http://www.w3.org/TR/CSP/

#### clicktrackers

URL of the click beacon
Protocol will be determined separate from this document.
In the case of multiple values only the first will be used.

Execution timing

- Occurs when the link in the advertisement is clicked..

Restrictions

- There may be browsers for which redirection occurs before the beacon request is completed.
- Method of resolution of discrepancies between SSP and DSP will be determined separate from this document.
- also refer to section below information

#### impression/click beacon

The following assumptions are made about URLs which serve beacons:

##### endpoint for impression beacon

* GET method support

* sent by setting URL in src field on img tag (XMLHttpRequest not supported)

##### fluct transmits according to the following conditions (imp beacon):

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


##### endpoint for click beacon

* HTTPS (TLS version 1.2 or above) support

* POST support

* Cross-Origin XMLHttpRequest support (see definition at http://www.w3.org/TR/cors/)

##### fluct transmits according to the following conditions (click beacon):

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

### c. Macro substitution

SSP will substitute the following strings in ad HTML (adm) before delivering.

(Others may also be supported by request.)

<table>
  <tr>
    <th>macro</th>
    <th>description</th>
  </tr>
  <tr>
    <td>${AUCTION_PRICE} </td>
    <td>The encoded winning price. In the creative review process, it is substituted to the string <code>AUDIT</code>.</td>
  </tr>
  <tr>
    <td>${CLICK_URL_ENC} </td>
    <td>The url-encoded redirector URL. </td>
  </tr>
  <tr>
    <td>${IS_PREVIEW}</td>
    <td>Normally substituted to 0. In the creative review process, it is substituted to 1.</td>
  </tr>
</table>


Cipher system (algorithm, key length, block cipher modes of operation) should be discussed and decided by SSP and DSP beforehand. (e.g., CFB 3DES + the so called Web safe Base64 etc.)

SSP issues the encryption key after cipher system has been determined. (SSP responsibility)

### d. Click Measuring

Basically, fluct provides a redirector URL for click measuring. The redirector URL is somthing like the following:

http://rd.adingo.jp/?p=rKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds&v=e0e8nlDL6O0.&k=1&guid=ON&u=...

**the value of the last "u=" parameter indicates the landing page URL.**

And usually fluct's redirector URL for click measuring is used in 3 ways:

#### Method A: embedding the landing page URL into fluct redirector URL in the creative html of bid response.

Redirecting route: Web Page -> Company redirector -> fluct redirector -> Landing page

1. Company embeds a creative html like the following in bid response, (say the "r=" parameter indicates the landing page URL)

```html
<a href="http://dsp.example.com/?id=12345678&**r=${CLICK_URL_ENC}___TWICE_encoded_landing_page_URL___**"><img...></a>
```

Notice that the landing page URL should be **twice encoded**. Below is an example:

```html
<a href="http://dsp.example.com/?id=12345678&r=${CLICK_URL_ENC}http%253A%252F%252Fexample.com"><img...></a>
```

2. fluct will expand the creative html into this: (say the landing page URL is http://lp.example.net)

```html
<a href="http://dsp.example.com/?id=12345678&r=http%3A%2F%2Frd.adingo.jp%2F%3Fp%3DrKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds%26v%3De0e8nlDL6O0.%26k%3D1%26guid%3DON%26u%3Dhttp%253A%252F%252Flp.example.net"><img...></a>
```

3. When clicked, company should redirect to fluct click measuring redirector URL:

    http://rd.adingo.jp/?p=rKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds&v=e0e8nlDL6O0.&k=1&guid=ON&u=http%3A%2F%2Flp.example.net

Then fluct will count the click and redirect the user to company's landing page.

#### Method B: Company prepares the landing page URL when redirecting to fluct redirector

Redirecting route: Web page -> Company redirector -> fluct redirector -> Landing page

1. Company embeds a creative html like the following in bid response, (say the "r=" parameter indicates the landing page URL)

```html
<a href="http://dsp.example.com/?id=12345678&r=${CLICK_URL_ENC}"><img

...></a>
```

2. fluct will expand the creative html into something like the following:

```html
<a href="http://dsp.example.com/?id=12345678&r=http%3A%2F%2Frd.adingo.jp%2F%3Fp%3DrKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds%26v%3De0e8nlDL6O0.%26k%3D1%26guid%3DON%26u%3D"><img...></a>
```

3. When clicked, company should redirect to the fluct click measuring redirector URL with the encoded landing page URL added to the end.

    http://rd.adingo.jp/?p=rKRSvXZZsc3qXP7DfGyYd0ws220dxHwHVnICTDmTbaPn9JttXH6yinKvASt4mmHHZT_N6DHJbFvL44b27QhnsfTMmeY36Lj6T03cVm4N_OW6d3ukpfMh1cjUOuCcWL7hthiQK9quf-Uv83V7xFV3Z7Z8GptcRjhegT-aXliZsvMS7lLoxkXTHRO64iFKk8Ds&v=e0e8nlDL6O0.&k=1&guid=ON&u=http%3A%2F%2Flp.example.net

Then fluct will count the click and redirect the user to company's landing page.

## 4. Code table

### Category ID code:

<table>
  <tr>
    <th>Code</th>
    <th>Definition</th>
  </tr>
  <tr>
    <td>1</td>
    <td>arts & entertainment</td>
  </tr>
  <tr>
    <td>2</td>
    <td>automobile</td>
  </tr>
  <tr>
    <td>3</td>
    <td>business</td>
  </tr>
  <tr>
    <td>4</td>
    <td>career</td>
  </tr>
  <tr>
    <td>5</td>
    <td>education</td>
  </tr>
  <tr>
    <td>6</td>
    <td>household & childcare</td>
  </tr>
  <tr>
    <td>7</td>
    <td>health & fitness</td>
  </tr>
  <tr>
    <td>8</td>
    <td>food</td>
  </tr>
  <tr>
    <td>9</td>
    <td>hobby</td>
  </tr>
  <tr>
    <td>10</td>
    <td>home & garden</td>
  </tr>
  <tr>
    <td>11</td>
    <td>politic & economy</td>
  </tr>
  <tr>
    <td>12</td>
    <td>news</td>
  </tr>
  <tr>
    <td>13</td>
    <td>finance</td>
  </tr>
  <tr>
    <td>14</td>
    <td>society</td>
  </tr>
  <tr>
    <td>15</td>
    <td>science</td>
  </tr>
  <tr>
    <td>16</td>
    <td>pet</td>
  </tr>
  <tr>
    <td>17</td>
    <td>sport</td>
  </tr>
  <tr>
    <td>18</td>
    <td>fashion & style</td>
  </tr>
  <tr>
    <td>19</td>
    <td>technology & computer</td>
  </tr>
  <tr>
    <td>20</td>
    <td>travel</td>
  </tr>
  <tr>
    <td>21</td>
    <td>real estate</td>
  </tr>
  <tr>
    <td>22</td>
    <td>shopping</td>
  </tr>
  <tr>
    <td>23</td>
    <td>religion & spirituality</td>
  </tr>
  <tr>
    <td>24</td>
    <td>unknown category</td>
  </tr>
  <tr>
    <td>25</td>
    <td>non-standard content</td>
  </tr>
  <tr>
    <td>26</td>
    <td>content that may be contrary to law</td>
  </tr>
</table>


### Native Ads layout ID code:

<table>
  <tr>
    <th>ID</th>
    <th>layout name</th>
    <th>fluct status</th>
    <th>required</th>
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
    <td>supported</td>
    <td>img,title,data(sponsored)</td>
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
    <td>supported</td>
    <td>title,data(sponsored)</td>
  </tr>
  <tr>
    <td>+500</td>
    <td></td>
    <td>others</td>
    <td></td>
  </tr>
</table>


* The above required items will be sent for each native layout.

Impressions will not be generated for responses which do not also contain the corresponding items.

Multiple asset objects containing img items may exist.

## 5. Bid Request/Response Samples

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
        "pos": 9
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
        "pos": 9
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
    "lmt": 0
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
        "ver": "1",
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
        "ver": "1",
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

Typically for rewarded video, where it can also be explicitly specified as `imp.video.ext.videotype = "rewarded"` or similar.

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
        "stype": "EB",
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
            "adm": "<iframe width=\"468\" height=\"60\" marginwidth=\"0\" marginheight=\"0\" hspace=\"0\" vspace=\"0\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\" src=\"http://xxx.net/imp/${AUCTION_PRICE}/${CLICK_URL_ENC}\"></iframe>",
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
            "adm": "<iframe width=\"468\" height=\"60\" marginwidth=\"0\" marginheight=\"0\" hspace=\"0\" vspace=\"0\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\" src=\"http://xxx.net/imp/${AUCTION_PRICE}/${CLICK_URL_ENC}\"></iframe>",
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
