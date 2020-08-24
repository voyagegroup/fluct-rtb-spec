# 変更履歴

* 2.2
    * 2020/08/24
        * MoPub iOS 14 Support Proposal に対応
            * Bid Request SKAdn Request Object を仕様に追加
            * Bid Request Imp Object
                * `ext.skadn` 追加
            * Bid Response SKAdn Response Object を仕様に追加
            * Bid Response Bid Object
                * `ext.skadn` 追加
            * Bid Request/Response 例を更新
    * 2020/06/05
        * Bid Request Video-Ext Object を仕様に追加
    * 2020/05/20
        * Bid Response マクロ置換の更新
            * `${AUCTION_CURRENCY}`, `${AUCTION_ID}`, `${AUCTION_IMP_ID}`, `${AUCTION_IMP_ID}`, `${AUCTION_LOSS}`, `${AUCTION_SECOND_PRICE}`, `${AUCTION_SECOND_PRICE_IV}` を追加
            * `${CLICK_URL_ENC}` を非推奨に変更
        * Request/Response 本文の圧縮を推奨に変更
    * 2020/04/24
        * Bid Request Device Object
            * `w`, `h` 追加
        * Bid Response Seatbid Object
            * `seat` 追加
        * Bid Response Bid Object
            * `cid`, `w`, `h`, `attr`, `cat` 追加
            * `bundle` の型を string[] から string に修正
            * `adomain` を必須項目 (required) に変更
            * `bundle`, `cid`, `crid`, `w`, `h`, `attr`, `cat` を推奨項目 (recommended) に変更
        * Bid Request/Response Examples を更新
        * その他、古い情報を削除
    * 2020/01/23
        * Bid Request Geo Object を仕様に追加
        * Bid Request/Response 例を更新
    * 2019/12/24
        * RTB Bid Request/Response 例を改修
            * [version2.req-examples.md](version2.req-examples.md)
            * [version2.res-examples.md](version2.res-examples.md)
    * 2019/12/19
        * HTTP `X-OpenRTB-Version` ヘッダの説明を追加
    * 2019/12/11
        * Native 広告仕様を RTB 仕様から分離
            * [native-ads-v1.ja.md](native-ads-v1.ja.md)
            * [native-ads-v1.en.md](native-ads-v1.en.md)
    * 2019/12/02
        * Bid Response に `bundle`, `nurl`, `lurl` を追加
    * 2019/11/06
        * Request/Response のエンコーディングを追加
    * 2019/08/28
        * Sellers.json, OpenRTB SupplyChain Object 対応を追加
        * Bid Request に `source.ext.schain` 追加
    * 2019/07/16
        * リクエストサンプルにrewarded videoを追加
    * 2019/07/11
        * 不要なCategory ID code表を削除
    * 2019/07/01
        * シリアライズフォーマットは `json` のみにしか対応していないので文言を修正
    * 2019/06/06
        * Bid Request に `osv` 追加
    * 2019/04/26
        * Bid Request に `source` 追加
    * 2019/04/23
        * Bid Request に `site.mobile` 追加
    * 2019/04/22
        * Bid Request に `imp.banner.format`, `imp.banner.vcm`, `imp.video.companionad` 追加
        * Bid Request サンプルコードにエンドカード付き動画広告の例を追加
    * 2019/03/28
        * Bid Request に `cur`, `imp.video.battr`, `imp.bidfloor`, `imp.bidfloorcur` 追加
        * Bid Request に試験的なオブジェクト `imp.audio` 追加
        * `imp.pmp.deals` オブジェクト詳細を明記
        * サンプルコードの調整
    * 2018/12/18
        * BidResponseについて、オブジェクト詳細の記述を明記
        * 置換マクロについて、クリエイティブ審査プロセス時の挙動を明記
        * サンプルコードの調整
    * 2018/11/13
        * app object を変更
            * [en/ja] `bundle` を OpenRTB に準拠
            * [en/ja] `appid` を削除
        * device object を変更
            * [ja] `ifa`, `lmt` が追加されない条件を削除
            * [en/ja] `dnt` を追加
        * user object を変更
            * [ja] `buyeruid` が `"undefined"` になる条件を削除
        * imp object を変更
            * [en] `instl` を追加
        * video object を変更
            * [en] `protocols`, `h`, `w`, `startdelay`, `linearity`, `minbitrate`, `maxbitrate`, `skip`, `api`, `placement` を追加
* 2.1.6
    * 2018/11/08 OpenRTB2.5に準拠しました
* 2.1.5
    * 2018/02/23 publisher objectを追加
* 2.1.4
    * 2017/10/18 native objectに関して、OpenRTB2.3仕様に準拠しました。(旧仕様でも接続可)
* 2.1.3
    * 2017/07/06 assetsに設定されている項目でも、メディア側の設定によって項目が非表示になることがあることを追記(要連絡)
* 2.1.2
    * 2017/06/27 bidレスポンスサンプルのseatbid.bid.adm中のマクロを修正
    * 2017/06/27 videoのbidリクエストパラメタに下記項目を追加
        * protocols
        * minduration
        * maxduration
        * h
        * w
        * startdelay
        * linearity
        * minbitrate
        * maxbitrate
        * skip
        * api
        * placement
    * 2017/06/27 videoのbidリクエストサンプルを修正
* 2.1.1
    * 2017/04/26 nativeadのBidRequest native.assets.img.typeに3 : mainを追加
    * 2017/05/30 bidrequestサンプルにてnativeのicon/mainを分離
* 2.1
    * 2017/03/14 nativeadのBidResponseにおいてoptouturlを推奨から必須に変更
* 2.0.4
    * 2017/03/07 iabのnativead仕様書の項目名乖離( imptracker => imptrackers, clicktracker => clicktrackers )の修正
    * 2017/03/07 リクエスト／レスポンスサンプルに【jstracker 仕様/サンプルコード】を追記
    * 2017/03/07 impressionビーコンの通知方法の変更
    * 2017/03/07 dspuid/buyerid を buyeruidに統一
    * 2017/03/07 site.domainの取扱について再定義
* 2.0.3
    * 2016/09/07 bidリクエストのサンプルを修正
    * 2016/09/20 追跡型広告の制限設定がされてる場合の挙動について追記
* 2.0.2
    * 2016/09/05 bidレスポンスに必須パラメタに id を追記
    * 2016/09/05 bidリクエスト、レスポンスのサンプルにvideoを追記
* 2.0.1
    * 2016/07/01 マクロ置換に ${AUCTION_PRICE_IV} を追記
    * 2016/08/15 説明のための文言を追加
    * 2016/08/30 5.リクエスト／レスポンスサンプルを追加
    * 2016/09/02 b-12 assets Objectの備考(BidRequestされる項目を明記)
    * 2016/09/02 5.レスポンスサンプルのnativeを修正(admをjson => json文字列)
