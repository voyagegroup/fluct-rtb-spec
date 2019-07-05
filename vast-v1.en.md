# fluct VAST Specification ver 2.2

This specification is based on Video Ad Serving Template (VAST) 3.0.

See [Digital Video Ad Serving Template (VAST) 3.0](https://www.iab.com/guidelines/digital-video-ad-serving-template-vast-3-0/) for details.

### Attention

This specification may be incomplete. If you find any inadequacy or encounter confusion, please contact the person in charge: [fluct_dev@voyagegroup.info](mailto:fluct_dev@voyagegroup.info).

Moreover, this specification does not contain description of general VAST protocol.

## Table of Contents

* [1. End card in VAST](#e-end-card-in-vast)

## 1. End card in VAST

You can include a optional end card in VAST as a `<CompanionAds>` in `<Inline>` for a format such as rewarded video.

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
