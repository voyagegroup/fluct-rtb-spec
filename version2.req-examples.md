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
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "",
    "os": "Windows NT",
    "osv": "10.0",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/51.0.2704.79 Safari\/537.36 Edge\/14.14393"
  },
  "ext": {},
  "id": "bbabe931-d82e-4390-8a68-7ef1b6ac0a95",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
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
      "ext": {},
      "id": "234"
    },
    "ref": "https:\/\/google.com\/search?"
  },
  "source": {
    "ext": {
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "bbabe931-d82e-4390-8a68-7ef1b6ac0a95",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "bbabe931-d82e-4390-8a68-7ef1b6ac0a95"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "1af2d7af-9e0c-464c-8e00-c3d7bfedc366"
  }
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
      "ext": {},
      "id": "234"
    },
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
    "ifa": "c04e0c44-e1d1-4d8a-8e54-aa22318609ec",
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "ext": {},
  "id": "31ad7976-6061-4388-880b-7562cf0b9af5",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
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
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "31ad7976-6061-4388-880b-7562cf0b9af5",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "31ad7976-6061-4388-880b-7562cf0b9af5"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "c04e0c44-e1d1-4d8a-8e54-aa22318609ec"
  }
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
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "SOV39",
    "os": "Android",
    "osv": "9",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Linux; Android 9; SOV39 Build\/52.0.C.1.119) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/68.0.3440.91 Mobile Safari\/537.36"
  },
  "ext": {},
  "id": "d8211dc0-5838-437d-9916-7e39305807dd",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "metric": [],
      "native": {
        "api": [],
        "battr": [],
        "ext": {},
        "request": "{\"assets\":[{\"id\":1,\"required\":1,\"title\":{\"len\":10}},{\"id\":2,\"img\":{\"hmin\":10,\"type\":1,\"wmin\":10},\"required\":1},{\"data\":{\"len\":30,\"type\":1},\"id\":3},{\"data\":{\"len\":50,\"type\":2},\"id\":4}],\"aurlsupport\":0,\"context\":1,\"durlsupport\":0,\"eventtrackers\":[{\"event\":1,\"methods\":[1]}],\"plcmtcnt\":2,\"plcmttype\":1,\"privacy\":1,\"ver\":\"1.2\"}",
        "ver": "1.2"
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
      "ext": {},
      "id": "234"
    },
    "ref": "https:\/\/google.com\/search?"
  },
  "source": {
    "ext": {
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "d8211dc0-5838-437d-9916-7e39305807dd",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "d8211dc0-5838-437d-9916-7e39305807dd"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "ccd69576e8589e5c80c4a32ea7bad7cc08d7ad00"
  }
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
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "",
    "os": "Windows NT",
    "osv": "10.0",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/51.0.2704.79 Safari\/537.36 Edge\/14.14393"
  },
  "ext": {},
  "id": "f22067d4-2043-4f0c-aaf9-20565d655c70",
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
        "battr": [],
        "boxingallowed": 1,
        "companionad": [],
        "delivery": [],
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
      "ext": {},
      "id": "234"
    },
    "ref": "https:\/\/google.com\/search?"
  },
  "source": {
    "ext": {
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "f22067d4-2043-4f0c-aaf9-20565d655c70",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "f22067d4-2043-4f0c-aaf9-20565d655c70"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "01cfe94e-87d1-4ab4-a6b3-3d438c422e80"
  }
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
      "ext": {},
      "id": "234"
    },
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
    "ifa": "3c2c9ccc-1b35-4424-8581-abc935955a7f",
    "ip": "210.168.46.254",
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
  "ext": {},
  "id": "e226737d-49e2-4d9c-ae35-8459eac43f0f",
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
      "rwdd": 1,
      "secure": 1,
      "tagid": "1111:22222222",
      "video": {
        "api": [
          5
        ],
        "battr": [],
        "boxingallowed": 1,
        "companionad": [
          {
            "api": [
              5
            ],
            "vcm": 1
          }
        ],
        "delivery": [],
        "ext": {},
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
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "e226737d-49e2-4d9c-ae35-8459eac43f0f",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "e226737d-49e2-4d9c-ae35-8459eac43f0f"
  },
  "tmax": 300,
  "user": {
    "buyeruid": "",
    "ext": {},
    "gender": "M",
    "id": "3c2c9ccc-1b35-4424-8581-abc935955a7f",
    "yob": 2000
  }
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
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "",
    "os": "Windows NT",
    "osv": "10.0",
    "pxratio": 0.0,
    "ua": "Mozilla\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/51.0.2704.79 Safari\/537.36 Edge\/14.14393"
  },
  "ext": {},
  "id": "b25404ff-64a6-4634-80a0-a66537aea029",
  "imp": [
    {
      "audio": {
        "api": [],
        "battr": [],
        "delivery": [],
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
      "ext": {},
      "id": "234"
    },
    "ref": "https:\/\/google.com\/search?"
  },
  "source": {
    "ext": {
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "b25404ff-64a6-4634-80a0-a66537aea029",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "b25404ff-64a6-4634-80a0-a66537aea029"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "bd85501a-0c3c-460b-80ba-0915c57e2d33"
  }
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
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "ext": {},
  "id": "426cf741-2fea-4727-a20e-a4c849d41ca6",
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
            "id": "example-deal-private-auction-at-1"
          },
          {
            "at": 2,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-private-auction-at-2"
          },
          {
            "at": 3,
            "bidfloor": 6.480356,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-preferred-deal-at-3"
          }
        ],
        "ext": {},
        "private_auction": 1
      },
      "secure": 1,
      "tagid": "1111:22222222",
      "video": {
        "api": [],
        "battr": [],
        "boxingallowed": 1,
        "companionad": [],
        "delivery": [],
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
      "ext": {},
      "id": "234"
    },
    "ref": "https:\/\/google.com\/search?"
  },
  "source": {
    "ext": {
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "426cf741-2fea-4727-a20e-a4c849d41ca6",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "426cf741-2fea-4727-a20e-a4c849d41ca6"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "268882d2-f7be-467b-8a58-a56a0b01c06b"
  }
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
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "ext": {},
  "id": "b1ac934c-4b7f-4883-b5f7-a22ca9f3930d",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
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
            "id": "example-deal-private-auction-at-1"
          },
          {
            "at": 2,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-private-auction-at-2"
          },
          {
            "at": 3,
            "bidfloor": 6.480356,
            "bidfloorcur": "USD",
            "ext": {},
            "id": "example-deal-preferred-deal-at-3"
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
      "ext": {},
      "id": "234"
    },
    "ref": "https:\/\/google.com\/search?"
  },
  "source": {
    "ext": {
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "b1ac934c-4b7f-4883-b5f7-a22ca9f3930d",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "b1ac934c-4b7f-4883-b5f7-a22ca9f3930d"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "090bc4dd-bb06-4aeb-9212-d1986ff81a25"
  }
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
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "ext": {},
  "id": "3fa8d8a3-3ab4-4804-9f21-b301cc88ed79",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
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
      "ext": {},
      "id": "234"
    },
    "ref": "https:\/\/google.com\/search?"
  },
  "source": {
    "ext": {
      "stype": "EB"
    },
    "fd": 1,
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
          "rid": "3fa8d8a3-3ab4-4804-9f21-b301cc88ed79",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "705b5742-29e0-46b4-a1b0-a903b085ea8a"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "cd59015e-d5e6-422c-95bf-fcab7800bdc1"
  }
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
      "ext": {},
      "id": "234"
    },
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
    "ifa": "44d8da17-33ff-4ace-adfe-02a490e2fffd",
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "ext": {},
  "id": "d4e97e3b-e050-4387-a37a-7c6fe9fd0669",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
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
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "d4e97e3b-e050-4387-a37a-7c6fe9fd0669",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "d4e97e3b-e050-4387-a37a-7c6fe9fd0669"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "44d8da17-33ff-4ace-adfe-02a490e2fffd"
  }
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
      "ext": {},
      "id": "234"
    },
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
    "ifa": "94398a04-a1b9-4f6e-ac30-67563c83bd24",
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "pxratio": 0.0,
    "ua": "Mozilla \/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit\/601.1.46 (KHTML, like Gecko) Version\/9.0 Mobile\/13B5110e Safari\/601.1"
  },
  "ext": {},
  "id": "5ad1bd7e-202c-4d56-b3fa-9e61d28b5af2",
  "imp": [
    {
      "banner": {
        "api": [],
        "battr": [],
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
      "stype": ""
    },
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "ext": {},
          "hp": 1,
          "rid": "5ad1bd7e-202c-4d56-b3fa-9e61d28b5af2",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "5ad1bd7e-202c-4d56-b3fa-9e61d28b5af2"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "eids": [
      {
        "source": "adingo.jp",
        "uids": [
          {
            "ext": {},
            "id": "09c0f512647c956bda2f56dcc77ecc21c1f5222b"
          }
        ]
      },
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
    ],
    "ext": {},
    "id": "94398a04-a1b9-4f6e-ac30-67563c83bd24"
  }
}
```

