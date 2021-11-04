# fluct RTB spec for a supplier partner <sup>beta</sup>

This document is a technical integration guide for supplier (publisher) partners.

## 1. Steps

The integration will proceed in the following steps. You can always ask your Fluct account manager.

1. Gather and check technical requirements. Please review this document and fill out the [Fluct RTB Questionnaire Form](https://forms.gle/m7REbmwqZP78HsCg9).
2. Fluct will issue the following:
  - Publisher account and ads.txt line
  - RTB bidding endpoint
  - Cookie sync endpoint (optional)
3. Test with a small amount of traffic. Check BidRequest/BidResponse and tracking count with each other.
4. Go live.

## 2. Protocol

Fluct supports [IAB's OpenRTB 2.5](https://www.iab.com/wp-content/uploads/2016/03/OpenRTB-API-Specification-Version-2-5-FINAL.pdf ). Here are some special notes and which fields are supported. See also examples at the end.

### Request

#### BidRequest object

Fields ([JSON path](https://github.com/json-path/JSONPath)) | Supported | Required | Description
--- | --- | --- | ---
id | Yes | Yes |  
imp[0] | Yes | Yes |  
imp[0].id | Yes | Yes |  
imp[0].metric |   |   |  
imp[0].banner | Yes |   |  
imp[0].banner.format | Yes |   |  
imp[0].banner.format.w | Yes |   |  
imp[0].banner.format.h | Yes |   |  
imp[0].banner.w | Yes | Yes |  
imp[0].banner.h | Yes | Yes |  
imp[0].banner.wmax |   |   |  
imp[0].banner.hmax |   |   |  
imp[0].banner.wmin |   |   |  
imp[0].banner.hmin |   |   |  
imp[0].banner.btype |   |   |  
imp[0].banner.battr | Yes |   |  
imp[0].banner.pos | Yes |   |  
imp[0].banner.mimes |   |   |  
imp[0].banner.topframe |   |   |  
imp[0].banner.expdir |   |   |  
imp[0].banner.api | Yes |   |  
imp[0].banner.id |   |   |  
imp[0].banner.vcm |   |   |  
imp[0].video | Yes |   |  
imp[0].video.mimes | Yes |   |  
imp[0].video.minduration | Yes |   |  
imp[0].video.maxduration | Yes |   |  
imp[0].video.protocols | Yes |   |  
imp[0].video.protocol |   |   |  
imp[0].video.w | Yes | Yes |  
imp[0].video.h | Yes | Yes |  
imp[0].video.startdelay | Yes |   | 0=pre-roll, >0=mid-roll, -1=mid-roll, -2=post-roll
imp[0].video.placement | Yes |   |  
imp[0].video.linearity |   |   |  
imp[0].video.skip | Yes |   |  
imp[0].video.skipmin |   |   |  
imp[0].video.skipafter |   |   |  
imp[0].video.sequence |   |   |  
imp[0].video.battr | Yes |   |  
imp[0].video.maxextended |   |   |  
imp[0].video.minbitrate | Yes |   |  
imp[0].video.maxbitrate | Yes |   |  
imp[0].video.boxingallowed |   |   |  
imp[0].video.playbackmethod | Yes |   |  
imp[0].video.playbackend |   |   |  
imp[0].video.delivery |   |   |  
imp[0].video.pos | Yes |   |  
imp[0].video.companionad | Yes |   |  
imp[0].video.api | Yes |   |  
imp[0].video.companiontype |   |   |  
imp[0].video.ext | Yes |   |  
imp[0].video.ext.rewarded | Yes |   | integer; 0=no, 1=yes
imp[0].audio |   |   |  
imp[0].native |   |   |  
imp[0].pmp |   |   |  
imp[0].displaymanager | Yes |   |  
imp[0].displaymanagerver | Yes |   |  
imp[0].instl | Yes |   |  
imp[0].tagid | Yes | Yes |  
imp[0].bidfloor | Yes | Yes |  
imp[0].bidfloorcur | Yes | Yes | Only USD is supported.
imp[0].clickbrowser |   |   |  
imp[0].secure | Yes |   |  
imp[0].iframebuster |   |   |  
imp[0].exp |   |   |  
imp[0].ext | Yes |   |  
imp[0].ext.skadn | Yes |   | [OpenRTB SKAdNetwork Extension](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/extensions/community_extensions/skadnetwork.md). Only SKAdNetwork version 2.0 is supported.
site | Yes |   |  
site.id | Yes |   |  
site.name | Yes |   |  
site.domain |   |   |  
site.cat |   |   |  
site.sectioncat |   |   |  
site.pagecat |   |   |  
site.page | Yes |   |  
site.ref |   |   |  
site.search |   |   |  
site.mobile | Yes |   |  
site.privacypolicy |   |   |  
site.publisher | Yes | Yes |  
site.publisher.id | Yes | Yes |  
site.publisher.name |   |   |  
site.publisher.cat |   |   |  
site.publisher.domain |   |   |  
site.content | Yes |   |  
site.content.id |   |   |  
site.content.episode |   |   |  
site.content.title |   |   |  
site.content.series |   |   |  
site.content.season |   |   |  
site.content.artist |   |   |  
site.content.genre |   |   |  
site.content.album |   |   |  
site.content.isrc |   |   |  
site.content.producer |   |   |  
site.content.url | Yes |   |  
site.content.cat |   |   |  
site.content.prodq |   |   |  
site.content.videoquality |   |   |  
site.content.context |   |   |  
site.content.contentrating |   |   |  
site.content.userrating |   |   |  
site.content.qagmediarating |   |   |  
site.content.keywords |   |   |  
site.content.livestream |   |   |  
site.content.sourcerelationship |   |   |  
site.content.len |   |   |  
site.content.language | Yes |   |  
site.content.embeddable |   |   |  
site.content.data |   |   |  
site.keywords |   |   |  
app | Yes |   |  
app.id | Yes |   |  
app.name | Yes |   |  
app.bundle | Yes |   |  
app.domain |   |   |  
app.storeurl | Yes |   |  
app.cat |   |   |  
app.sectioncat |   |   |  
app.pagecat |   |   |  
app.ver |   |   |  
app.privacypolicy |   |   |  
app.paid |   |   |  
app.publisher | Yes |   | Same as site.publisher object.
app.content | Yes |   | Same as site.content object.
app.keywords |   |   |  
device | Yes |   |  
device.ua | Yes |   |  
device.geo | Yes |   |  
device.geo.lat | Yes |   |  
device.geo.lon | Yes |   |  
device.geo.type | Yes |   |  
device.geo.accuracy |   |   |  
device.geo.lastfix |   |   |  
device.geo.ipservice | Yes |   |  
device.geo.country | Yes | Yes |  
device.geo.region | Yes | Yes |  
device.geo.regionfips104 |   |   |  
device.geo.metro | Yes |   |  
device.geo.city | Yes |   |  
device.geo.zip | Yes |   |  
device.geo.utcoffset | Yes |   |  
device.dnt | Yes |   |  
device.lmt | Yes |   |  
device.ip | Yes |   |  
device.ipv6 | Yes |   |  
device.devicetype | Yes |   |  
device.make | Yes |   |  
device.model | Yes |   |  
device.os | Yes |   |  
device.osv | Yes |   |  
device.hwv | Yes |   |  
device.h | Yes |   |  
device.w | Yes |   |  
device.ppi |   |   |  
device.pxratio | Yes |   |  
device.js |   |   |  
device.geofetch |   |   |  
device.flashver |   |   |  
device.language | Yes |   |  
device.carrier |   |   |  
device.mccmnc |   |   |  
device.connectiontype | Yes |   |  
device.ifa | Yes |   |  
device.didsha1 |   |   |  
device.didmd5 |   |   |  
device.dpidsha1 |   |   |  
device.dpidmd5 |   |   |  
device.macsha1 |   |   |  
device.macmd5 |   |   |  
user | Yes |   |  
user.id | Yes |   |  
user.buyeruid | Yes |   |  
user.yob | Yes |   |  
user.gender | Yes |   |  
user.keywords |   |   |  
user.customdata | Yes |   |  
user.geo |   |   |  
user.data |   |   |  
test | Yes |   |  
at | Yes | Yes | Only 1 (First price auction) is supported.
tmax | Yes | Yes |  
wseat |   |   |  
bseat |   |   |  
allimps |   |   |  
cur | Yes |   | Only USD is supported.
wlang |   |   |  
bcat | Yes |   | Only the IAB category will be used.
badv | Yes |   |  
bapp | Yes |   |  
source | Yes |   |  
source.fd | Yes |   |  
source.tid | Yes |   |  
source.pchain |   |   |  
source.ext |   |   |  
source.ext.schain | Yes |   | [OpenRTB SupplyChain object](https://github.com/InteractiveAdvertisingBureau/openrtb/blob/master/supplychainobject.md)
regs | Yes |   |  
regs.coppa | Yes |   |  
regs.ext.gdpr | Yes |   |  


### Response

#### BidResponse object

Fields ([JSON path](https://github.com/json-path/JSONPath)) | Supported | Always passed | Description
--- | --- | --- | ---
id | Yes | Yes |  
seatbid | Yes |   |  
seatbid[]. | Yes |   |  
seatbid[].bid | Yes |   |  
seatbid[].bid[].id | Yes | Yes |  
seatbid[].bid[].impid | Yes | Yes |  
seatbid[].bid[].price | Yes | Yes |  
seatbid[].bid[].nurl | Yes |   | It may contain macro strings in the macro section that are expected to be substituted.
seatbid[].bid[].burl | Yes | Yes | It may contain macro strings in the macro section that are expected to be substituted.
seatbid[].bid[].lurl | Yes |   | It may contain macro strings in the macro section that are expected to be substituted.
seatbid[].bid[].adm | Yes | Yes | HTML for banner format ads, and VAST XML for video format ads.It may contain macro strings in the macro section that are expected to be substituted.
seatbid[].bid[].adid |   |   |  
seatbid[].bid[].adomain | Yes | Yes |  
seatbid[].bid[].bundle | Yes |   |  
seatbid[].bid[].iurl |   |   |  
seatbid[].bid[].cid |   |   |  
seatbid[].bid[].crid | Yes | Yes |  
seatbid[].bid[].tactic |   |   |  
seatbid[].bid[].cat |   |   |  
seatbid[].bid[].attr |   |   |  
seatbid[].bid[].api |   |   |  
seatbid[].bid[].protocol |   |   |  
seatbid[].bid[].qagmediarating |   |   |  
seatbid[].bid[].language |   |   |  
seatbid[].bid[].dealid |   |   |  
seatbid[].bid[].w | Yes |   |  
seatbid[].bid[].h | Yes |   |  
seatbid[].bid[].wratio |   |   |  
seatbid[].bid[].hratio |   |   |  
seatbid[].bid[].exp |   |   |  
seatbid[].bid[].ext | Yes |   |  
seatbid[].bid[].ext.skadn | Yes |   |  
seatbid[].seat |   |   |  
seatbid[].group |   |   |  
bidid | Yes |   |  
cur | Yes |   |  
customdata |   |   |  
nbr |   |   |  

## 3. Macro

Macro | Description
--- | ---
`${AUCTION_PRICE}` | Auction clearing price. Encryption is optional. Substituted to AUDIT in the creative review process.
`${AUCTION_LOSS}` | Auction loss reason codes. See IAB OpenRTB 2.5 specification 5.25 Loss Reason Codes for details.

## 4. Examples
	
Bid Request

```
```

Bid Response

```
```
