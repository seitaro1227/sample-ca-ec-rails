# クリーンアーキテクチャをざっくり理解したいので作ったサンプル
* クリーンアーキテクチャと言いつつそこまで業務分析を厳密に行ってはいないです。
* セキュリティはガバガバです。
* サーバサイドで注文レコードを作るだけです。

## とてもかんたんなECサイト
注文APIと商品一覧APIだけ作成します。

### カート
cookieで持つ

### 商品
商品idと商品名を返す
個数(在庫)を持っている

### 注文
* 注文レコードを作る
* ユーザーid, 商品, 個数を受け取る
* 在庫がある時だけ注文を作成する
* 注文を確定すると在庫を減らす
* 配送先はユーザーごとに持っている
user_id
user_name
user_address
order_product_items
    * product_id
    * product_name
    * count
 
### ユーザー
名前と住所を持っている
名前 注文者太郎
住所1* 千葉県
住所2* 松戸市六高台 33-4
住所3 なんとかアパート 101
name
address_1
address_2
address_3

### 配送先
ユーザーごとに持っている

### shop
* 配送元
name
address_1
address_2
address_3

### 配送テーブル
deliveries
* from_address
* to_address
* price
* 配送元
* 配送先
* 送料

---
## step1
* ビジネスロジックをすべてControllerに実装する

## step2
* ビジネスロジックをInteractorに切り出す
* InteractorとはUseCaseの実装
* 他の言語ではUserCaseをinterfaceで作ってInteractorで実装する
* Interactor gemを使ってみる
    * 使えそうな機能
        * context
            * なにかの業務Interactor.call(user)
            * この引数
        * Around Hooks
            * Transactionを仕掛けられそう
        * Organizers
            * 複数のInteractorを呼べる
```ruby
class PlaceOrder
  include Interactor::Organizer

  organize CreateOrder, ChargeCard, SendThankYou
end
```
こういうの作ってみようと思う

![Interactorシーケンス図](https://github.com/seitaro1227/sample-ca-ec-rails/raw/master/Interactor_%E3%82%B7%E3%83%BC%E3%82%B1%E3%83%B3%E3%82%B9%E5%9B%B3.png)


