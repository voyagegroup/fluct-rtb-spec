# fluct VAST 仕様 1.0

 Video Ad Serving Template (VAST) 3.0 に準拠しています。詳細は[Digital Video Ad Serving Template (VAST) 3.0](https://www.iab.com/guidelines/digital-video-ad-serving-template-vast-3-0/)をご確認ください

注意

この仕様書には不完全な点があるかもしれません。不備や不明瞭な点がありましたら、担当者か [fluct_dev@voyagegroup.info](mailto:fluct_dev@voyagegroup.info) に教えてください。また、一般的なRTBのプロトコルそのものに対する説明はありません。


## Table of Contents

* [0. 変更履歴](#0-変更履歴)
* [1. VASTのエンドカード仕様](#0-VASTのエンドカード仕様)

## 0. 変更履歴

[CHANGELOG-VAST.md](CHANGELOG-VAST.md)

## 1. VASTのエンドカード仕様

動画リワード等で利用されるエンドカードは、fluctに返却されるレスポンスが含むVASTの `<Inline>` にある `<CompanionAds>` として配置して下さい。

```
<VAST version="3.0">
    <Ad id="91cdb2b8-d808-44f7-883b-8ce1fa3b3af8">
        <InLine>
            <Creatives>
                <Creative>
                    <CompanionAds>
                        <Companion height="1080" width="1920">
                            <StaticResource creativeType="image/jpeg">
                                <![CDATA[http://example.net/endcard.jpg]]>
                            </StaticResource>
                            <IFrameResource>
                                <![CDATA[http://example.net/endcard-ifarame]]>
                            </IFrameResource>
                            <HTMLResource>
                                <![CDATA[http://example.net/endcard-html]]>
                            </HTMLResource>
                            <CompanionClickThrough>
                                <![CDATA[http://example.net/click-through]]>
                            </CompanionClickThrough>
                            <CompanionClickTracking>
                                <![CDATA[http://example.net/click-tracking]]>
                            </CompanionClickTracking>
                        </Companion>
                    </CompanionAds>
                </Creative>
            </Creatives>
        </InLine>
    </Ad>
</VAST>
```
