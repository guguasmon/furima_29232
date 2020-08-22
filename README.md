# テーブル設計

## users テーブル

| Column          | Type     | Options                   |
| --------------- | -------- | ------------------------- |
| name            | string   | null: false               |
| email           | string   | null: false, unique: true |
| password        | string   | null: false               |
| first_name      | string   | null: false               |
| last_name       | string   | null: false               |
| first_name_kana | string   | null: false               |
| last_name_kana  | string   | null: false               |
| birth_date      | datetime | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | text       | null: false                    |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| price          | integer    | null: false                    |
| category       | string     | null: false                    |
| state          | string     | null: false                    |
| delivery_type  | string     | null: false                    |
| prefectures    | string     | null: false                    |
| duration       | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | string     | null: false                    |
| expiration_number  | string     | null: false                    |
| security_code      | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## destinations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     |                                |
| prefectures  | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |
| order_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :order