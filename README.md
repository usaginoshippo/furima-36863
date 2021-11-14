## usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| mail               | string | null: false, default: "" |
| encrypted_password | string | null: false, default: "" |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association
has_many :items
has_many :comments
has_many :buys


## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_image         | image      | null: false                    |
| item_name          | string     | null: false                    |
| item_explanation   | text       | null: false                    |
| category           | string     | null: false                    |
| product_condition  | string     | null: false                    |
| ship_cost          | string     | null: false                    |
| ship_area          | string     | null: false                    |
| ship_days          | string     | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
belongs_to :buy
belongs_to :user
has_many :comments


## buysテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
has_many :items
has_one :shipping
belongs_to :user


## shippingsテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postal_code        | integer | null: false |
| prefecture         | string  | null: false |
| cities             | string  | null: false |
| house_num          | string  |             |
| building           | string  | null: false |
| tel_num            | integer | null: false |

### Association
belongs_to :buy


## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user_id | references | null:false, foreign_key: true  |
| item_id | references | null:false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item