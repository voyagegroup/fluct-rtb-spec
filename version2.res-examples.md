# fluct RTB Specification ver 2: Response Examples

* [Banner](#banner)
* [Native](#native)
* [Video/Audio](#videoaudio)
* [With dealid](#with-dealid)
* [With nurl and lurl](#with-nurl-and-lurl)
* [With bundle](#with-bundle)

### Banner

```json
{
  "cur": "USD",
  "id": "0000fbb5-0000-4218-8551-4ea553000000",
  "seatbid": [
    {
      "bid": [
        {
          "adid": "40734",
          "adm": "<script>(function(){var e=this||self;})()</script><div><img src=\"https://adsystem/?q=eD3TPt6ibXC7FHb5U3gXH6ylGqZ5kc355we1OGn87GXzNth1O7M1hYDg&pr=${AUCTION_PRICE}\" border=0 width=1 height=1 alt=\"\" style=\"display:none\"></div>",
          "adomain": [
            "ecnavi.jp"
          ],
          "cid": "75580",
          "crid": "40734",
          "h": 250,
          "id": "0",
          "impid": "00007d85-89e3-41e9-9e09-96e3a5000000",
          "language": "ja",
          "price": 0.014828,
          "w": 300
        }
      ]
    }
  ]
}
```

### Native

```json
{
  "cur": "JPY",
  "id": "78a69e4a-0000-4e94-8e14-a6e815000000",
  "seatbid": [
    {
      "bid": [
        {
          "adid": "9Kfj2l",
          "adm": "{\"native\":{\"ver\":\"1.1\",\"assets\":[{\"id\":1,\"title\":{\"text\":\"今すぐお届けできます\"}},{\"id\":4,\"data\":{\"value\":\"東陽2丁目店\"}},{\"id\":3,\"data\":{\"value\":\"出前\"}},{\"id\":2,\"img\":{\"url\":\"https://adsystem/img.png\",\"w\":160,\"h\":160}}],\"link\":{\"url\":\"https://adsystem/landing-url\"},\"imptrackers\":[\"https:///wp=${AUCTION_PRICE}\"]}}",
          "adomain": [
            "ecnavi.jp"
          ],
          "attr": [],
          "cid": "JUgtXt",
          "crid": "9Kfj2l",
          "id": "201912",
          "impid": "0000b361-02ce-4a93-873e-02d943000000",
          "price": 16.281675070724084
        }
      ]
    }
  ]
}
```

### Video/Audio

```json
{
  "cur": "JPY",
  "id": "000083bf-0000-41ea-992e-4457da000000",
  "seatbid": [
    {
      "bid": [
        {
          "adm": "<VAST version=\"3.0\"><Ad id=\"66027\"><Wrapper><AdSystem version=\"1.0\"></AdSystem><VASTAdTagURI><![CDATA[https://adsystem/pr=${AUCTION_PRICE}]]></VASTAdTagURI></Wrapper></Ad></VAST>",
          "adomain": [
            "ecnavi.jp"
          ],
          "cid": "1001",
          "crid": "66027",
          "impid": "0000d491-84a5-49b3-8e33-52b2e1000000",
          "price": 975.52
        }
      ]
    }
  ]
}
```

### With dealid

```json
{
  "cur": "USD",
  "id": "0000fbb5-0000-4218-8551-4ea553000000",
  "seatbid": [
    {
      "bid": [
        {
          "adid": "40734",
          "adm": "<script>(function(){var e=this||self;})()</script><div><img src=\"https://adsystem/?q=eD3TPt6ibXC7FHb5U3gXH6ylGqZ5kc355we1OGn87GXzNth1O7M1hYDg&pr=${AUCTION_PRICE}\" border=0 width=1 height=1 alt=\"\" style=\"display:none\"></div>",
          "adomain": [
            "ecnavi.jp"
          ],
          "cid": "75580",
          "crid": "40734",
          "dealid": "bidding-deal-id",
          "h": 250,
          "id": "0",
          "impid": "00007d85-89e3-41e9-9e09-96e3a5000000",
          "language": "ja",
          "price": 0.014828,
          "w": 300
        }
      ]
    }
  ]
}
```

### With nurl and lurl

```json
{
  "cur": "USD",
  "id": "0000fbb5-0000-4218-8551-4ea553000000",
  "seatbid": [
    {
      "bid": [
        {
          "adid": "40734",
          "adm": "<script>(function(){var e=this||self;})()</script><div><img src=\"https://adsystem/?q=eD3TPt6ibXC7FHb5U3gXH6ylGqZ5kc355we1OGn87GXzNth1O7M1hYDg&pr=${AUCTION_PRICE}\" border=0 width=1 height=1 alt=\"\" style=\"display:none\"></div>",
          "adomain": [
            "ecnavi.jp"
          ],
          "cid": "75580",
          "crid": "40734",
          "h": 250,
          "id": "0",
          "impid": "00007d85-89e3-41e9-9e09-96e3a5000000",
          "language": "ja",
          "lurl": "https://example.net/loss?code=${AUCTION_LOSS}&auction_id=${AUCTION_ID}&clearing_price=${AUCTION_PRICE}",
          "nurl": "https://example.net/win?code=${AUCTION_LOSS}&auction_id=${AUCTION_ID}&clearing_price=${AUCTION_PRICE}",
          "price": 0.014828,
          "w": 300
        }
      ]
    }
  ]
}
```

### With bundle

```json
{
  "cur": "USD",
  "id": "000073f8-0000-4e07-b81f-7c7fc3000000",
  "seatbid": [
    {
      "bid": [
        {
          "adid": "64be85",
          "adm": "<VAST version=\"3.0\"><Ad id=\"590907\"><InLine><AdSystem></AdSystem><Impression id=\"0\"><![CDATA[https://adsystem/api/track.gif?event=m.impression]]></Impression><Impression id=\"1\"><![CDATA[https://adsystem2/impression]]></Impression><Impression id=\"2\"><![CDATA[https://adsystem3/?auction_id=${AUCTION_ID}&auction_price=${AUCTION_PRICE}]]></Impression><Error><![CDATA[https://adsystem/track.gif?error_code=[ERRORCODE]]]></Error><Creatives></Creatives></InLine></Ad></VAST>",
          "adomain": [
            "ecnavi.jp"
          ],
          "attr": [],
          "bundle": "jp.ecnavi.android",
          "cat": [
            "IAB9-30"
          ],
          "cid": "1124",
          "crid": "1124",
          "id": "000073f8-0000-4e07-b81f-7c7fc0000000",
          "impid": "0000fc8d-0000-4b6c-902a-3eae57000000",
          "price": 100
        }
      ]
    }
  ]
}
```

```json
{
  "cur": "JPY",
  "id": "9c8b83b2-6863-4819-b1ee-d739841769fb",
  "seatbid": [
    {
      "bid": [
        {
          "adid": "0000wk",
          "adm": "<div><a href=\"https:///\" target=\"_blank\" rel=\"noopener\"><img adsby=\"1\" border=\"0\" height=\"250\" src=\"https:///img.gif\" width=\"300\"></a></div>  </div>  <div style=\"position:absolute;left:0;top:0;visibility:hidden\"><img alt=\"\" height=\"0\" src=\"https:///imp?price=${AUCTION_PRICE}\" style=\"width:0;height:0\" width=\"0\">  </div>",
          "adomain": [
            "ecnavi.jp"
          ],
          "attr": [],
          "bundle": "100001234",
          "cid": "6731",
          "crid": "uuvs",
          "ext": {},
          "h": 250,
          "id": "1",
          "impid": "00005cbf-0000-41a6-8a36-3c0492000000",
          "price": 17.9217,
          "w": 300
        }
      ]
    }
  ]
}
```
