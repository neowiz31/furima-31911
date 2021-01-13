# README

## users テーブル

| Column              | type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_furigana  | string | null: false |
| first_name_furigana | string | null: false |
| birthday            | date   | null: false |  

### Association

- has_many :items
- has_many :comments
- has_one  :buys


## items テーブル

| Column        | type       | Options     |
| ------------- | ---------- | ----------- |
| title         | string     | null: false |
| info          | text       | null: false |
| category_id   | integer    | null: false |
| quality       | integer    | null: false |
| delivery_cost | integer    | null: false |
| delivery_area | integer    | null: false |
| delivery_time | integer    | null: false |
| price         | integer    | null: false |
| user_id       | references | null: false |



### Association

- belongs_to :user
- has_many   :comments
- has_one    :buys

## comments テーブル

| Column      | type       | Options     |
| ----------- | ---------- | ----------- |
| text        | string     | null: false |
| user_id     | references | null: false |
| item_id     | references | null: false |

### Association

- belongs_to :user
- belongs_to :item



## buys テーブル

| Column             | type       | Options     |
| ------------------ | ---------- | ----------- |
| credit_card_number | string     | null: false |
| postal_cord        | string     | null: false |
| prefectures        | string     | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| phone_number       | string     | null: false |
| user_id            | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :purchase record


## purchase records テーブル

| Column             | type       | Options     |
| ------------------ | ---------- | ----------- |
| purchase_record    | integer    | null: false |
| user_id            | references | null: false |
| item_id            | references | null: false |

-belongs_to :buy