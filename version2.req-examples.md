# fluct RTB Specification ver 2: Request Examples

* [Web](#web)
* [App](#app)
* [Native (icon)](#native-icon)
* [Video](#video)
* [Rewarded-Video](#rewarded-video)
* [Audio](#audio)
* [PMP Deal Only](#pmp-deal-only)
* [PMP Deal or Open Auction](#pmp-deal-or-open-auction)
* [With a Supply Chain (Google Open Bidding)](#with-a-supply-chain-google-open-bidding)
* [With a SKAdNetwork Request Object](#with-a-skadnetwork-request-object)
* [With User EIDs and Data](#with-user-eids-and-data)
* [With User-Agent Client Hints](#with-user-agent-client-hints)
* [With a Dynamic Video Pod](#with-a-dynamic-video-pod)
* [With a Regs](#with-a-regs)

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
  "id": "c26d7449-8451-4b95-a4a3-a32e1c6b7971",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "efc80960-5351-4c19-ae17-65eaa12b3082",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "c26d7449-8451-4b95-a4a3-a32e1c6b7971",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "c26d7449-8451-4b95-a4a3-a32e1c6b7971"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "72ee0a75-4098-4bb4-bb87-8810e09c9495"
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
    "ifa": "778c4549-200e-4322-b040-efeba86b301b",
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
  "id": "419e112a-6a37-4c9f-94da-1f89d7772416",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "c42a3ab8-c5b3-41ec-bf74-68b27d33a8f1",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "419e112a-6a37-4c9f-94da-1f89d7772416",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "419e112a-6a37-4c9f-94da-1f89d7772416"
  },
  "tmax": 280,
  "user": {
    "ext": {},
    "id": "778c4549-200e-4322-b040-efeba86b301b"
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
  "id": "e5c4504c-d8bf-4b00-b328-a6ca8cc1f31f",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "95cc24f9-e762-412e-876c-8bc65712c6c3",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "e5c4504c-d8bf-4b00-b328-a6ca8cc1f31f",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "e5c4504c-d8bf-4b00-b328-a6ca8cc1f31f"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "69cf3d601eaa49850bc0e17fa0544e33793cd2f4"
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
  "id": "cb864fa8-9e46-4db6-9c03-0a29f40d4af3",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "e0b071ad-a2de-4708-9f25-ba6338fc1e89",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "cb864fa8-9e46-4db6-9c03-0a29f40d4af3",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "cb864fa8-9e46-4db6-9c03-0a29f40d4af3"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "ac4579eb-81c7-4547-b6e4-92341dd34943"
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
    "ifa": "d3a5ab61-3907-4f0e-b6ad-73e15057c6da",
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
  "id": "ccabcf8f-bd8e-4e28-8ecb-a63d2c65555b",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "displaymanager": "FluctSDK",
      "displaymanagerver": "1.2.3",
      "ext": {},
      "id": "66ddaf07-f9e8-4baf-83d1-bbcd313b1114",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "ccabcf8f-bd8e-4e28-8ecb-a63d2c65555b",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "ccabcf8f-bd8e-4e28-8ecb-a63d2c65555b"
  },
  "tmax": 280,
  "user": {
    "ext": {},
    "gender": "M",
    "id": "d3a5ab61-3907-4f0e-b6ad-73e15057c6da",
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
  "id": "59d06212-65ca-457d-9935-e9b78248a444",
  "imp": [
    {
      "audio": {
        "api": [],
        "companionad": [
          {
            "ext": {},
            "format": [
              {
                "h": 250,
                "w": 300
              },
              {
                "h": 640,
                "w": 640
              }
            ],
            "h": 250,
            "w": 300
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
      "id": "735454f5-e254-4986-b801-472892275eca",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "59d06212-65ca-457d-9935-e9b78248a444",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "59d06212-65ca-457d-9935-e9b78248a444"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "63c7edac-fc49-4c91-9c68-d2e918809623"
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
  "id": "902936d6-3075-4412-828b-99d4324c67d4",
  "imp": [
    {
      "ext": {},
      "id": "b768ab3e-e7a3-4530-9856-618a95679a38",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "902936d6-3075-4412-828b-99d4324c67d4",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "902936d6-3075-4412-828b-99d4324c67d4"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "2094abba-dc18-4ca3-8b4e-1ddce45a7637"
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
  "id": "8e73d8d3-bf66-4329-98e8-4a276c36308d",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "3cb2cb9a-e5e8-4931-91f3-9d17a8194907",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "8e73d8d3-bf66-4329-98e8-4a276c36308d",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "8e73d8d3-bf66-4329-98e8-4a276c36308d"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "3109e69d-f0d0-4c29-99b2-3f8e5dc8253c"
  }
}
```

### With Supply Chain (Google Open Bidding)

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
  "id": "31a382ee-d9b3-4988-aa65-691be7992028",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "2840184e-d379-4eeb-9e1a-26c721799170",
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
    "fd": 0,
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
          "rid": "31a382ee-d9b3-4988-aa65-691be7992028",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "31a382ee-d9b3-4988-aa65-691be7992028"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "4bae6122-d697-4923-bcbb-c25b2d8d278c"
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
    "ifa": "1d55965d-8bc0-4c4a-916b-1bcb6fca123a",
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
  "id": "f8ac1d01-005e-4d34-8c01-3c0ad7d89b12",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "2b74f196-9352-44fa-859e-a42729daaa17",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "f8ac1d01-005e-4d34-8c01-3c0ad7d89b12",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "f8ac1d01-005e-4d34-8c01-3c0ad7d89b12"
  },
  "tmax": 280,
  "user": {
    "ext": {},
    "id": "1d55965d-8bc0-4c4a-916b-1bcb6fca123a"
  }
}
```

### With User EIDs and Data

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
  "id": "398727a8-d658-4777-9020-3ad95e6369cc",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "d10284a7-a9ed-4fd5-9dd9-aad44ca7f88c",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "398727a8-d658-4777-9020-3ad95e6369cc",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "398727a8-d658-4777-9020-3ad95e6369cc"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "data": [
      {
        "ext": {
          "segtax": 900
        },
        "name": "a1mediagroup.com",
        "segment": [
          {
            "id": "segment-1"
          },
          {
            "id": "segment-2"
          }
        ]
      }
    ],
    "eids": [
      {
        "source": "liveramp.com",
        "uids": [
          {
            "atype": 3,
            "id": "Xi1630PYG6pKEmD-lUmj13MH_FyvZC7sVRrA2YEpJAyIIKnlP7HcRdWVgEid8XXXXXXXX"
          }
        ]
      },
      {
        "source": "intimatemerger.com",
        "uids": [
          {
            "atype": 1,
            "id": "i.gP3A0S8oRqmW-EXXXXXXXX"
          }
        ]
      },
      {
        "source": "criteo.com",
        "uids": [
          {
            "atype": 1,
            "id": "V4fK-F82YWl6cmE4WU0xZDlVMm1jVnFkNmxycjI3bkZIVDhaVEREaDlzTTlLZHpEVjRqd2REMG5WeExrJTJCTFYzMnhkT0JjRmtWRTB3d2g3bjNrVjdQU0ZtZ2dYb0NLRVRTeDFPaDlPWGJZcndRNkF2YjhqZ0tUbk5jdEN1WHo2XXXXXXXX"
          }
        ]
      },
      {
        "source": "adserver.org",
        "uids": [
          {
            "atype": 1,
            "ext": {
              "rtiPartner": "TDID"
            },
            "id": "5f284ada-a54f-4a94-8574-43b64941ffab"
          }
        ]
      },
      {
        "source": "adingo.jp",
        "uids": [
          {
            "atype": 1,
            "id": "09c0f512647c956bda2f56dcc77ecc21c1f5222b"
          }
        ]
      },
      {
        "source": "a1mediagroup.com",
        "uids": [
          {
            "atype": 1,
            "id": "a1_gid"
          }
        ]
      }
    ],
    "ext": {},
    "id": "be6b32e7c361597b18cdc96cdbe230dec89daf63"
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
  "id": "76489537-698e-487f-8426-be0ed4d31dfa",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "4a225c3b-17bb-4ce3-860a-465612e45850",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "76489537-698e-487f-8426-be0ed4d31dfa",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "76489537-698e-487f-8426-be0ed4d31dfa"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "83a5cd0e-bd09-4115-9165-474f15220e5e"
  }
}
```

### With a Dynamic Video Pod

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
  "id": "ddea090a-cdc1-48f2-bba3-0550d1054a46",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "b3b8cc41-3fd9-4d30-9670-82b0132a4dff",
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
        "companionad": [
          {
            "api": [
              5
            ],
            "ext": {},
            "format": [
              {
                "h": 250,
                "w": 300
              }
            ],
            "h": 250,
            "w": 300
          }
        ],
        "ext": {},
        "linearity": 1,
        "maxbitrate": 2000,
        "maxseq": 6,
        "mimes": [
          "video/mp4"
        ],
        "minbitrate": 0,
        "placement": 1,
        "poddur": 60,
        "pos": 1,
        "protocols": [
          3,
          6
        ],
        "rqddurs": [
          10,
          15,
          20,
          30
        ],
        "skip": 1,
        "startdelay": 0
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "ddea090a-cdc1-48f2-bba3-0550d1054a46",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "ddea090a-cdc1-48f2-bba3-0550d1054a46"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "0f9a61321138f89ec9a3d925a387788e4edf63ea"
  }
}
```

### With a Regs

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
  "id": "281f1a48-a88b-4813-a7ec-2bb5095bcdae",
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
            "h": 100,
            "w": 320
          },
          {
            "h": 180,
            "w": 320
          }
        ],
        "h": 250,
        "pos": 1,
        "w": 300
      },
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "18accf73-0ba4-428e-80e2-ad38cc835497",
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
    "ext": {},
    "fd": 0,
    "schain": {
      "complete": 1,
      "nodes": [
        {
          "asi": "adingo.jp",
          "hp": 1,
          "rid": "281f1a48-a88b-4813-a7ec-2bb5095bcdae",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "281f1a48-a88b-4813-a7ec-2bb5095bcdae"
  },
  "regs": {
    "coppa": 1,
    "gpp": "gppstring",
    "gpp_sid": [1, 2]
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "d23164eb-a5bc-412f-9b12-9e50a2423d4a"
  }
}
```

