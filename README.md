# テーブル設計

## users テーブル

| Column             |Type      |Options                    |
| ------------------ |--------- |-------------------------- |
| nickname           | string   | null: false               |
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
| name         | string     | null: false                    |
| price        | integer    | null: false                    |
| purchase_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| store        | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :store