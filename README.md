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
| birth_data         | integer | null: false, foreign_key: true |

### Association

- has_many :items
- has_one :pay_purchase
- belongs_to_active_hash :birth_data

## items テーブル

| Column              | Type       | Options                        |
| ------------------  | ------     | -----------                    |
| name                | text       | null: false                    |
| info                | text       | null: false                    |
| price               | integer    | null: false                    |
| category            | integer    | null: false, foreign_key: true |
| sales_status        | integer    | null: false, foreign_key: true |
| shipping_fee_status | integer    | null: false, foreign_key: true |
| prefecture          | integer    | null: false, foreign_key: true |
| scheduled_delivery  | integer    | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :pay_purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shipping_fee_status
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery

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
| pay_purchases      | references | null: false, foreign_key: true |
| reference          | integer    | null: false, foreign_key: true |


### Association

- belongs_to :pay_purchases
- belongs_to_active_hash :reference
