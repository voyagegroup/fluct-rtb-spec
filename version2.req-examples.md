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
* [With User-Agent Client Hints](#with-user-agent-client-hints)

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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "os": "Windows NT",
    "osv": "10.0",
    "sua": {
      "browsers": [
        {
          "brand": "Google Chrome",
          "version": [
            "51"
          ]
        }
      ],
      "platform": {
        "brand": "Windows"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393"
  },
  "ext": {},
  "id": "c80a7acb-df66-47a2-bfbd-bfadfe3e6a12",
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
          },
          {
            "h": 180,
            "w": 320
          },
          {
            "h": 100,
            "w": 320
          }
        ],
        "pos": 1
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "dc4c6792-2837-4089-a1a0-f0c270c2cccc",
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "rid": "c80a7acb-df66-47a2-bfbd-bfadfe3e6a12",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "c80a7acb-df66-47a2-bfbd-bfadfe3e6a12"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "e64972cf-555f-43fb-8a9d-2227b495b1c3"
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
    "storeurl": "https://apps.apple.com/jp/app/hogehoge-app/id1234567890"
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
    "ifa": "4712b640-4989-4d45-a7d2-cd95fd905a98",
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "sua": {
      "browsers": [
        {
          "brand": "Safari",
          "version": [
            "9"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "iOS"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
  },
  "ext": {},
  "id": "a2ced564-2fef-4c7e-aaab-b84367b51f07",
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
          },
          {
            "h": 180,
            "w": 320
          },
          {
            "h": 100,
            "w": 320
          }
        ],
        "pos": 1
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "0338372e-2e23-42ed-a19e-468db3dd82da",
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
          "hp": 1,
          "rid": "a2ced564-2fef-4c7e-aaab-b84367b51f07",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "a2ced564-2fef-4c7e-aaab-b84367b51f07"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "4712b640-4989-4d45-a7d2-cd95fd905a98"
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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "SH-04L",
    "os": "Android",
    "osv": "11",
    "sua": {
      "browsers": [
        {
          "brand": "Google Chrome",
          "version": [
            "109"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "Android"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (Linux; Android 11; SH-04L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36"
  },
  "ext": {},
  "id": "18eb6ed9-eece-4d5b-9502-21846f8bbcc4",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "c4321ac4-150a-4f6d-94d3-0cc05cdfa729",
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "rid": "18eb6ed9-eece-4d5b-9502-21846f8bbcc4",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "18eb6ed9-eece-4d5b-9502-21846f8bbcc4"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "0213bfe22b65af16aaa7c1fdc7eaf525763f9bb5"
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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "os": "Windows NT",
    "osv": "10.0",
    "sua": {
      "browsers": [
        {
          "brand": "Google Chrome",
          "version": [
            "51"
          ]
        }
      ],
      "platform": {
        "brand": "Windows"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393"
  },
  "ext": {},
  "id": "6977dc87-fc6b-42f0-a393-07aae5d1b5c3",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "058e9ab9-f3b0-408f-b608-837b6893bb89",
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
        "ext": {},
        "h": 250,
        "linearity": 1,
        "maxbitrate": 2000,
        "maxduration": 15,
        "mimes": [
          "video/mp4",
          "video/x-m4v",
          "video/quicktime",
          "video/avi",
          "video/3gpp2",
          "video/3gpp"
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "rid": "6977dc87-fc6b-42f0-a393-07aae5d1b5c3",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "6977dc87-fc6b-42f0-a393-07aae5d1b5c3"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "b8e8479b-dc80-4c12-953e-dc2c3b233e0d"
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
    "storeurl": "https://apps.apple.com/jp/app/hogehoge-app/id1234567890"
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
    "ifa": "185c138c-5fff-48c2-aa44-ec3b7ff57215",
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "sua": {
      "browsers": [
        {
          "brand": "Safari",
          "version": [
            "9"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "iOS"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1",
    "w": 750
  },
  "ext": {},
  "id": "a49edeee-47ff-4422-9826-57b888dd2e70",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "displaymanager": "FluctSDK",
      "displaymanagerver": "1.2.3",
      "ext": {},
      "id": "751485cd-a4a3-4e0a-9235-49c24cf2ebba",
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
        "boxingallowed": 1,
        "companionad": [
          {
            "api": [
              5
            ],
            "ext": {},
            "vcm": 1
          }
        ],
        "ext": {},
        "h": 647,
        "linearity": 1,
        "maxbitrate": 2000,
        "maxduration": 30,
        "mimes": [
          "video/mp4",
          "video/x-m4v",
          "video/quicktime",
          "video/avi",
          "video/3gpp2",
          "video/3gpp"
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
          "hp": 1,
          "rid": "a49edeee-47ff-4422-9826-57b888dd2e70",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "a49edeee-47ff-4422-9826-57b888dd2e70"
  },
  "tmax": 300,
  "user": {
    "buyeruid": "",
    "ext": {},
    "gender": "M",
    "id": "185c138c-5fff-48c2-aa44-ec3b7ff57215",
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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "os": "Windows NT",
    "osv": "10.0",
    "sua": {
      "browsers": [
        {
          "brand": "Google Chrome",
          "version": [
            "51"
          ]
        }
      ],
      "platform": {
        "brand": "Windows"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393"
  },
  "ext": {},
  "id": "11f2727a-60f7-4a58-88ff-e7a7eb7fcc6a",
  "imp": [
    {
      "audio": {
        "api": [],
        "companionad": [
          {
            "ext": {},
            "format": [
              {
                "h": 640,
                "w": 640
              },
              {
                "h": 250,
                "w": 300
              }
            ]
          }
        ],
        "companiontype": [
          1
        ],
        "ext": {},
        "feed": 2,
        "maxbitrate": 2000,
        "maxduration": 15,
        "mimes": [
          "audio/mp3",
          "audio/mpeg"
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
      "id": "64612436-5eb1-4b70-bed1-9006e619f17f",
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "rid": "11f2727a-60f7-4a58-88ff-e7a7eb7fcc6a",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "11f2727a-60f7-4a58-88ff-e7a7eb7fcc6a"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "21f499d3-f044-40b4-bbe5-daf941077b6e"
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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "sua": {
      "browsers": [
        {
          "brand": "Safari",
          "version": [
            "9"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "iOS"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
  },
  "ext": {},
  "id": "d534c71a-78b9-4abd-b618-97f71b494674",
  "imp": [
    {
      "ext": {},
      "id": "823c7bf9-d3e7-4a2c-b4da-35fa1de823ff",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [
          {
            "at": 1,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {
              "publisher_blocks_overridden": 1
            },
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
        "boxingallowed": 1,
        "ext": {},
        "h": 250,
        "linearity": 1,
        "maxbitrate": 2000,
        "maxduration": 15,
        "mimes": [
          "video/mp4",
          "video/x-m4v",
          "video/quicktime",
          "video/avi",
          "video/3gpp2",
          "video/3gpp"
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "rid": "d534c71a-78b9-4abd-b618-97f71b494674",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "d534c71a-78b9-4abd-b618-97f71b494674"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "cd4ad743-0114-4f67-bf2c-ef1ceec0aa26"
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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "sua": {
      "browsers": [
        {
          "brand": "Safari",
          "version": [
            "9"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "iOS"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
  },
  "ext": {},
  "id": "187251ce-7c50-4144-8c8d-06dd96279a80",
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
          },
          {
            "h": 180,
            "w": 320
          },
          {
            "h": 100,
            "w": 320
          }
        ],
        "pos": 1
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "5cfb5083-e2e1-4a5a-980c-b47682a955e0",
      "instl": 0,
      "metric": [],
      "pmp": {
        "deals": [
          {
            "at": 1,
            "bidfloor": 4.050223,
            "bidfloorcur": "USD",
            "ext": {
              "publisher_blocks_overridden": 1
            },
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "rid": "187251ce-7c50-4144-8c8d-06dd96279a80",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "187251ce-7c50-4144-8c8d-06dd96279a80"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "43954f73-108a-4310-aee2-e8a65cc89a09"
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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "sua": {
      "browsers": [
        {
          "brand": "Safari",
          "version": [
            "9"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "iOS"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
  },
  "ext": {},
  "id": "4a9e6484-941b-48e0-a013-a14f2ce36c22",
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
          },
          {
            "h": 180,
            "w": 320
          },
          {
            "h": 100,
            "w": 320
          }
        ],
        "pos": 1
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "1fba3006-1afc-4cc8-a5c7-43a4d307a3a9",
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "sid": "pub-8141000000000000"
        },
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "4a9e6484-941b-48e0-a013-a14f2ce36c22",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "df9ea515-77e0-4865-b9b4-ec521a6aaa76"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "34a8d93a-a277-4445-9cea-69aaef27fc9d"
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
    "storeurl": "https://apps.apple.com/jp/app/hogehoge-app/id1234567890"
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
    "ifa": "ec761e3a-f299-4e6a-8559-b39a0c5449f1",
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "sua": {
      "browsers": [
        {
          "brand": "Safari",
          "version": [
            "9"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "iOS"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
  },
  "ext": {},
  "id": "c7813d17-37dd-480d-ace7-2706daa63ba0",
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
          },
          {
            "h": 180,
            "w": 320
          },
          {
            "h": 100,
            "w": 320
          }
        ],
        "pos": 1
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
          "versions": [
            "2.0"
          ]
        }
      },
      "id": "01139f46-c5d8-4351-84a1-56cc52acdd25",
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
          "hp": 1,
          "rid": "c7813d17-37dd-480d-ace7-2706daa63ba0",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "c7813d17-37dd-480d-ace7-2706daa63ba0"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "ec761e3a-f299-4e6a-8559-b39a0c5449f1"
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
    "storeurl": "https://apps.apple.com/jp/app/hogehoge-app/id1234567890"
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
    "ifa": "dd6f3f9b-5117-47e4-a197-d1aea419d08b",
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "Apple",
    "model": "iPhone",
    "os": "iOS",
    "osv": "9.1",
    "sua": {
      "browsers": [
        {
          "brand": "Safari",
          "version": [
            "9"
          ]
        }
      ],
      "mobile": 1,
      "platform": {
        "brand": "iOS"
      },
      "source": 3
    },
    "ua": "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1"
  },
  "ext": {},
  "id": "ad18ccbd-c56d-4e56-94b7-7e2130670df8",
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
          },
          {
            "h": 180,
            "w": 320
          },
          {
            "h": 100,
            "w": 320
          }
        ],
        "pos": 1
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "f3a03832-a2d9-40b0-ba72-ffb4167a37c6",
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
          "hp": 1,
          "rid": "ad18ccbd-c56d-4e56-94b7-7e2130670df8",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "ad18ccbd-c56d-4e56-94b7-7e2130670df8"
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
    "id": "dd6f3f9b-5117-47e4-a197-d1aea419d08b"
  }
}
```

### With User-Agent Client Hints

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
    "ip": "210.168.46.254",
    "language": "ja",
    "lmt": 0,
    "make": "",
    "model": "SH-04L",
    "os": "Android",
    "osv": "11",
    "sua": {
      "browsers": [
        {
          "brand": "Chromium",
          "version": [
            "109"
          ]
        },
        {
          "brand": "Google Chrome",
          "version": [
            "109"
          ]
        },
        {
          "brand": "Not_A Brand",
          "version": [
            "99"
          ]
        }
      ],
      "mobile": 1,
      "model": "SH-04L",
      "platform": {
        "brand": "Android",
        "version": [
          "11",
          "0",
          "0"
        ]
      },
      "source": 2
    },
    "ua": "Mozilla/5.0 (Linux; Android 11; SH-04L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36"
  },
  "ext": {},
  "id": "01cda5f2-d69d-467f-a3c7-edd02f8726f7",
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
          },
          {
            "h": 180,
            "w": 320
          },
          {
            "h": 100,
            "w": 320
          }
        ],
        "pos": 1
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "f1cc5739-a4e3-425d-8350-5d2d850fc24e",
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
    "page": "https://magazine.fluct.jp/category/news",
    "pagecat": [],
    "publisher": {
      "ext": {},
      "id": "234"
    },
    "ref": "https://google.com/search?"
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
          "hp": 1,
          "rid": "01cda5f2-d69d-467f-a3c7-edd02f8726f7",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "01cda5f2-d69d-467f-a3c7-edd02f8726f7"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "f169c09b-b603-4468-a8e4-f81b9c56d6e8"
  }
}
```

