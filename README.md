# README

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | string | null: false |

### Association

- has many :items
- belongs_to :card
- belongs_to :destination

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| image       | string     | null: false                    |
| price       | string     | null: false                    |
| exhibitor   | string     | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| shipping    | string     | null: false                    |
| send_out    | string     | null: false                    |
| community   | string     | null: false                    |
| explanation | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## Card テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| information     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security        | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
### Association 

- has_one :user

## Destination

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefectures  | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_one :user
