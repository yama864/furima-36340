# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| ship_time_id        | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postcode            | string     | null: false                    |
| region_id           | integer    | null: false                    |
| city                | string     | null: false                    |
| street              | string     | null: false                    |
| building            | string     | null: true                     |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key:true  |

### Association

- belongs_to :order
