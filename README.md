## アプリケーション名

 shopping-list

## アプリケーション概要

 店舗ごとの買い物リストをまとめておくことができる。

## URL

- https://shopping-list-37112.herokuapp.com/

## テスト用アカウント

- メールアドレス：a@a
- パスワード：aaaaaa1

## 利用方法

- ログインページからsign upボタンをクリックし、ユーザー新規登録を行います。
- ユーザートップページに遷移し、「お店を追加」ボタンから新規店舗登録を行います。(共有メンバーを登録のある人から選ぶことができます。)
- 商品を追加したいお店のページから「商品追加」ボタンをクリックし、新規商品登録を行うと商品一覧に表示されます。

## アプリケーションを作成した背景
### 課題
- 欲しい商品がどこで売っている商品か忘れてしまうことがあります。
- 買い物に行った店舗で、いつも買う商品を全て把握しておきたいです。
- 買い忘れが生じる時があります。
### 解決
- 店舗ごとに買い物リストを作成します。
- 写真と値段も記載することでセール時などに購入の判断基準になります。
- 家族と共有することで買い物を頼みやすくできます。

商品ごとに購入店舗が分かれている場合でも一目で確認することができ、買い忘れを防ぐことができます。効率よく買い物ができるようになります。


## 実装予定の機能 
現在はビューの調整中です。
- 商品編集機能の実装
- 商品登録の際に急ぎ購入するものか判断するためにチェックボックスをつけます。
- レスポンシブ対応にします。

## 洗い出した要件
- [要件定義を記載したシート](https://docs.google.com/spreadsheets/d/1TsezwQ6PpTGPq7Dac4AmhHZHylZobrgTYReOP021-JM/edit#gid=982722306)

## 実装した機能についての画像やGIFおよびその説明
- 新規登録ができます。  ![新規登録ページ](https://i.gyazo.com/f9b062828bbb57ae4a8e295058d2949a.gif)
- ログインができます。  ![ログインページ](https://i.gyazo.com/c142d01d3aa8bbcf13e3dba27acce30d.gif)
- アカウント編集ができます。  ![アカウント編集ページ](https://i.gyazo.com/92925f86d12447aea4de87a915415cd5.gif)
- ログアウトができます。  ![ログアウト機能](https://i.gyazo.com/8244e1cfdd700d364af2d3849bab0bb2.gif)
- 店舗の新規登録ができます。![新規店舗登録](https://i.gyazo.com/ad08c085a9dd362114f066defad4fcfe.gif)
- 商品の追加ができます。 ![新規商品登録](https://i.gyazo.com/18976bcd9d5d4c6d7814132a992300bb.gif)
- 店舗の削除ができます。 ![店舗削除機能](https://i.gyazo.com/ac4ca5146582979cca4f3b7f1fca3b72.gif)

## データベース設計

![データベース設計図](https://i.gyazo.com/91c16422fb205c2890d620ef192977b6.png)

## 画面遷移図

![画面遷移図](https://i.gyazo.com/77e327236e36657953a4833a14027416.png)

## 開発環境

- フロントエンド：HTML,CSS
- バックエンド：Ruby on Rails
- インフラ：MySQL
- テスト：RSpec
- テキストエディタ：Visual Studio Code
- タスク管理：GitHubプロジェクトボード


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
