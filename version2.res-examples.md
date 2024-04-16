# fluct RTB Specification ver 2: Response Examples

* [Banner](#banner)
* [Native](#native)
* [Video/Audio](#videoaudio)
* [With dealid](#with-dealid)
* [With nurl and lurl](#with-nurl-and-lurl)
* [With_burl](#with-burl)
* [With bundle](#with-bundle)
* [With SKAdNetwork Response Object](#with-skadnetwork-response-object)

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
          "mtype": 1,
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
          "mtype": 4,
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
          "dur": 15,
          "impid": "0000d491-84a5-49b3-8e33-52b2e1000000",
          "mtype": 3,
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
          "mtype": 1,
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
          "mtype": 1,
          "price": 0.014828,
          "w": 300
        }
      ]
    }
  ]
}
```

### With burl

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
          "burl": "https://example.com/?clearing_price=${AUCTION_PRICE}",
          "mtype": 1,
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
          "mtype": 2,
          "price": 100
        }
      ]
    }
  ]
}

{
  "cur": "JPY",
  "id": "5b8cd76b-3802-4cf1-a8ab-4e0d18feeaa1.9DA9",
  "seatbid": [
    {
      "bid": [
        {
          "adm": "<iframe id=\"amznad437548\" src=\"https://ghent-gce-jp.bidswitch.net/imp/${AUCTION_PRICE}/BSWhttps_A_B_Baax-fe-sin.amazon-adsystem.com_Be_Bor_B2fdf62ab27c1174e7ef53f260727f8be_Bcreative_Cb_RJE5CY6922tOEkUWGDfDoiDQAAAGO5S709wUAAAeFAUEzcHhfdHhuX2JpZDEgICAzcHhfdHhuX2ltcDEgICBH__XAF_Jw_R_I_WAUCTION__PRICE_AHMAC__SHA1_X_Jbi_RD41dW1jSlG.Wa.lWnwjz2R13ckTMEWCYxqthMeXhUTtdf-KFxunKgjFmSqYITg8foMeEQi6Gc0X14u3ue9vxm6MiDlTgS1jbxsI4ulu7An0jzWa0j77ObHzaoUM3L-t6HNDTFM1fp0tlUB1MWUf8JQE2SWP7tNOBbEpXZSt6aDJi2LYv.wePMLoz99g81Pp1Dfkzz2C157iqOlzAz-bm1QnG9TqmrTOWTNebCCCyIR4H8S1qxwN2PY.4MH9CxWTxpJx2VfwzjA3u-BMZeOQLWdozLRChfKaMlaR.pvK8cRJW8azwG17meHJ2ZFoh2KFMI3AUM8FTKneIKpe.r2BcjuPFjFgxnO-U7zo7fCwkbo3HQl1inv1A9B.OCSo9iCcazSga1Q0nDbt4PU2z9NPLJN7RixK6qJ3aws-.uCwwRko5wciR3ImsszhMqF7uVJ4KMf.a2GIlPGP4nyQpvXa9Y69VZ7HEoS1CEIt9M3mMGrqz.U7U5MNCVE8Ml3Qj8.0TgbllSbpsjYi7sR95oJmztxWvhzrCuEKV50et4eieMF5memoEM1bIB63aI3YybSFpfoyM3.rI3IRa3RKa2VBXW3igmoQyWCxNdzMP8X2IvM1pkc5TDJgLfzThNqiHnHXvCHZ-mboOPy.Nh9kePTuKF9vU2L38USzOJe44rEk4NEqbK7sY-WofZ4rWYlrPXJUO4nMTCQjfwLweRBG0WCRJJw____/Oup72PsW-Krd6lCAKjm4g0Il_XegIo_PRDXlWCyTvl6l45rvszIUksoQgrYoObkG3qg6eJ5GcwE2m5L5Bqf8rUhRDH5GLyIjg5O17uvozcObDJj0Cc3jNHR-wqT7VMY7jR1pbxbDB508sc8VR7DoRbksWwlNFWTa_v7gd3F9lddpU_XIozY3wwYbNJx1QV0XnFBQKJ_0x0Qmq9i3-4OUXvew-DB6uLoQ-PL6sub0SnfaTwcAAo8DptOlACHpVFabMN38vacJSLrgh_WQ7KMUyJrRzYnIVtjWTguuh17HUw3Hu2qvQiAkA8ciJi7dak0nccDv6VxYcf0bLWdJ5R8nSyC39_rb1BysnLzyTGEMREPfPx8-Sx6kA8K32WBJBcTX8TIOa3YWoQ_eMwF86SFxY28_0QimyVWnEp1dIvUGsCJVEgrCzDAeFMmAPUxP5P72e3MUPo55-AXivWmgfgKXbxbEPcFGsAiPfn93YtSsrGCnQAdxjVibcMl3XB5rO3ezPQ70NPJpjxW-UinYeR9sE7O6Lk6BDpMMNJtgbHTP8g-0noJAGgItw1dhlonoSr_mjG4S5xek4zbd_cgpBVs9aJMT8SKpfAEMcErZ14604EdnexB4GiFyNPzYouxRWvV_UfklO1jzbAjxpi4IkL0ZlvPDDlp_GV_RUTozV2t2f2hCDNk4HxAFXPFFkDtq4lKXv4YjMlB9CQXuz9i8YmNQqErw37A-2zdhjPOpmoneBf96-0-HzrRGv7k3o5EesKWBsYfLtjJFWNyuDC2lBXTmGFBPYLE5JUFWn5EIbiOPS02bJpBMlsneNVlw27FjY2OZL1MM5NO4wQ9wJi0JTvAEqKRi64lI4O3cPzYBszo2Rs72S3tkjN5Yh5rr3Em4s_z_DUTsB94ocKYOSplmEmyUf_wlmejiuNwKZ1oRT4sOZVcI5S0oGcwavntu64VDvm_CnB9Wdlvh1H0kz5M4siJyOFz2_NHLp3StK3DvjDRSqBmIs557gOMoiII5RH6zy-M3PpkAy4GVov3u_gqyCaBNNMBFIwRKPZh7Vuwe6zbgkVMFKTkI-nsIWB1RaBlvGZMjI5YsjLHBy02-Lv8FrY_fFcoDBxwLNiu4tthnct9Dpyet_19pReCZvRhx1oeKyj7XRhe8D2hyBI1CSW7idRkUib2i0cFHE7FdCjRygWySp_GcsjPu42X1Tzu4T5pyBFA8BID46W0AKool93_CjVNy8-O7cEm958Bne4d7zvHYSLTmgbr7bMQak77NUvOaBp111FOSG0pkQAc/\" width=\"300\" height=\"250\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe><img src=\"https://apac-jp-sync.bidswitch.net/sync?ssp=fluct&amp;dsp_id=200&amp;imp=1\" alt=\" \" style=\"display:none\"/>",
          "adomain": [
            "amazon.co.jp"
          ],
          "burl": "https://ghent-gce-jp.bidswitch.net/win_notice/fluct_basic_bid?rid=Oup72PsW-Krd6lCAKjm4g0Il_XegIo_PRDXlWCyTvl6l45rvszIUksoQgrYoObkG3qg6eJ5GcwE2m5L5Bqf8rUhRDH5GLyIjg5O17uvozcObDJj0Cc3jNHR-wqT7VMY7jR1pbxbDB508sc8VR7DoRbksWwlNFWTa_v7gd3F9lddpU_XIozY3wwYbNJx1QV0XnFBQKJ_0x0Qmq9i3-4OUXvew-DB6uLoQ-PL6sub0SnfaTwcAAo8DptOlACHpVFabMN38vacJSLrgh_WQ7KMUyJrRzYnIVtjWTguuh17HUw3Hu2qvQiAkA8ciJi7dak0nccDv6VxYcf0bLWdJ5R8nSyC39_rb1BysnLzyTGEMREPfPx8-Sx6kA8K32WBJBcTX8TIOa3YWoQ_eMwF86SFxY28_0QimyVWnEp1dIvUGsCJVEgrCzDAeFMmAPUxP5P72e3MUPo55-AXivWmgfgKXbxbEPcFGsAiPfn93YtSsrGCnQAdxjVibcMl3XB5rO3ezPQ70NPJpjxW-UinYeR9sE7O6Lk6BDpMMNJtgbHTP8g-0noJAGgItw1dhlonoSr_mjG4S5xek4zbd_cgpBVs9aJMT8SKpfAEMcErZ14604EdnexB4GiFyNPzYouxRWvV_UfklO1jzbAjxpi4IkL0ZlvPDDlp_GV_RUTozV2t2f2hCDNk4HxAFXPFFkDtq4lKXv4YjMlB9CQXuz9i8YmNQqErw37A-2zdhjPOpmoneBf96-0-HzrRGv7k3o5EesKWBsYfLtjJFWNyuDC2lBXTmGFBPYLE5JUFWn5EIbiOPS02bJpBMlsneNVlw27FjY2OZL1MM5NO4wQ9wJi0JTvAEqKRi64lI4O3cPzYBszo2Rs72S3tkjN5Yh5rr3Em4s_z_DUTsB94ocKYOSplmEmyUf_wlmejiuNwKZ1oRT4sOZVcI5S0oGcwavntu64VDvm_CnB9Wdlvh1H0kz5M4siJyOFz2_NHLp3StK3DvjDRSqBmIs557gOMoiII5RH6zy-M3PpkAy4GVov3u_gqyCaBNNMBFIwRKPZh7Vuwe6zbgkVMFKTkI-nsIWB1RaBlvGZMjI5YsjLHBy02-Lv8FrY_fFcoDBxwLNiu4tthnct9Dpyet_19pReCZvRhx1oeKyj7XRhe8D2hyBI1CSW7idRkUib2i0cFHE7FdCjRygWySp_GcsjPu42X1Tzu4T5pyBFA8BID46W0AKool93_CjVNy8-O7cEm958Bne4d7zvHYSLTmgbr7bMQak77NUvOaBp111FOSG0pkQAc&p=${AUCTION_PRICE}&aid=",
          "cat": [
            "IAB18-5"
          ],
          "cid": "591323876757526154",
          "crid": "200_591323876757526154",
          "h": 250,
          "id": "200-4fc0d5d4_5b8cd76b-3802-4cf1-a8ab-4e0d18feeaa1.9DA9-1",
          "impid": "8526ede4-253c-406e-a000-120df60b3620",
          "iurl": "https://aax-fe-sin.amazon-adsystem.com/e/or/2fdf62ab27c1174e7ef53f260727f8be/impi?cp=1&ci=EAAYACogEQ3h91UgTIHQE3wUs26dwMRl0PrFKa.2DnMz0wIiMLkyBARUETE_&s=300x250",
          "price": null,
          "w": 300
        },
        {
          "adm": "<iframe id=\"amznad338854\" src=\"https://ghent-gce-jp.bidswitch.net/imp/${AUCTION_PRICE}/BSWhttps_A_B_Baax-fe-sin.amazon-adsystem.com_Be_Bor_B2fdf62ab27c1174e7ef53f260727f8be_Bcreative_Cb_RJE5CY6922tOEkUWGDfDoiDQAAAGO5S70-wUAAAeFAUIzcHhfdHhuX2JpZDEgICAzcHhfdHhuX2ltcDEgICBH__XAF_Jw_R_I_WAUCTION__PRICE_AHMAC__SHA1_X_Jbi_Rz3XnImibw88OmHhD41CncZmRUXW3i8o3T2kH4gXoyvEWi08loW.lehhxwvujP25h-LYRUuId6MRV2QAA0EWzCY7BgTTmAiqyQVlZRMIxYUqQNbUE3MLdl0hR6.o2DSf1FhYRx.mUuKNjYr0cp2EHAn-fO0jC-Uj4CYzEvqpgujjXk-yI8IiRoyfVAdQP7r6xoXNWr.MtzIfuB8kyLqoNq3uu1oq3Bp0OCxJmbWY8HiEHk8Z8PLSuYs-P8SzXgxAjTzyEq6Un1Q93ly6A.Yl3RqGxEahzG4x5WpvdMOP.TOV8TgiA.H7pktAbgjEX6XsMMTvKGqIt8QwAIc-njYp9gGVo2PnemhT-ZMdxB4eisyIZan8h9TuVYj8AbH93VIlMhP8nfVfFt-bupvfwyTIF61AR7oKS..ehpuufJwq9MmRp8GjNBXKjKXH15lk81dMD5g53ATiY4IeYW7a8fI7JCueduposLJoeXgUHoBWIH0vaAQv8y8Q9cKd8togcGTJIL9.iqad0m4i3ZciWmo-hfVHAupkh7R6WkXUyzvQOn5LOl52YfCq5k2t.RIg21eOm8M933Mlx1ccPngckjCXDUkGAuN8fTwxb-J5fqzHjo2UtHGs2c45q-qDMLrO22RNhIyFPhsLgcP1LhsoDUnyGuhmuXZg.YiMrIhpbh35MV1I8xXDPtjWhLMbTFlpovcBrhgX0gxh94sCREVYz0TDc1g____/monYmizLp9Jg2t6Pysu1zFgO9ZBcpFP5Mt3T1IEhU3zMFEbaNYyObILO18ybYKCgyTbBdpT5sIXZGFtjOepmsq6JkOZYfvvyF6AbSXNCznJGVpWokU5sAmb5d7_LdVwPu91WhMujc0gKvsBLVf_APz8YOXDd-7Tu4ZR4UItITIGVadj6L9C4VufV6E8Vwi3cpQpUlyjkTja9izsWWaenFXvHSn2ww1SmCpIdHvm6pS9IMHYD77ySYL_y0OwlDpg7MVzqAHf_JecQV50jkZ27GlyzEALpk3bpcPbKxUIfkxmALOeThCWyrwIWgE11gEsRBZDTRIB0sVAy9TKGGhd4SV2uprNesl8CFoBBjm8xWQ_zqcGJ99Uxrz85p88xF_fmf_0mVsM44MEsGMNL20TiIiKY6k9p7vHpGIBe5htY1Zb9fF5omxxaKkPyPR-MRZLk3PpKO8Bxc_JP5DoAoyzzEORzzMZ3pRZGvykLp0ha2mtV7z3yVUl-HLM6mNEhDn-9zBRr55jSBKZw2oylz0oBYBmicDiQvocKWOLPKovfIuXWlGZgUXdFBYGqmnzscYUaDuMLNlByHJoXU8O-NWzvCROY2JKtZoRVvNE1pgN8P8z0JmEzNlRZZb1YhS_QK6Wnh_PvQ5WUvDRk0KQs3E376O-NS7OkJbbRiTRApirXA67Kc5mWp8qVOJIauvb2LSA2YKvx1cmMTD6avg-QBuaoUK6xPzArLkgKdEnZG8jSOAd-8xKxlbaPlCDAJfobTJxO8MfFa6xXoeswFjRXh9odLPI_zCTxfddXzfBmytrMErj8b_7_6vfi3ipguT7KN8SuPTDTMggsufIeQHZJAEISnyaLt80GGXLRvMGjFMcolCUB8XpA-jxjbeuMzwQG3eRUuUKUiW9-2C-wjoFNNnHSyQUTdsRL4A9LnLifay8Fn0s4xSkJAAlh185qn7ut3GGoIQF_bzYFJtpQ-h8IPawvYS4_pKK7qCBHvg852gnNr4NvjLDTN9vXnXaTMuokN-FNQ5mhWwCGSV5hwK519bYI6mXJ6uvUvsUShAE5mHLxhAGDKf2wC3G9neXKEj_bIxcbKz-4FGNo_9oeENkmq3m-i6aX1A3W7QegpdikwfNUMH_xsjdQ9cpS5P5P9FSb4Slmt8QcntUvJzwTr4gxal6yS4m_vqRqthKO1l928OLfmqHDfvASvdB8w0kS2Q_yf6nylT560zPU_XQHH6hASL4tBlyFWsaaE12YEu0Kab8e5y2DmX2UaGsYnArR724l9h-RPrgmByQWcw/\" width=\"300\" height=\"250\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe><img src=\"https://apac-jp-sync.bidswitch.net/sync?ssp=fluct&amp;dsp_id=200&amp;imp=1\" alt=\" \" style=\"display:none\"/>",
          "adomain": [
            "anuashop.jp"
          ],
          "burl": "https://ghent-gce-jp.bidswitch.net/win_notice/fluct_basic_bid?rid=monYmizLp9Jg2t6Pysu1zFgO9ZBcpFP5Mt3T1IEhU3zMFEbaNYyObILO18ybYKCgyTbBdpT5sIXZGFtjOepmsq6JkOZYfvvyF6AbSXNCznJGVpWokU5sAmb5d7_LdVwPu91WhMujc0gKvsBLVf_APz8YOXDd-7Tu4ZR4UItITIGVadj6L9C4VufV6E8Vwi3cpQpUlyjkTja9izsWWaenFXvHSn2ww1SmCpIdHvm6pS9IMHYD77ySYL_y0OwlDpg7MVzqAHf_JecQV50jkZ27GlyzEALpk3bpcPbKxUIfkxmALOeThCWyrwIWgE11gEsRBZDTRIB0sVAy9TKGGhd4SV2uprNesl8CFoBBjm8xWQ_zqcGJ99Uxrz85p88xF_fmf_0mVsM44MEsGMNL20TiIiKY6k9p7vHpGIBe5htY1Zb9fF5omxxaKkPyPR-MRZLk3PpKO8Bxc_JP5DoAoyzzEORzzMZ3pRZGvykLp0ha2mtV7z3yVUl-HLM6mNEhDn-9zBRr55jSBKZw2oylz0oBYBmicDiQvocKWOLPKovfIuXWlGZgUXdFBYGqmnzscYUaDuMLNlByHJoXU8O-NWzvCROY2JKtZoRVvNE1pgN8P8z0JmEzNlRZZb1YhS_QK6Wnh_PvQ5WUvDRk0KQs3E376O-NS7OkJbbRiTRApirXA67Kc5mWp8qVOJIauvb2LSA2YKvx1cmMTD6avg-QBuaoUK6xPzArLkgKdEnZG8jSOAd-8xKxlbaPlCDAJfobTJxO8MfFa6xXoeswFjRXh9odLPI_zCTxfddXzfBmytrMErj8b_7_6vfi3ipguT7KN8SuPTDTMggsufIeQHZJAEISnyaLt80GGXLRvMGjFMcolCUB8XpA-jxjbeuMzwQG3eRUuUKUiW9-2C-wjoFNNnHSyQUTdsRL4A9LnLifay8Fn0s4xSkJAAlh185qn7ut3GGoIQF_bzYFJtpQ-h8IPawvYS4_pKK7qCBHvg852gnNr4NvjLDTN9vXnXaTMuokN-FNQ5mhWwCGSV5hwK519bYI6mXJ6uvUvsUShAE5mHLxhAGDKf2wC3G9neXKEj_bIxcbKz-4FGNo_9oeENkmq3m-i6aX1A3W7QegpdikwfNUMH_xsjdQ9cpS5P5P9FSb4Slmt8QcntUvJzwTr4gxal6yS4m_vqRqthKO1l928OLfmqHDfvASvdB8w0kS2Q_yf6nylT560zPU_XQHH6hASL4tBlyFWsaaE12YEu0Kab8e5y2DmX2UaGsYnArR724l9h-RPrgmByQWcw&p=${AUCTION_PRICE}&aid=",
          "cat": [
            "IAB18-3"
          ],
          "cid": "588043668477759050",
          "crid": "200_588043668477759050",
          "h": 250,
          "id": "200-4fc0d5d4_5b8cd76b-3802-4cf1-a8ab-4e0d18feeaa1.9DA9-2",
          "impid": "8526ede4-253c-406e-a000-120df60b3620",
          "iurl": "https://aax-fe-sin.amazon-adsystem.com/e/or/2fdf62ab27c1174e7ef53f260727f8be/impi?cp=1&ci=EAAYACogJC.NFbAIP0imHaGH.Xui8-ham7QudeXf3oy6OB.qD50yBGIP428_&s=300x250",
          "price": null,
          "w": 300
        }
      ],
      "seat": "200"
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
          "mtype": 1,
          "price": 17.9217,
          "w": 300
        }
      ]
    }
  ]
}
```

### With SKAdNetwork Response Object

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
          "mtype": 2,
          "price": 975.52,
          "ext": {
            "skadn": {
              "version": "2.0",
              "network": "cDkw7geQsH.skadnetwork",
              "campaign": "45",
              "itunesitem": "880047117",
              "nonce": "473b1a16-b4ef-43ad-9591-fcf3aefa82a7",
              "sourceapp": "123456789",
              "timestamp": "1594406341",
              "signature": "MEQCIEQlmZRNfYzKBSE8QnhLTIHZZZWCFgZpRqRxHss65KoFAiAJgJKjdrWdkLUOCCjuEx2RmFS7daRzSVZRVZ8RyMyUXg=="
            },
            "clicktrackers": [
                "https://tracker.example.com/click?id=57750EF0-3125-49FF-89AA-0B6A398B21FA"
            ]
          }
        }
      ]
    }
  ]
}
```
