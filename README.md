

# usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

#Association

has_many :items
has_many :orders

# itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| text         | text       | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| shipping_fee | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| scheduled    | integer    | null: false                    |
| genre        | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

#Association

belongs_to :user
has_one :order

# ordersテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

#Association

belongs_to :user
belongs_to :order
has_one :address

# addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city_name     | string     | null: false                    |
| block_name    | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

#Association

belongs_to :order
