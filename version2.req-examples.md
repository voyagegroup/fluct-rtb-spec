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

### Web

```json
{
  "at": 1,
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
  "id": "043a61e9-f55a-4a33-8289-a40e12202577",
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
      "id": "3bd9bc33-87ea-429d-af57-46ab55c0389d",
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
          "rid": "043a61e9-f55a-4a33-8289-a40e12202577",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "043a61e9-f55a-4a33-8289-a40e12202577"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "53dc2c3e-15ce-4b9b-878f-fd281484d3f5"
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
    "ifa": "afca0b34-3cae-4bdb-8092-17c9da57687d",
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
  "id": "6e15035a-93b0-4b18-9f7e-88969ed5ff64",
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
      "id": "77be9706-cd68-46c4-bb06-60cc1b896f77",
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
          "rid": "6e15035a-93b0-4b18-9f7e-88969ed5ff64",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "6e15035a-93b0-4b18-9f7e-88969ed5ff64"
  },
  "tmax": 280,
  "user": {
    "ext": {},
    "id": "afca0b34-3cae-4bdb-8092-17c9da57687d"
  }
}
```

### Native (icon)

```json
{
  "at": 1,
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
  "id": "e33f944e-c72c-4658-ae4a-b0709225da51",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "56752956-fa84-4f82-97a5-ff66de6b498b",
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
          "rid": "e33f944e-c72c-4658-ae4a-b0709225da51",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "e33f944e-c72c-4658-ae4a-b0709225da51"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "3c76c9b0d7d5666423009b9a85a2fbdb22ab6b8a"
  }
}
```

### Video

```json
{
  "at": 1,
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
  "id": "8a442200-8342-4857-91f1-dadd58ccead4",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "7c7aab48-22fd-4317-ba3f-9bcb0ea7ded1",
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
          "rid": "8a442200-8342-4857-91f1-dadd58ccead4",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "8a442200-8342-4857-91f1-dadd58ccead4"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "118ca4c2-e26c-4845-bc75-81dd3f9155c3"
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
    "ifa": "5fcb4367-0fc8-4ad3-9d76-98d093dfd5cc",
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
  "id": "ee279675-81eb-4f06-84f0-06d58786a6fa",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "displaymanager": "FluctSDK",
      "displaymanagerver": "1.2.3",
      "ext": {},
      "id": "1ac6faa3-94ee-4f5e-abf2-a500eb61274c",
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
          "rid": "ee279675-81eb-4f06-84f0-06d58786a6fa",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "ee279675-81eb-4f06-84f0-06d58786a6fa"
  },
  "tmax": 280,
  "user": {
    "ext": {},
    "gender": "M",
    "id": "5fcb4367-0fc8-4ad3-9d76-98d093dfd5cc",
    "yob": 2000
  }
}
```

### Audio

```json
{
  "at": 1,
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
  "id": "315a6077-97d1-497a-97d8-9a70d916b4c6",
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
      "id": "4e0e5648-173d-4708-9db4-66524dc241eb",
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
          "rid": "315a6077-97d1-497a-97d8-9a70d916b4c6",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "315a6077-97d1-497a-97d8-9a70d916b4c6"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "f936de88-06c6-4ea8-b0e7-26c6d04de99a"
  }
}
```

### PMP Deal Only

```json
{
  "at": 1,
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
  "id": "54dd4768-f49e-4821-9625-0360a02795aa",
  "imp": [
    {
      "ext": {},
      "id": "dfaada94-c394-427f-a538-be594fb16b93",
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
          "rid": "54dd4768-f49e-4821-9625-0360a02795aa",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "54dd4768-f49e-4821-9625-0360a02795aa"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "d2e850a2-50ec-4691-9212-788f02b12150"
  }
}
```

### PMP Deal or Open Auction

```json
{
  "at": 1,
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
  "id": "7bd8c567-204c-4648-8493-a201fce18c76",
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
      "id": "05faf0c9-a61f-4144-b0e5-83c58cec094e",
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
          "rid": "7bd8c567-204c-4648-8493-a201fce18c76",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "7bd8c567-204c-4648-8493-a201fce18c76"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "ccddb284-a6ca-40c7-8966-db37b5450def"
  }
}
```

### With Supply Chain (Google Open Bidding)

Google Open Bidding transaction example.

```json
{
  "at": 1,
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
  "id": "40c89d1f-9624-4315-b4a4-2e45ac6704d7",
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
      "id": "18819696-cbfe-4825-93c0-50d798e878f8",
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
          "rid": "40c89d1f-9624-4315-b4a4-2e45ac6704d7",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "40c89d1f-9624-4315-b4a4-2e45ac6704d7"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "7c777006-79e5-4325-9dab-805ba8b9ca41"
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
    "ifa": "cbfef316-6e6f-4e50-8b81-2e9025aca574",
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
  "id": "3a0c1233-2a2e-4984-ba72-bb7d4a90b8ea",
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
      "id": "9952611d-f515-4b65-94b2-d94bd04980ea",
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
          "rid": "3a0c1233-2a2e-4984-ba72-bb7d4a90b8ea",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "3a0c1233-2a2e-4984-ba72-bb7d4a90b8ea"
  },
  "tmax": 280,
  "user": {
    "ext": {},
    "id": "cbfef316-6e6f-4e50-8b81-2e9025aca574"
  }
}
```

### With User EIDs and Data

```json
{
  "at": 1,
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
  "id": "06e0ef9b-53f4-47ce-9a9a-9bc593adbd99",
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
      "id": "e66e6394-8c08-461d-a7f5-278e931233e1",
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
          "rid": "06e0ef9b-53f4-47ce-9a9a-9bc593adbd99",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "06e0ef9b-53f4-47ce-9a9a-9bc593adbd99"
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
    "id": "967ded9ab61b1339acbcdcc8d08a7695aceb4494"
  }
}
```

### With User-Agent Client Hints

```json
{
  "at": 1,
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
  "id": "39641d84-89ec-4855-bd40-c8cd416e10ee",
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
      "id": "ab085ea0-9178-4d49-b979-4fa63f073aa4",
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
          "rid": "39641d84-89ec-4855-bd40-c8cd416e10ee",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "39641d84-89ec-4855-bd40-c8cd416e10ee"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "c1f66e88-f722-4807-be09-755b04c198d8"
  }
}
```

### With a Dynamic Video Pod

```json
{
  "at": 1,
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
  "id": "85b85a69-e784-4dae-ab19-9d7403b18e6f",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "05f8a9da-0764-4cc9-9850-cd311d39ad4c",
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
          "rid": "85b85a69-e784-4dae-ab19-9d7403b18e6f",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "85b85a69-e784-4dae-ab19-9d7403b18e6f"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "3a8c969c8185b2f5d0fbf9db559184b570e46f9b"
  }
}
```

