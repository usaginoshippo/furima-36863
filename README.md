## usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, default: "" |
| encrypted_password | string | null: false, default: "" |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association
has_many :items
has_many :buys


## itemsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_explanation     | text       | null: false                    |
| category_id          | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| ship_cost_id         | integer    | null: false                    |
| ship_area_id         | integer    | null: false                    |
| ship_days_id         | integer    | null: false                    |
| price                | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association
has_one :buy
belongs_to :user


## buysテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
has_one :shipping
belongs_to :item
belongs_to :user


## shippingsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| cities             | string     | null: false                    |
| house_num          | string     |                                |
| building           | string     | null: false                    |
| tel_num            | integer    | null: false                    |
| buy_id             | references | null: false, foreign_key: true |

### Association
belongs_to :buy
