# README

## users テーブル

| Column      | type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| name        | string | null: false |
| birthday    | string | null: false |  

### Association

- has_many :items
- has_many :comments
- has_one  :buys


## items テーブル

| Column        | type       | Options     |
| ------------- | ---------- | ----------- |
| title         | string     | null: false |
| info          | text       | null: false |
| category      | string     | null: false |
| quality       | string     | null: false |
| delivery_cost | string     | null: false |
| delivery_area | string     | null: false |
| delivery_time | string     | null: false |
| price         | string     | null: false |
| user          | references | null: false |



### Association

- belongs_to :users
- has_many   :comments
- has_one    :buys

## comments テーブル

| Column      | type       | Options     |
| ----------- | ---------- | ----------- |
| text        | string     | null: false |
| user        | references | null: false |
| item        | references | null: false |

### Association

- belongs_to :users
- belongs_to :items



## buys テーブル

| Column             | type       | Options     |
| ------------------ | ---------- | ----------- |
| credit_card_number | string     | null: false |
| postal_cord        | string     | null: false |
| prefectures        | string     | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| phone_number       | string     | null: false |
| user               | references | null: false |

### Association

- belongs_to :users
- belongs_to :items