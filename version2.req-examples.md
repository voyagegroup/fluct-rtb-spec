# fluct RTB Specification ver 2: Request Examples

* [Web](#web)
* [App](#app)
* [Native (icon)](#native-icon)
* [Video](#video)
* [Rewarded-Video](#rewarded-video)
* [Audio](#audio)
* [PMP Deal Only](#pmp-deal-only)
* [PMP Deal or Open Auction](#pmp-deal-or-open-auction)
* [Supply Chain in Google Open Bidding](#supply-chain-in-google-open-bidding)
* [SKAdNetwork Request Object](#skadnetwork-request-object)

### Web

```json
{
  "at": 1,
  "badv": [
    "blocked-advertiser1.com",
    "blocked-advertiser2.com",
    "blocked-advertiser3.com"
  ],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "",
    "os": "Windows NT",
    "osv": "10.0",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/51.0.2704.79 Safari\/537.36 Edge\/14.14393"
  },
  "id": "86e40f49-f710-4293-a229-35e0fbf82e7a",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
        "btype": [],
        "ext": {},
        "format": [
          {
            "h": 250,
            "w": 300
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222"
    }
  ],
  "site": {
    "cat": [
      "IAB1"
    ],
    "domain": "magazine.fluct.jp",
    "ext": {},
    "id": "123",
    "mobile": 1,
    "name": "Example Site",
    "page": "https:\/\/magazine.fluct.jp\/category\/news",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "ref": "https:\/\/google.com\/search?",
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
            "rid": "86e40f49-f710-4293-a229-35e0fbf82e7a",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "86e40f49-f710-4293-a229-35e0fbf82e7a"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "9c73dc20-712e-4d94-8255-6de93accf040"
  },
  "wseat": []
}
```

### App

```json
{
  "app": {
    "bundle": "1234567890",
    "cat": [
      "IAB1"
    ],
    "ext": {},
    "id": "123",
    "name": "Example App",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "sectioncat": [],
    "storeurl": "https:\/\/apps.apple.com\/jp\/app\/hogehoge-app\/id1234567890"
  },
  "at": 1,
  "badv": [],
  "bapp": [
    "12345",
    "23456",
    "34567"
  ],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "e2249a97-8609-4072-9aaf-b4a15129873f",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "id": "66a31e28-d140-4483-b61d-b435159725ca",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
        "btype": [],
        "ext": {},
        "format": [
          {
            "h": 250,
            "w": 300
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222"
    }
  ],
  "source": {
    "ext": {
      "schain": {
        "complete": 1,
        "nodes": [
          {
            "asi": "adingo.jp",
            "ext": {},
            "hp": 1,
            "rid": "66a31e28-d140-4483-b61d-b435159725ca",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "66a31e28-d140-4483-b61d-b435159725ca"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "e2249a97-8609-4072-9aaf-b4a15129873f"
  },
  "wseat": []
}
```

### Native (icon)

```json
{
  "at": 1,
  "badv": [
    "blocked-advertiser1.com",
    "blocked-advertiser2.com",
    "blocked-advertiser3.com"
  ],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "SOV39",
    "os": "Android",
    "osv": "9",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Linux; Android 9; SOV39 Build\/52.0.C.1.119) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/68.0.3440.91 Mobile Safari\/537.36"
  },
  "id": "75a40036-f9d6-4f8c-8240-d37b28c2dbc7",
  "imp": [
    {
      "bidfloor": 300.0,
      "bidfloorcur": "JPY",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "native": {
        "api": [],
        "battr": [],
        "ext": {},
        "request": "{\"native\":{\"assets\":[{\"id\":1,\"required\":1,\"title\":{\"len\":10}},{\"id\":2,\"img\":{\"hmin\":10,\"type\":1,\"wmin\":10},\"required\":1},{\"data\":{\"len\":30,\"type\":1},\"id\":3},{\"data\":{\"len\":50,\"type\":2},\"id\":4}],\"layout\":3,\"plcmtcnt\":2,\"ver\":\"1.0\"}}",
        "ver": "1.0"
      },
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222"
    }
  ],
  "site": {
    "cat": [
      "IAB1"
    ],
    "domain": "magazine.fluct.jp",
    "ext": {},
    "id": "123",
    "mobile": 1,
    "name": "Example Site",
    "page": "https:\/\/magazine.fluct.jp\/category\/news",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "ref": "https:\/\/google.com\/search?",
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
            "rid": "75a40036-f9d6-4f8c-8240-d37b28c2dbc7",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "75a40036-f9d6-4f8c-8240-d37b28c2dbc7"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "2c7b94bfca27de03ce862bb6c9cb7a1e7093197d"
  },
  "wseat": []
}
```

### Video

```json
{
  "at": 1,
  "badv": [
    "blocked-advertiser1.com",
    "blocked-advertiser2.com",
    "blocked-advertiser3.com"
  ],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "",
    "os": "Windows NT",
    "osv": "10.0",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/51.0.2704.79 Safari\/537.36 Edge\/14.14393"
  },
  "id": "52ce85ca-0879-4891-9935-9c6e2d8c3e4f",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222",
      "video": {
        "api": [],
        "boxingallowed": 1,
        "companionad": [],
        "ext": {},
        "h": 250,
        "linearity": 1,
        "maxbitrate": 2000,
        "maxduration": 15,
        "mimes": [
          "video\/mp4",
          "video\/x-m4v",
          "video\/quicktime",
          "video\/avi",
          "video\/3gpp2",
          "video\/3gpp"
        ],
        "minbitrate": 0,
        "minduration": 0,
        "placement": 1,
        "pos": 1,
        "protocols": [
          3,
          6
        ],
        "skip": 1,
        "startdelay": 0,
        "w": 300
      }
    }
  ],
  "site": {
    "cat": [
      "IAB1"
    ],
    "domain": "magazine.fluct.jp",
    "ext": {},
    "id": "123",
    "mobile": 1,
    "name": "Example Site",
    "page": "https:\/\/magazine.fluct.jp\/category\/news",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "ref": "https:\/\/google.com\/search?",
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
            "rid": "52ce85ca-0879-4891-9935-9c6e2d8c3e4f",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "52ce85ca-0879-4891-9935-9c6e2d8c3e4f"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "9f1b91cc-f7ea-48b9-bcac-60d44b690fc1"
  },
  "wseat": []
}
```

### Rewarded-Video

```json
{
  "app": {
    "bundle": "1234567890",
    "cat": [
      "IAB1"
    ],
    "ext": {},
    "id": "123",
    "name": "Example App",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "sectioncat": [],
    "storeurl": "https:\/\/apps.apple.com\/jp\/app\/hogehoge-app\/id1234567890"
  },
  "at": 1,
  "badv": [],
  "bapp": [
    "12345",
    "23456",
    "34567"
  ],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "h": 1334,
    "hwv": "",
    "ifa": "a3704764-40a6-4301-ac18-62d9bbabfa9f",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1",
    "w": 750
  },
  "id": "79b3bf0f-adf1-4387-8580-ea25c0427bb2",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "displaymanager": "FluctSDK",
      "displaymanagerver": "1.2.3",
      "ext": {},
      "id": "",
      "instl": 1,
      "metric": [],
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222",
      "video": {
        "api": [
          5
        ],
        "boxingallowed": 1,
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
        "h": 647,
        "linearity": 1,
        "maxbitrate": 2000,
        "maxduration": 30,
        "mimes": [
          "video\/mp4",
          "video\/x-m4v",
          "video\/quicktime",
          "video\/avi",
          "video\/3gpp2",
          "video\/3gpp"
        ],
        "minbitrate": 0,
        "minduration": 0,
        "placement": 5,
        "pos": 1,
        "protocols": [
          3,
          6
        ],
        "skip": 0,
        "startdelay": 0,
        "w": 375
      }
    }
  ],
  "source": {
    "ext": {
      "schain": {
        "complete": 1,
        "nodes": [
          {
            "asi": "adingo.jp",
            "ext": {},
            "hp": 1,
            "rid": "79b3bf0f-adf1-4387-8580-ea25c0427bb2",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "79b3bf0f-adf1-4387-8580-ea25c0427bb2"
  },
  "tmax": 300,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "a3704764-40a6-4301-ac18-62d9bbabfa9f"
  },
  "wseat": []
}
```

### Audio

```json
{
  "at": 1,
  "badv": [
    "blocked-advertiser1.com",
    "blocked-advertiser2.com",
    "blocked-advertiser3.com"
  ],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "",
    "os": "Windows NT",
    "osv": "10.0",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/51.0.2704.79 Safari\/537.36 Edge\/14.14393"
  },
  "id": "5d88ffdc-c22b-4b7b-b60f-213982bf56f5",
  "imp": [
    {
      "audio": {
        "api": [],
        "ext": {},
        "feed": 2,
        "maxbitrate": 2000,
        "maxduration": 15,
        "mimes": [
          "audio\/mp3",
          "audio\/mpeg"
        ],
        "minbitrate": 0,
        "minduration": 0,
        "protocols": [
          2,
          3,
          5,
          6,
          7,
          8
        ],
        "startdelay": 0,
        "stitched": 1
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222"
    }
  ],
  "site": {
    "cat": [
      "IAB1"
    ],
    "domain": "magazine.fluct.jp",
    "ext": {},
    "id": "123",
    "mobile": 1,
    "name": "Example Site",
    "page": "https:\/\/magazine.fluct.jp\/category\/news",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "ref": "https:\/\/google.com\/search?",
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
            "rid": "5d88ffdc-c22b-4b7b-b60f-213982bf56f5",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "5d88ffdc-c22b-4b7b-b60f-213982bf56f5"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "d6602ecb-8d6b-44f3-b22a-963f6296735f"
  },
  "wseat": []
}
```

### PMP Deal Only

```json
{
  "at": 1,
  "badv": [
    "blocked-advertiser1.com",
    "blocked-advertiser2.com",
    "blocked-advertiser3.com"
  ],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "id": "eb1ad568-7352-48fe-9e65-356da7f89572",
  "imp": [
    {
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [
          {
            "at": 1,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-private-auction-at-1",
            "wadomain": [],
            "wseat": []
          },
          {
            "at": 2,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-private-auction-at-2",
            "wadomain": [],
            "wseat": []
          },
          {
            "at": 3,
            "bidfloor": 6.480356,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-preferred-deal-at-3",
            "wadomain": [],
            "wseat": []
          }
        ],
        "ext": {},
        "private_auction": 1
      },
      "secure": 1,
      "tagid": "1111:22222222",
      "video": {
        "api": [],
        "boxingallowed": 1,
        "companionad": [],
        "ext": {},
        "h": 250,
        "linearity": 1,
        "maxbitrate": 2000,
        "maxduration": 15,
        "mimes": [
          "video\/mp4",
          "video\/x-m4v",
          "video\/quicktime",
          "video\/avi",
          "video\/3gpp2",
          "video\/3gpp"
        ],
        "minbitrate": 0,
        "minduration": 0,
        "placement": 1,
        "pos": 1,
        "protocols": [
          3,
          6
        ],
        "skip": 1,
        "startdelay": 0,
        "w": 300
      }
    }
  ],
  "site": {
    "cat": [
      "IAB1"
    ],
    "domain": "magazine.fluct.jp",
    "ext": {},
    "id": "123",
    "mobile": 1,
    "name": "Example Site",
    "page": "https:\/\/magazine.fluct.jp\/category\/news",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "ref": "https:\/\/google.com\/search?",
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
            "rid": "eb1ad568-7352-48fe-9e65-356da7f89572",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "eb1ad568-7352-48fe-9e65-356da7f89572"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "bc9e1e5d-01b1-4029-9642-c1e84214b20d"
  },
  "wseat": []
}
```

### PMP Deal or Open Auction

```json
{
  "at": 1,
  "badv": [
    "blocked-advertiser1.com",
    "blocked-advertiser2.com",
    "blocked-advertiser3.com"
  ],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "id": "aa27ab96-96ca-4f11-8b07-46ae48dbdb07",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
        "btype": [],
        "ext": {},
        "format": [
          {
            "h": 250,
            "w": 300
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [
          {
            "at": 1,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-private-auction-at-1",
            "wadomain": [],
            "wseat": []
          },
          {
            "at": 2,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-private-auction-at-2",
            "wadomain": [],
            "wseat": []
          },
          {
            "at": 3,
            "bidfloor": 6.480356,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-preferred-deal-at-3",
            "wadomain": [],
            "wseat": []
          }
        ],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222"
    }
  ],
  "site": {
    "cat": [
      "IAB1"
    ],
    "domain": "magazine.fluct.jp",
    "ext": {},
    "id": "123",
    "mobile": 1,
    "name": "Example Site",
    "page": "https:\/\/magazine.fluct.jp\/category\/news",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "ref": "https:\/\/google.com\/search?",
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
            "rid": "aa27ab96-96ca-4f11-8b07-46ae48dbdb07",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "aa27ab96-96ca-4f11-8b07-46ae48dbdb07"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "8e1807cf-e825-4d63-b1a8-d006b98a7916"
  },
  "wseat": []
}
```

### Supply Chain in Google Open Bidding

Google Open Bidding transaction example.

```json
{
  "at": 1,
  "badv": [
    "blocked-advertiser1.com",
    "blocked-advertiser2.com",
    "blocked-advertiser3.com"
  ],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Portland",
      "country": "USA",
      "ipservice": 3,
      "region": "OR",
      "type": 2,
      "utcoffset": -480,
      "zip": "97218"
    },
    "hwv": "",
    "ifa": "",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "id": "c4da6e09-b172-4439-ba5e-e852e55e5f53",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
        "btype": [],
        "ext": {},
        "format": [
          {
            "h": 250,
            "w": 300
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222"
    }
  ],
  "site": {
    "cat": [
      "IAB1"
    ],
    "domain": "magazine.fluct.jp",
    "ext": {},
    "id": "123",
    "mobile": 1,
    "name": "Example Site",
    "page": "https:\/\/magazine.fluct.jp\/category\/news",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "ref": "https:\/\/google.com\/search?",
    "sectioncat": []
  },
  "source": {
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
            "rid": "c4da6e09-b172-4439-ba5e-e852e55e5f53",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": "EB"
    },
    "fd": 1,
    "tid": "3dc5d724-c639-43fe-9ab4-61398d14ec48"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "a6b67747-e72e-4ba0-a721-0ce68c4f3b4e"
  },
  "wseat": []
}
```

### SKAdNetwork Request Object

```json
{
  "app": {
    "bundle": "1234567890",
    "cat": [
      "IAB1"
    ],
    "ext": {},
    "id": "123",
    "name": "Example App",
    "pagecat": [],
    "publisher": {
      "cat": [],
      "domain": "",
      "ext": {},
      "id": "234",
      "name": ""
    },
    "sectioncat": [],
    "storeurl": "https:\/\/apps.apple.com\/jp\/app\/hogehoge-app\/id1234567890"
  },
  "at": 1,
  "badv": [],
  "bapp": [
    "12345",
    "23456",
    "34567"
  ],
  "bcat": [
    "IAB23",
    "IAB23-1",
    "IAB23-10",
    "IAB23-2",
    "IAB23-3",
    "IAB23-4",
    "IAB23-5",
    "IAB23-6",
    "IAB23-7",
    "IAB23-8",
    "IAB23-9",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26",
    "IAB26-1",
    "IAB26-2",
    "IAB26-3",
    "IAB26-4"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "city": "Shibuya",
      "country": "JPN",
      "ipservice": 3,
      "region": "JP-13",
      "type": 2,
      "utcoffset": 540,
      "zip": "150-0043"
    },
    "hwv": "",
    "ifa": "78f5db2d-3a3f-4497-af96-b80421bd9897",
    "ip": "210.168.46.254",
    "ipv6": "",
    "js": 1,
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "id": "73a2e7ef-fcdf-4922-bc95-de002b2b5250",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
        "btype": [],
        "ext": {},
        "format": [
          {
            "h": 250,
            "w": 300
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {
        "skadn": {
          "skadnetids": [
            "cDkw7geQsH.skadnetwork",
            "qyJfv329m4.skadnetwork"
          ],
          "sourceapp": "1234567890",
          "version": "2.0"
        }
      },
      "id": "",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [],
        "ext": {},
        "private_auction": 0
      },
      "secure": 1,
      "tagid": "1111:22222222"
    }
  ],
  "source": {
    "ext": {
      "schain": {
        "complete": 1,
        "nodes": [
          {
            "asi": "adingo.jp",
            "ext": {},
            "hp": 1,
            "rid": "73a2e7ef-fcdf-4922-bc95-de002b2b5250",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "73a2e7ef-fcdf-4922-bc95-de002b2b5250"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "78f5db2d-3a3f-4497-af96-b80421bd9897"
  },
  "wseat": []
}
```


