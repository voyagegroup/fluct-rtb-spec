# 変更履歴

* 2.1.6
    * 2018/06/15 nativead spec 1.2の仕様を取り込む
* 2.1.5
    * 2018/02/23 publisher objectを追加
* 2.1.4
    * 2017/10/18 native objectに関して、openRTB2.3仕様に準拠しました。(旧仕様でも接続可)
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
