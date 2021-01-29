# README

## users テーブル

| Column              | type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birth_day           | date   | null: false               |  

### Association

- has_many :items
- has_many :comments
- has_many :purchase_records


## items テーブル

| Column           | type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_name        | string     | null: false       |
| item_info        | text       | null: false       |
| item_category_id | integer    | null: false       |
| item_quality_id  | integer    | null: false       |
| delivery_cost_id | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_time_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase_record


## comments テーブル

| Column      | type       | Options           |
| ----------- | ---------- | ----------------- |
| text        | string     | null: false       |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## purchase_records テーブル

| Column             | type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column             | type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal_cord        | string     | null: false       |
| prefecture_id      | integer    | null: false       |
| city               | string     | null: false       |
| house_number       | string     | null: false       |
| building_name      | string     |                   |
| phone_number       | string     | null: false       |
| purchase_record    | references | foreign_key: true |


### Association

- belongs_to :purchase_record