# fluct RTB Specification ver 2.2

This specification complies with OpenRTB Version 2.5.

See [IAB OpenRTB API Specification Version 2.5](https://www.iab.com/wp-content/uploads/2016/03/OpenRTB-API-Specification-Version-2-5-FINAL.pdf) for details.

### Attention

This specification may be incomplete. If you find any inadequacy or encounter confusion, please contact the person in charge: [developer@fluct.jp](mailto:developer@fluct.jp).

Moreover, this specification does not contain description of general RTB protocol (e.g., OpenRTB).

## Table of Contents

* [1. cookie sync](#1-cookie-sync)
* [2. Request/Response encoding](#2-requestresponse-encoding)
* [3. Request specification](#3-request-specification)
  * [a. Endpoint URL](#a-endpoint-url)
  * [b. OpenRTB Version HTTP Header](#b-openrtb-version-http-header)
  * [c. Bid request parameters](#c-bid-request-parameters)
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
    * [assets Object](#assets-object)
    * [title Object](#title-object)
    * [img Object](#img-object)
    * [data Object](#data-object)
* [4. Response specification](#4-response-specification)
  * [a. Bid response parameters](#a-bid-response-parameters)
    * [BidResponse Object (TopLevel)](#bidresponse-object-toplevel)
    * [Seatbid Object](#seatbid-object)
    * [Bid Object](#bid-object)
    * [native response adm (serialized JSON object)](#native-response-adm-serialized-json-object)
  * [b. impression/click beacon](#b-impressionclick-beacon)
    * [endpoint for impression beacon](#endpoint-for-impression-beacon)
    * [fluct transmits according to the following conditions (imp beacon):](#fluct-transmits-according-to-the-following-conditions-imp-beacon)
    * [endpoint for click beacon](#endpoint-for-click-beacon)
    * [fluct transmits according to the following conditions (click beacon):](#fluct-transmits-according-to-the-following-conditions-click-beacon)
  * [c. Macro substitution](#c-macro-substitution)
  * [d. Click Measuring](#d-click-measuring)
* [5. Code table](#5-code-table)
* [6. Bid Request/Response Samples](#6-bid-requestresponse-samples)
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

## 2. Request/Response encoding

Fluct is capable of sending gzip-compressed bid requests, along with the HTTP header `Content-Encoding: gzip`.  (default: uncompressed)
If you wish to receive gzipped bid requests, contact alliance representative.

Fluct is also capable of receiving compressed bid responses whenever corresponding requests contain a list of accepted compression algorightms in the HTTP header `Accept-Encoding`.  (e.g., `Accept-Encoding: gzip`)
If you are replying a compressed bid response, the response must contain the HTTP header `Content-Encoding` with selected compression names.

## 3. Request specification

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

### c. Bid request parameters

Serialize format: JSON only.

(* Although we have some integration experiences using non-text-based MessagePack, we strongly recommand not to use it, non-text-based MessagePack will not be supported in the future)

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

Both [Sellers.json](https://iabtechlab.com/sellers-json/) and [OpenRTB SupplyChain](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md) are available.

Refer to https://adingo.jp/sellers.json for sellers available through fluct.

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>fd</td>
    <td>required</td>
    <td>integer. <code>1</code> when upstream source is responsible for the final impression sale decision, or <code>0</code> otherwise.</td>
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
  <tr>
    <td>ext.schain</td>
    <td>optional</td>
    <td><a href="https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md">OpenRTB SupplyChain object</a></td>
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
  <tr>
    <td>osv</td>
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


#### Native Object

<table>
  <tr>
    <th>Field</th>
    <th>scope</th>
    <th>description</th>
  </tr>
  <tr>
    <td>request</td>
    <td>required</td>
    <td><a href="native-ads-v1.en.md">Native Ad Request Markup Object</a></td>
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

## 4. Response specification

### a. Bid response parameters

DSP should serialize bid information with the JSON format.

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
    <td>Ad markup data. See response example for details.</td>
  </tr>
  <tr>
    <td>adomain</td>
    <td>optional (recommended)</td>
    <td>array of string</td>
    <td>A list of advertiser domains for block list checking.</td>
  </tr>
  <tr>
    <td>bundle</td>
    <td>optional (recommended)</td>
    <td>
      Platform-specific application identifier
      ex) Android: "com.foo.mygame", iOS: "1234567890"
    </td>
  </tr>
  <tr>
    <td>crid</td>
    <td>optional</td>
    <td>string</td>
    <td>Creative ID</td>
  </tr>
  <tr>
    <td>dealid</td>
    <td>optional</td>
    <td>string</td>
    <td>Required if bidding for a PMP deal. Reference to BidRequest.imp.pmp.deal.id</td>
  </tr>
  <tr>
    <td>nurl</td>
    <td>optional</td>
    <td>string</td>
    <td>
      Win notice URL to be called if the bid wins the auction.
      Not necessarily indicating delivered, viewed, or billable.
      Substituting macros may be included.
    </td>
  </tr>
  <tr>
    <td>lurl</td>
    <td>optional</td>
    <td>string</td>
    <td>
      Loss notice URL to be called if the bid loses the auction.
      Substituting macros, where ${AUCTION_PRICE} for winner's clearing price when possible and ${AUCTION_LOSS} for loss reason code, may be included.
      See IAB OpenRTB 2.5 specification 5.25 Loss Reason Codes for details.
    </td>
  </tr>
</table>


### b. impression/click beacon

The following assumptions are made about URLs which serve beacons:

#### endpoint for impression beacon

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

#### endpoint for click beacon

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

## 5. Code table


## 6. Bid Request/Response Samples

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
    "osv":"9.3.1"
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

For rewarded video, where it can also be explicitly specified as `imp.video.ext.videotype = "rewarded"` or similar.

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
        "minduration": 1,
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
