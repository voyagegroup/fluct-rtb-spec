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
  "id": "22bdf2ce-94e5-4d85-852f-58e1cfd63d33",
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
          "rid": "22bdf2ce-94e5-4d85-852f-58e1cfd63d33",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "22bdf2ce-94e5-4d85-852f-58e1cfd63d33"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "bc0dd7b6-b141-4e48-aebf-aa467c4e548d"
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
    "ifa": "b6d5928a-4ed0-4b34-9972-f2410c31fe4c",
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
  "id": "53fd15fb-0cd6-4be6-92b7-3fd2457ebf5c",
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
          "hp": 1,
          "rid": "53fd15fb-0cd6-4be6-92b7-3fd2457ebf5c",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "53fd15fb-0cd6-4be6-92b7-3fd2457ebf5c"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "b6d5928a-4ed0-4b34-9972-f2410c31fe4c"
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
  "id": "17a0670c-8f3c-4334-9e99-488151491cd8",
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
          "rid": "17a0670c-8f3c-4334-9e99-488151491cd8",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "17a0670c-8f3c-4334-9e99-488151491cd8"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "80d217ee6e2c221fb7714da5bd282c38a26e0133"
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
  "id": "60bdb9c1-c612-4dd8-bc58-ec9d9feeb2f0",
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
          "rid": "60bdb9c1-c612-4dd8-bc58-ec9d9feeb2f0",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "60bdb9c1-c612-4dd8-bc58-ec9d9feeb2f0"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "6f209291-373c-4c6a-b23f-fb1939fbf65e"
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
    "ifa": "bfc510c1-bf84-4373-a48a-cd384cda88c9",
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
  "id": "28e790c0-e93c-4ed0-816d-85f5a1e917c4",
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
          "rid": "28e790c0-e93c-4ed0-816d-85f5a1e917c4",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "28e790c0-e93c-4ed0-816d-85f5a1e917c4"
  },
  "tmax": 300,
  "user": {
    "buyeruid": "",
    "ext": {},
    "gender": "M",
    "id": "bfc510c1-bf84-4373-a48a-cd384cda88c9",
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
  "id": "fb8761a9-0602-4017-b841-c0e0dc53506c",
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
          "rid": "fb8761a9-0602-4017-b841-c0e0dc53506c",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "fb8761a9-0602-4017-b841-c0e0dc53506c"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "f674e0e0-f0dc-4abe-853f-192cfa10628a"
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
  "id": "e15fef6f-9e0b-40b4-a08f-eaa58483959f",
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
          "rid": "e15fef6f-9e0b-40b4-a08f-eaa58483959f",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "e15fef6f-9e0b-40b4-a08f-eaa58483959f"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "381d7b6c-6965-47b8-8dd1-be46ce38c911"
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
  "id": "abcc3706-98c4-4d99-8eac-37a6aea39c70",
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
      "id": "",
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
          "rid": "abcc3706-98c4-4d99-8eac-37a6aea39c70",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "abcc3706-98c4-4d99-8eac-37a6aea39c70"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "6e4420a4-0ce7-44ba-a5b4-22839c80f75e"
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
  "id": "f56fb60b-70de-4166-b5ac-4e279657da61",
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
          "rid": "f56fb60b-70de-4166-b5ac-4e279657da61",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "b9f1530f-9a41-4476-8024-a507d84ebe13"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "3dc7386f-3bd0-444d-82b7-6e973f0e10cf"
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
    "ifa": "7930f511-3ede-4719-ab72-20b5c3d86ee0",
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
  "id": "a836966d-b86f-495a-997d-2a4114cf9f17",
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
          "hp": 1,
          "rid": "a836966d-b86f-495a-997d-2a4114cf9f17",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "a836966d-b86f-495a-997d-2a4114cf9f17"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "7930f511-3ede-4719-ab72-20b5c3d86ee0"
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
    "ifa": "9c20bf67-ad7f-4c33-8544-b55d9787d1f8",
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
  "id": "38091d5f-9d51-4fda-8ff2-e151a23c6eaf",
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
          "hp": 1,
          "rid": "38091d5f-9d51-4fda-8ff2-e151a23c6eaf",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "38091d5f-9d51-4fda-8ff2-e151a23c6eaf"
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
    "id": "9c20bf67-ad7f-4c33-8544-b55d9787d1f8"
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
  "id": "b09baf18-2878-4295-9baf-8d9e28fec328",
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
          "rid": "b09baf18-2878-4295-9baf-8d9e28fec328",
          "sid": "234"
        }
      ],
      "ver": "1.0"
    },
    "tid": "b09baf18-2878-4295-9baf-8d9e28fec328"
  },
  "tmax": 280,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "8ed0ddc6-9962-421f-8654-3271353a6b33"
  }
}
```

