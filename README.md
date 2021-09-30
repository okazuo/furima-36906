#　テーブル設計

## usersテーブル

| Column           | type   | Options                 |
|------------------|--------|-------------------------|
|nickname          |string  |null:false               |
|email             |string  |null:false, unique: true |
|encrypted_password|string  |null:false               |
|last_namej        |string  |null:false               |
|first_namej       |string  |null:false               |
|last_namek        |string  |null:false               |
|first_namek       |string  |null:false               |
|birthday          |date    |null:false               |

### association

has_many :items
has_many :orders

## itemsテーブル

| Column           | type       | Options                         |
|------------------|------------|---------------------------------|
|title             |string      |null:false                       |
|price             |integer     |null:false                       |
|explanation       |text        |null:false                       |
|category_id       |integer     |null:false                       |
|status_id         |integer     |null:false                       |
|postage_id        |integer     |null:false                       |
|prefecture_id     |integer     |null:false                       |
|period_id         |integer     |null:false                       |
|user              |references  |null:false ,foreign_key: true    |

### association

belongs_to :user
has_one :order

## ordersテーブル

| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|user              |references  |null:false, foreign_key: true |
|item              |references  |null:false, foreign_key: true |

### association

belongs_to :user
belongs_to :item
has_one :delivery

## deliveriesテーブル

| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|postal_number     |string      |null:false                    |
|prefecture_id     |integer      |null:false                   |
|municipality      |string      |null:false                    |
|lot_number        |string      |null:false                    |
|building          |string      |                              |
|telephone         |string      |null:false                    |
|order             |references  |null:false, foreign_key: true |


### association

belongs_to :order