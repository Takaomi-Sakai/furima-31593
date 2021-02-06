# テーブル設計

## users テーブル

| Column      | Type    | Option   |
| ----------- | ------- | -------- |
| nickname    | string  | NOT NULL |
| email       | string  | NOT NULL |
| password    | string  | NOT NULL |
| name        | string  | NOT NULL |
| birthday    | integer | NOT NULL |

### Association

- has_many :purchases
- has_many :exhibitdates

## purchases テーブル

| Column           | Type       | Option   |
| ---------------- | ---------- | -------- |
| cardinformation  | integer    | NOT NULL |
| expirationdate   | integer    | NOT NULL |
| securitycode     | integer    | NOT NULL |
| postalcode       | integer    | NOT NULL |
| prefectures      | string     | NOT NULL |
| maincipality     | string     | NOT NULL |
| address          | string     | NOT NULL |
| building         | string     | NOT NULL |
| phone            | integer    | NOT NULL |
| image            |            |          |
| user             | references |          |
| exhibitdates     | references |          |

## exhibitdates テーブル

| Column             | Type       | Option   |
| ------------------ | ---------- | -------- |
| productname        | integer    | NOT NULL |
| discription        | text       | NOT NULL |
| category           | integer    | NOT NULL |
| status             | integer    | NOT NULL |
| deliveryfee        | string     | NOT NULL |
| area               | string     | NOT NULL |
| days               | integer    | NOT NULL |
| price              | integer    | NOT NULL |
| salescommission    | string     | NOT NULL |
| salesprofit        | string     | NOT NULL |

### Association

- has_many : purchases


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
