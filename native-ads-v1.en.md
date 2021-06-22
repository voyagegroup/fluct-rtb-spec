# fluct Native Ads Spec 1.2

* fluct Native Ads Spec 1.2 complies with IAB OpenRTB Native Ads Spec 1.2.
* See [IAB OpenRTB Dynamic Native Ads](https://iabtechlab.com/standards/openrtb-native/) for detailed specification.


## Table of Contents

* [Change History](#change-history)
* [Native Markup Request Object](#native-markup-request-object)
  * [Asset Request Object](#asset-request-object)
  * [Title Request Object](#title-request-object)
  * [Image Request Object](#image-request-object)
  * [Video Request Object](#video-request-object)
  * [Data Request Object](#data-request-object)
  * [Event Trackers Request Object](#event-trackers-request-object)
* [Native Markup Response Object](#native-markup-response-object)
  * [Asset Response Object](#asset-response-object)
  * [Title Response Object](#title-response-object)
  * [Image Response Object](#image-response-object)
  * [Video Response Object](#video-response-object)
  * [Data Response Object](#data-response-object)
  * [Link Response Object](#link-response-object)
  * [Event Trackers Response Object](#event-trackers-response-object)


## Change History

[CHANGELOG-NATIVE-ADS](./CHANGELOG-NATIVE-ADS.md)


## Native Markup Request Object

| Field          | Always Passed | Type     | Default | Description |
|----------------|-----|--------------------|-------|-------------|
| ver            | Yes | string             | 1.2   | Version of the Native Markup Request |
| context        |     | integer            | -     | See 7.1 Context Types of IAB Native Ads Spec 1.2 |
| contextsubtype |     | integer            | -     | See 7.2 Context Sub Types of IAB Native Ads Spec 1.2 |
| plcmttype      |     | integer            | -     | See 7.3 Placement Types of IAB Native Ads Spec 1.2 |
| plcmtcnt       |     | integer            | 1     | The number of placements in the layout |
| seq            |     | integer            | 0     | 0: the first ad, 1: the second ad, ... |
| assets         | Yes | array of objects   | -     | See [Asset Request Object](#asset-request-object) |
| aurlsupport    |     | integer            | 0     | Whether or not the assets URL is supported |
| durlsupport    |     | integer            | 0     | Whether or not the DCO URL is supported |
| eventtrackers  |     | array of objects   | -     | See [Event Trackers Request Object](#event-trackers-request-object) |
| privacy        |     | integer            | 0     | Set to 1 when buyer-specific privacy notice is supported |

* Unlike IAB OpenRTB Native Ads Spec 1.1 and older, the Native Markup Request Object specified above is the root object.


### Asset Request Object

| Field     | Always Passed | Type | Default | Description |
|-----------|-----|---------|---|-------------|
| id        | Yes | integer | - | Unique asset ID |
| required  |     | integer | 0 | Set to 1 when the asset is required |
| title     |     | object  | - | See [Title Request Object](#title-request-object) |
| img       |     | object  | - | See [Image Request Object](#image-request-object) |
| video     |     | object  | - | See [Video Request Object](#video-request-object) |
| data      |     | object  | - | See [Data Request Object](#data-request-object) |

* Each asset object contains only one of title, img, data, or video.


### Title Request Object

| Field | Always Passed | Type | Default | Description |
|-------|---------------|------|---------|-------------|
| len   | Yes | integer | - | Max. length of the text in the title |


### Image Request Object

| Field | Always Passed | Type | Default | Description |
|-------|---------------|------|---------|-------------|
| type  |   | integer           | - | See 7.5 Image Asset Types of IAB Native Ads Spec 1.2 |
| w     |   | ingeter           | - | Width of the image in pixels |
| wmin  |   | integer           | - | Min. width of the image in pixels |
| h     |   | integer           | - | Height of the image in pixels |
| hmin  |   | integer           | - | Min. height of the image in pixels |
| mimes |   | array of strings  | All types allowed | List of the supported MIME types |


### Video Request Object

| Field         | Always Passed | Type | Default | Description |
|---------------|---------------|------|---------|-------------|
| mimes         | Yes | array of strings  | - | MIME types supported |
| minduration   | Yes | integer           | - | Min. duration in seconds |
| maxduration   | Yes | integer           | - | Max. duration in seconds |
| protocols     | Yes | array of integers | - | Video protocols supported. See OpenRTB video protocols |


### Data Request Object

| Field | Always Passed | Type | Default | Description |
|-------|---------------|------|---------|-------------|
| type  | Yes | integer | - | See 7.4 Data Asset Types of IAB Native Ads Spec 1.2 |
| len   |     | integer | - | Max. length of the text in the element |


### Event Trackers Request Object

| Field   | Always Passed | Type | Default | Description |
|---------|---------------|------|---------|-------------|
| event   | Yes | integer           | - | See 7.6 Event Types of IAB Native Ads Spec 1.2 |
| methods | Yes | array of integers | - | See 7.7 Event Tracking Methods of IAB Native Ads Spec 1.2 |


## Native Markup Response Object

| Field         | Required | Type | Default | Description |
|---------------|----------|------|---------|-------------|
| ver           | Yes | string           | 1.2 | Version of the Native Markup Response |
| assets        | Yes | array of objects | -   | List of native ad assets. Required when no assetsurl.  Recommended even when assetsurl is present |
| assetsurl     |     | string           | -   | URL of an alternate source for the assets object |
| dcourl        |     | string           | -   | URL of a dynamic creative spec source |
| link          | Yes | object           | -   | See [Link Response Object](#link-response-object) |
| eventtrackers |     | array of objects | -   | See [Event Trackers Response Object](#event-trackers-response-object) |
| privacy       |     | string           | -   | URL of the buyer's targeting activity information |

* Unlike IAB OpenRTB Native Ads Spec 1.1 and older, the Native Markup Response Object specified above is the root object.


### Asset Response Object

| Field     | Required | Type | Default | Description |
|-----------|----------|------|---------|-------------|
| id        | Yes | integer | - | |
| required  |     | integer | 0 | Set to 1 when the asset is required |
| title     |     | object  | - | See [Title Response Object](#title-response-object) |
| img       |     | object  | - | See [Image Response Object](#image-response-object) |
| video     |     | object  | - | See [Video Response Object](#video-response-object) |
| data      |     | object  | - | See [Data Response Object](#data-response-object) |
| link      |     | object  | - | See [Link Response Object](#link-response-object) |


### Title Response Object

| Field | Required | Type | Default | Description |
|-------|----------|------|---------|-------------|
| text  | Yes | string  | - | The text in the title |
| len   |     | integer | - | Length of the title being provided |


### Image Response Object

| Field | Required | Type | Default | Description |
|-------|----------|------|---------|-------------|
| type  |     | integer | - | See 7.5 Image Asset Types of IAB Native Ads Spec 1.2 |
| url   | Yes | string  | - | URL of the image asset |
| w     | Yes | integer | - | Width of the image in pixels |
| h     | Yes | integer | - | Height of the image in pixels |


### Video Response Object

| Field | Required | Type | Default | Description |
|-------|----------|------|---------|-------------|
| vasttag | Yes | string | - | VAST XML |


### Data Response Object

| Field | Required | Type | Default | Description |
|-------|----------|------|---------|-------------|
| type  |     | integer | - | See 7.4 Data Asset Types of IAB Native Ads Spec 1.2 |
| len   |     | integer | - | Length of the element being provided |
| value | Yes | string  | - | String of the data to be displayed |


### Link Response Object

| Field | Required | Type | Default | Description |
|-------|----------|------|---------|-------------|
| url           | Yes | string           | - | Landing URL of the clickable link |
| clicktrackers |     | array of strings | - | List of third-party tracker URLs to be fired on the click event |


### Event Trackers Response Object

| Field  | Required | Type | Default | Description |
|--------|----------|------|---------|-------------|
| event  | Yes | integer | - | See 7.6 Event Types of IAB Native Ads Spec 1.2 |
| method | Yes | integer | - | See 7.7 Event Tracking Methods of IAB Native Ads Spec 1.2 |
| url    |     | string  | - | URL of the image or js |
