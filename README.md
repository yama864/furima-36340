# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | string | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| description         | text       | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| delivery_fee        | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| ship_time           | string     | null: false                    |
| price               | integer    | null: false                    |
| seller              | references | null: false, foreign_key: true |
| buyer               | references | null: true, foreign_key: true  |

### Association

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| region              | string     | null: false                    |
| city                | string     | null: false                    |
| street              | string     | null: false                    |
| building            | string     | null: true                     |
| phone_number        | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
