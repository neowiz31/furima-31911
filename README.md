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
- has_many :Address


## items テーブル

| Column        | type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| info          | text       | null: false       |
| category_id   | integer    | null: false       |
| quality_id    | integer    | null: false       |
| price         | string     | null: false       |
| user          | references | foreign_key: true |

### Association

- belongs_to :users
- has_many   :comments
- has_one    :buys


## comments テーブル

| Column      | type       | Options           |
| ----------- | ---------- | ----------------- |
| text        | string     | null: false       |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items


## buys テーブル

| Column             | type       | Options     |
| ------------------ | ---------- | ----------- |
| delivery_cost_id   | integer    | null: false |
| delivery_area_id   | integer    | null: false |
| delivery_time_id   | integer    | null: false |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :purchase_record


## purchase_records テーブル

| Column             | type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |


### Association


- belongs_to :buy
- belongs_to :address


## address テーブル

| Column             | type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal_cord        | string     | null: false       |
| prefectures_id     | integer    | null: false       |
| city               | string     | null: false       |
| house_number       | string     | null: false       |
| building_name      | string     | null: false       |
| phone_number       | string     | null: false       |
| user               | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_record