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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
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
  "id": "526e0673-6c0b-46d5-b945-f7075a1db26c",
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
            "rid": "526e0673-6c0b-46d5-b945-f7075a1db26c",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "526e0673-6c0b-46d5-b945-f7075a1db26c"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "6d51a515f01cbc4936e11a2196f478ff00c4e746"
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
    },
    "hwv": "",
    "ifa": "dea06fec-cc9d-4656-8cfa-a9cfb9809a80",
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
  "id": "8d836437-b19b-403b-bdf7-f4d2045406bc",
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
            "rid": "8d836437-b19b-403b-bdf7-f4d2045406bc",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "8d836437-b19b-403b-bdf7-f4d2045406bc"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "dea06fec-cc9d-4656-8cfa-a9cfb9809a80"
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
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
  "id": "d01d1662-d25a-42af-b69f-cb7ec9d2e1ef",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
      "native": {
        "api": [],
        "battr": [],
        "ext": {},
        "request": "{\"native\":{\"assets\":[{\"id\":1,\"title\":{\"len\":20}},{\"id\":2,\"img\":{\"hmin\":160,\"type\":1,\"wmin\":160}},{\"data\":{\"len\":30,\"type\":1},\"id\":3},{\"data\":{\"len\":50,\"type\":2},\"id\":4}],\"layout\":3}}",
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
            "rid": "d01d1662-d25a-42af-b69f-cb7ec9d2e1ef",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "d01d1662-d25a-42af-b69f-cb7ec9d2e1ef"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "e2cfd6369dd09425ed9a69ef271d665615e64046"
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
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
  "id": "58a04645-5763-4a3e-9ce4-f4f33a551a6a",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "ext": {},
      "id": "",
      "instl": 0,
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
        "skip": 0,
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
            "rid": "58a04645-5763-4a3e-9ce4-f4f33a551a6a",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "58a04645-5763-4a3e-9ce4-f4f33a551a6a"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "5b06322a95f3997cee6a0763c59a97e197185029"
  },
  "wseat": []
}
```

### Rewarded-Video

リワード付き動画広告においては、 `imp.video.ext.videotype = "rewarded"` 等でそれを明示することが可能です。

For rewarded-video ad, a request video-object can explicitly include optional parameter `imp.video.ext.videotype = "rewarded"` or similar.

```json
{
  "app": {
    "bundle": "1234567890",
    "cat": [
      "IAB1"
    ],
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
    },
    "hwv": "",
    "ifa": "ee2c8225-6feb-4bc1-b1a7-233ee9e2482f",
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
  "id": "1728c374-6a72-4a84-937b-cc439daf3444",
  "imp": [
    {
      "bidfloor": 2.430134,
      "bidfloorcur": "USD",
      "displaymanager": "FluctSDK",
      "displaymanagerver": "1.2.3",
      "ext": {},
      "id": "",
      "instl": 1,
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
            "rid": "1728c374-6a72-4a84-937b-cc439daf3444",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "1728c374-6a72-4a84-937b-cc439daf3444"
  },
  "tmax": 300,
  "user": {
    "buyeruid": "",
    "ext": {},
    "id": "ee2c8225-6feb-4bc1-b1a7-233ee9e2482f"
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 0,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
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
  "id": "2de96e98-4fad-4e83-b92b-907acdddb535",
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
            "rid": "2de96e98-4fad-4e83-b92b-907acdddb535",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "2de96e98-4fad-4e83-b92b-907acdddb535"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "7162fb3c3056d052e3f1a397ee8c6e0c54d6027a"
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
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
  "id": "63feee14-7251-4ce1-a397-1c039b99432c",
  "imp": [
    {
      "ext": {},
      "id": "",
      "instl": 0,
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
        "skip": 0,
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
            "rid": "63feee14-7251-4ce1-a397-1c039b99432c",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "63feee14-7251-4ce1-a397-1c039b99432c"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "f1cbf2653819d55ffd71f265653bc380fe11c603"
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
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
  "id": "646be0d0-7d91-428f-9ef5-810cf6b74e0f",
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
            "rid": "646be0d0-7d91-428f-9ef5-810cf6b74e0f",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": ""
    },
    "fd": 0,
    "tid": "646be0d0-7d91-428f-9ef5-810cf6b74e0f"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "bc0e97fd046f34c60b8772777acefd15c80b3a3e"
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
  "bcat": [],
  "cur": [
    "JPY",
    "USD"
  ],
  "device": {
    "carrier": "",
    "connectiontype": 2,
    "devicetype": 2,
    "dnt": 0,
    "geo": {
      "country": "JPN"
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
  "id": "735d6307-5b0b-45b5-9ca7-e4632e0b4d39",
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
            "rid": "735d6307-5b0b-45b5-9ca7-e4632e0b4d39",
            "sid": "234"
          }
        ],
        "ver": "1.0"
      },
      "stype": "EB"
    },
    "fd": 1,
    "tid": "c2d8ad25-4cab-444d-9f76-57f5a6dfe30b"
  },
  "tmax": 120,
  "user": {
    "buyeruid": "synced-buyeruid",
    "ext": {},
    "id": "bc52ab0a9223f722c57c16dc0d6cc21a080bd22c"
  },
  "wseat": []
}
```

