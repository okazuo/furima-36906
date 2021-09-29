#　テーブル設計

## usersテーブル

| Column           | type   | Options   |
|------------------|--------|-----------|
|nickname          |string  |null:false |
|email             |string  |null:false |
|encrypted_password|string  |null:false |
|last_namej        |string  |null:false |
|first_namej       |string  |null:false |
|last_namek        |string  |null:false |
|first_namek       |string  |null:false |
|birthday          |date    |null:false |

### association

has_many: items
has_many: buys

## itemsテーブル

| Column           | type       | Options                         |
|------------------|------------|---------------------------------|
|title             |string      |null:false                       |
|explanation       |text        |null:false                       |
|category          |string      |null:false                       |
|status            |string      |null:false                       |
|postage           |string      |null:false                       |
|shipment_source   |string      |null:false                       |
|period            |string      |null:false                       |
|user              |references  |null:false ,foreign_key: true    |

### association

belongs_to: user
has_one: buy

## buysテーブル

| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|user              |references  |null:false, foreign_key: true |
|item              |references  |null:false, foreign_key: true |

### association

belongs_to: user
belongs_to: buy
has_one: delivery

## deliverysテーブル

| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|postal_number     |integer     |null:false                    |
|prefectures       |string      |null:false                    |
|municipalities    |string      |null:false                    |
|lot_number        |integer     |null:false                    |
|building          |string      |null:false                    |
|telephone         |integer     |null:false                    |
|buy               |references  |null:false, foreign_key: true |


### association

belongs_to: buy