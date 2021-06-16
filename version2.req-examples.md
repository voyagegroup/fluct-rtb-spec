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
* [With SKAdNetwork Request Object](#with-skadnetwork-request-object)
* [With Extended User Identifications](#with-extended-user-identifications)

### Web

```json
{
  "at": 1,
  "badv": [],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
  "id": "ab61a452-a4e2-4bf0-9518-06ff369e549f",
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
            "rid": "ab61a452-a4e2-4bf0-9518-06ff369e549f",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "ab61a452-a4e2-4bf0-9518-06ff369e549f"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "07d99b8b-1e2b-4c38-9a20-6af7eca2d681"
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
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
    "ifa": "5dfa3b1c-0471-4b17-8dcf-8c33e9d91ada",
    "ip": "210.168.46.254",
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
  "id": "0ae306f1-dc01-4d5e-b648-5f486f42fb25",
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
            "rid": "0ae306f1-dc01-4d5e-b648-5f486f42fb25",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "0ae306f1-dc01-4d5e-b648-5f486f42fb25"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "5dfa3b1c-0471-4b17-8dcf-8c33e9d91ada"
  },
  "wseat": []
}
```

### Native (icon)

```json
{
  "at": 1,
  "badv": [],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
  "id": "69ea56d7-e2cb-4282-9aa9-e083ba9b24d9",
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
            "rid": "69ea56d7-e2cb-4282-9aa9-e083ba9b24d9",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "69ea56d7-e2cb-4282-9aa9-e083ba9b24d9"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "4414f45984274866cefdd604797c8d01d7961623"
  },
  "wseat": []
}
```

### Video

```json
{
  "at": 1,
  "badv": [],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
  "id": "590dc128-c3ef-4b5b-95d6-b7dbe314b98f",
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
            "rid": "590dc128-c3ef-4b5b-95d6-b7dbe314b98f",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "590dc128-c3ef-4b5b-95d6-b7dbe314b98f"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "2cf19e1f-8eec-4126-bb1c-1f49da5465c0"
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
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
    "ifa": "f5dc1860-70a4-45c8-a0fa-43af9e6140d8",
    "ip": "210.168.46.254",
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
  "id": "90a5ea00-8b0b-4fb1-a7a3-f9738079f954",
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
          "rewarded": 1
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
            "rid": "90a5ea00-8b0b-4fb1-a7a3-f9738079f954",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "90a5ea00-8b0b-4fb1-a7a3-f9738079f954"
  },
  "tmax": 300,
  "user": {
    "buyeruid": "",
    "ext": {},
    "gender": "M",
    "id": "f5dc1860-70a4-45c8-a0fa-43af9e6140d8",
    "yob": 2000
  },
  "wseat": []
}
```

### Audio

```json
{
  "at": 1,
  "badv": [],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
  "id": "553c6fc4-79fb-403f-84c5-0f00fe31d1fe",
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
            "rid": "553c6fc4-79fb-403f-84c5-0f00fe31d1fe",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "553c6fc4-79fb-403f-84c5-0f00fe31d1fe"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "aadce372-776f-4c6d-86f6-0bb61a6c3467"
  },
  "wseat": []
}
```

### PMP Deal Only

```json
{
  "at": 1,
  "badv": [],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
  "id": "3cd4521f-b89a-4655-96a0-e91b76fffc6d",
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
            "rid": "3cd4521f-b89a-4655-96a0-e91b76fffc6d",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "3cd4521f-b89a-4655-96a0-e91b76fffc6d"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "551faef3-6025-489c-945e-f5499a70b581"
  },
  "wseat": []
}
```

### PMP Deal or Open Auction

```json
{
  "at": 1,
  "badv": [],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
  "id": "7924cce8-cbb9-4633-b821-69891bee02dd",
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
            "rid": "7924cce8-cbb9-4633-b821-69891bee02dd",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "7924cce8-cbb9-4633-b821-69891bee02dd"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "12b97303-1c0d-489e-9103-120bd1dd2519"
  },
  "wseat": []
}
```

### Supply Chain in Google Open Bidding

Google Open Bidding transaction example.

```json
{
  "at": 1,
  "badv": [],
  "bapp": [],
  "bcat": [
    "IAB23",
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
  "id": "16af79bc-1d90-4d05-ba70-efb74f0c6094",
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
            "rid": "16af79bc-1d90-4d05-ba70-efb74f0c6094",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": "EB"
    },
    "fd": 1,
    "tid": "69c22274-f93e-4b93-a64a-243929a0f03d"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "876e7332-4865-4c58-a3da-bd5148de8dd7"
  },
  "wseat": []
}
```

### With SKAdNetwork Request Object

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
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
    "ifa": "0d6a55c5-be04-4294-a332-6abb5888270e",
    "ip": "210.168.46.254",
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
  "id": "faab36d7-50f6-4f5c-bfca-2758f365ebb2",
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
            "rid": "faab36d7-50f6-4f5c-bfca-2758f365ebb2",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "faab36d7-50f6-4f5c-bfca-2758f365ebb2"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "0d6a55c5-be04-4294-a332-6abb5888270e"
  },
  "wseat": []
}
```

### With Extended User Identifications

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
    "IAB24",
    "IAB25-2",
    "IAB25-3",
    "IAB25-4",
    "IAB25-5",
    "IAB26"
  ],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "ext": {},
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
    "ifa": "6d62699c-df4e-402d-87bc-171e674b38b0",
    "ip": "210.168.46.254",
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
  "id": "293331b6-90e8-4de6-8ef3-fb3c7b15ed96",
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
            "rid": "293331b6-90e8-4de6-8ef3-fb3c7b15ed96",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "293331b6-90e8-4de6-8ef3-fb3c7b15ed96"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {
      "eids": [
        {
          "source": "intimatemerger.com",
          "uids": [
            {
              "ext": {},
              "id": "h.661ce02c1b33a7e6"
            }
          ]
        },
        {
          "source": "liveramp.com",
          "uids": [
            {
              "ext": {},
              "id": "ad13b541-92d2-4bb1-9bbb-a55dc9989dd3"
            }
          ]
        },
        {
          "source": "adserver.org",
          "uids": [
            {
              "ext": {
                "rtiPartner": "TDID"
              },
              "id": "5f284ada-a54f-4a94-8574-43b64941ffab"
            }
          ]
        }
      ]
    },
    "id": "6d62699c-df4e-402d-87bc-171e674b38b0"
  },
  "wseat": []
}
```

