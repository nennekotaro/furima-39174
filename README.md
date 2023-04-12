# README

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| genre_id           | integer | null: false |

### Association

- has_many :items
- has_one :pay_form

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| name               | text       | null: false                    |
| info               | text       | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| genre_id           | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :pay_form

## pay_forms テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal_code        | integer    | null: false                    |
| city               | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |
| genre_id           | integer    | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
