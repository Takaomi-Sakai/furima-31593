# テーブル設計

## users テーブル

| Column                | Type    | Option      |
| --------------------- | ------- | ----------- |
| nickname              | string  | null:false  |
| email                 | string  | unique:true |
| encrypted_password    | string  | null:false  |
| last_name             | string  | null:false  |
| first_name            | string  | null:false  |
| last_name_ruby        | string  | null:false  |
| first_name_ruby       | string  | null:false  |
| birthday              | date    | null:false  |

### Association

- has_many :items

## purchases テーブル

| Column           | Type       | Option     |
| ---------------- | ---------- | ---------- |
| postalcode       | string     | null:false |
| prefecture_id    | integer    | null:false |
| maincipality     | string     | null:false |
| address          | string     | null:false |
| building         | string     |            |
| phone            | string     | null:false |

## items テーブル

| Column             | Type       | Option            |
| ------------------ | ---------- | ----------------- |
| product_name       | string     | null:false        |
| discription        | text       | null:false        |
| category_id        | integer    | null:false        |
| status_id          | integer    | null:false        |
| delivery_fee_id    | integer    | null:false        |
| area_id            | integer    | null:false        |
| day_id             | integer    | null:false        |
| price              | integer    | null:false        |
| user               | references | foreign_key: true |

## purchase_records テーブル

| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| purchase  | references | foreign_key: true |

### Association

belongs_to :users
has_many :purchses


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
