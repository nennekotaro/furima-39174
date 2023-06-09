# README

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------  | -----------                    |
| nickname           | string  | null: false                    |
| email              | string  | null: false, unique: true      |
| encrypted_password | string  | null: false                    |
| last_name          | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| birth_data         | date    | null: false                    |

### Association

- has_many :items
- has_many :pay_purchases

## items テーブル

| Column                 | Type       | Options                        |
| ------------------     | ------     | -----------                    |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| price                  | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :pay_purchase
- belongs_to_active_hash :category_id
- belongs_to_active_hash :sales_status_id
- belongs_to_active_hash :shipping_fee_status_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :scheduled_delivery_id

## pay_purchases テーブル
| Column        | Type       | Options                        |
| ------------- | -------    | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :pay_form

## pay_forms テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal_code        | string     | null: false                    |
| city               | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| pay_purchase       | references | null: false, foreign_key: true |
| prefecture_id      | integer    | null: false                    |


### Association

- belongs_to :pay_purchase
- belongs_to_active_hash :prefecture_id
