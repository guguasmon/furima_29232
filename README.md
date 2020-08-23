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
| birth_date      | date     | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category      | integer    | null: false                    |
| state         | integer    | null: false                    |
| delivery_type | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| duration      | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| price  | integer     | null: false                   |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false                    |

### Association

- belongs_to :order