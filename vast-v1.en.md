# fluct VAST Specification ver 1.0

This specification is based on Video Ad Serving Template (VAST) 3.0.

See [Digital Video Ad Serving Template (VAST) 3.0](https://www.iab.com/guidelines/digital-video-ad-serving-template-vast-3-0/) for details.

### Attention

This specification may be incomplete. If you find any inadequacy or encounter confusion, please contact the person in charge: [fluct_dev@voyagegroup.info](mailto:fluct_dev@voyagegroup.info).

Moreover, this specification does not contain description of general VAST protocol.

## Table of Contents

* [1. End card in VAST](#1-end-card-in-vast)
* [2. Impression tracking](#2-impression-tracking)

## 1. End card in VAST

Optional end-card can be included as `<CompanionAds>` in `<InLine>` for formats such as rewarded video. Optimal end-card is shown when multiple `<Companion>` with different sizes are included.

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
                        <Companion height="1242" width="2688">
                            <StaticResource creativeType="image/jpeg">
                                <![CDATA[http://example.net/endcard-l.jpg]]>
                            </StaticResource>
                            <IFrameResource>
                                <![CDATA[http://example.net/endcard-ifarame-l]]>
                            </IFrameResource>
                            <HTMLResource>
                                <![CDATA[http://example.net/endcard-html-l]]>
                            </HTMLResource>
                            <CompanionClickThrough>
                                <![CDATA[http://example.net/click-through-l]]>
                            </CompanionClickThrough>
                            <CompanionClickTracking>
                                <![CDATA[http://example.net/click-tracking-l]]>
                            </CompanionClickTracking>
                        </Companion>
                    </CompanionAds>
                </Creative>
            </Creatives>
        </InLine>
    </Ad>
</VAST>
```

## 2. Impression tracking
URI in `<Impression>` is requested when video start to play.
