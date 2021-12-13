# テーブル設計

## users テーブル

| Column             |Type      |Options                    |
| ------------------ |--------- |-------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |

## Association

- has_many :store_users
- has_many :stores, through: :store_users
- has_many :items

## stores テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| store_name   | string | null: false |

## Association

- has_many :store_users
- has_many :users, through: :store_users
- has_many :items

## store_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| store   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :store

## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| price        | integer    | null: false                    |
| content      | string     |                                |
| user         | references | null: false, foreign_key: true |
| store        | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :store





| アプリケーション名                        | shopping-list                             |
| ---------------------------------------| ----------------------------------------- |
| アプリケーション概要                      | 店舗ごとの買い物リストをまとめておくことができる。 |
| URL                                    | https://shopping-list-37112.herokuapp.com/ |
| テスト用アカウント                        | ・メールアドレス：a@a ・パスワード：aaaaaa1    |
| 利用方法                                | 1.ログインページからsign upボタンをクリックし、ユーザー新規登録を行う。2.トップページのお店を追加ボタンから新規店舗登録を行う。3.商品追加ボタンから新規商品登録を行う          |
| アプリケーションを作成した背景              | 私は普段、「どこで何を買いたいか」が決まっています。例えばジップロックはIKEAで買う、ゴミ袋も小さめの物はここのドラッグストアで買うけれど大きめのゴミ袋はもう一つのドラッグストアで買うなど、他の生活用品や食料品についても細かく決まっています。さらにお買い物する時の条件として、「子どもを連れています。」子供とお買い物に行くということはもちろんお店に向かう道中も一人で行くのとは違くて、スムーズに辿り着けるかはわかりませんし、買い物中も棚のものを勝手に触らないように配慮しながら買い物をしているので、冷静に「ここのお店に来たからあれを買っておこう。」と考える余裕はありません。だからと言って、今日、急ぎ必要なものだけを買っていくのはもったいないと感じました。そのために、解決策としてこのアプリを作っています。買い物中や買い物前にササっとそのお店で買うものが確認できれば、買い忘れを防ぐことができますし、まとめて買ってストックができれば、お買い物の頻度 も減ってその分子供との時間に充てることができます。さらに夫と共有できるようにすれば、お買い物を頼みやすくなると思いました。このアプリが私たち家族の悩みを解決し、生活の充実度を上げてくれると 思っています。 |
| 洗い出した要件                           | [要件定義を記載したシート](https://docs.google.com/spreadsheets/d/1TsezwQ6PpTGPq7Dac4AmhHZHylZobrgTYReOP021-JM/edit#gid=982722306)                                                         |
| 実装した機能についての画像やGIFおよびその説明 | ・新規登録ができます。  ![新規登録ページ](https://i.gyazo.com/f9b062828bbb57ae4a8e295058d2949a.gif)](https://gyazo.com/f9b062828bbb57ae4a8e295058d2949a) ・ログインができます。  ![ログインページ](https://i.gyazo.com/c142d01d3aa8bbcf13e3dba27acce30d.gif)](https://gyazo.com/c142d01d3aa8bbcf13e3dba27acce30d) ・アカウント編集ができます。  ![アカウント編集ページ](https://i.gyazo.com/92925f86d12447aea4de87a915415cd5.gif)](https://gyazo.com/92925f86d12447aea4de87a915415cd5) ・ログアウトができます。  ![ログアウト機能](https://i.gyazo.com/8244e1cfdd700d364af2d3849bab0bb2.gif)](https://gyazo.com/8244e1cfdd700d364af2d3849bab0bb2) ・店舗の新規登録ができます。![新規店舗登録](https://i.gyazo.com/ad08c085a9dd362114f066defad4fcfe.gif)](https://gyazo.com/ad08c085a9dd362114f066defad4fcfe) ・商品の追加ができます。 ![新規商品登録](https://i.gyazo.com/18976bcd9d5d4c6d7814132a992300bb.gif)](https://gyazo.com/18976bcd9d5d4c6d7814132a992300bb) ・店舗の削除ができます。 ![店舗削除機能](https://i.gyazo.com/ac4ca5146582979cca4f3b7f1fca3b72.gif)](https://gyazo.com/ac4ca5146582979cca4f3b7f1fca3b72)     |
| 実装予定の機能                          | 現在はビューの調整中です。今後はチェックボックスをつけ、必ず購入するものをチェックできるようにしていきます。そして、投稿した商品に関しての編集機能も実装予定です。 |
| データベース設計                        | ![データベース設計図](https://i.gyazo.com/91c16422fb205c2890d620ef192977b6.png)](https://gyazo.com/91c16422fb205c2890d620ef192977b6)  |
| 画面遷移図                             | ![画面遷移図](https://i.gyazo.com/ec51baafcf334d15f2d9ab7dd002e7a5.png)](https://gyazo.com/ec51baafcf334d15f2d9ab7dd002e7a5)  |
| 開発環境                              | ・フロントエンド：HTML,CSS ・バックエンド：Ruby on Rails ・インフラ：MySQL ・テスト：RSpec ・テキストエディタ：Visual Studio Code ・タスク管理：GitHubプロジェクトボード  |