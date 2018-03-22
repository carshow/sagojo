# README

-------------------------------------------------------------------------------

## users table
| Column          | Type           | Options                                |
|:---------------:|:--------------:|:--------------------------------------:|
| name            | string         | index: true, null: false, unique: true |
| email           | string         | null: false, unique: true              |
| password        | string         | null: false                            |
| magazine        |integer         | null: false                            |
### Association
+ has_many :job_tags, through: user_tags
+ has_many :user_tags
+ has_many :applications
+ has_many :articles, through: clips
+ has_many :clips

-------------------------------------------------------------------------------

## profiles table
| Column          | Type           | Options                                |
|:---------------:|:--------------:|:--------------------------------------:|
| avatar          | string         |                                        |
| background      | string         |                                        |
| catch_phrase    | text           |                                        |
| birthday        | string         |                                        |
| sex             | string         |                                        |
| phone_number    | string         |                                        |
| postal_code     | string         |                                        |
| region          | string         |                                        |
| city            | text           |                                        |
| adress          | text           |                                        |
| building_name   | text           |                                        |
| you_are_here    | text           |                                        |
| private_links   | text           |                                        |
| page_view       | text           |                                        |
| sns             | text           |                                        |
| follower        | text           |                                        |
| job_tag         | reference      |                                        |
| occupations     | text           |                                        |
| language_skill  | text           |                                        |
| experience      | text           |                                        |
| travel_history  | text           |                                        |
| skill_tag       | string         |                                        |
| detailed_skill  | text           |                                        |
| achievement     | text           |                                        |
| income          | text           |                                        |
| prepratatory_time | text           |                                        |
| travel_prans    | reference      |                                        |
| travel_purpose  | text           |                                        |
| introduction    | text           |                                        |

### Association
+ belongs_to :user
+ belogns_to :profile
+ has_many :plans

-------------------------------------------------------------------------------

## travel_plans table
| Column      | Type       | Options                           |
|:-----------:|:----------:|:---------------------------------:|
| departure_time | string    |                                 |
| return_time    | string    |                                 |
| destination    | text      |                                 |
| profile_id     | reference | foreign_key: true               |

### Association
+ belongs_to :profile

-------------------------------------------------------------------------------

## clips table

| Column      | Type                  | Options                         |
|:-----------:|:---------------------:|:-------------------------------:|
|article_id   | references            |null: false, foreign_key: true|
|user_id      | references            |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article

-------------------------------------------------------------------------------

## job_tags table
| Column      | Type                  | Options                         |
|:-----------:|:---------------------:|:-------------------------------:|
| name        | string                | null: false                     |
| user_tag_id| references :user_jobtag | null: false, foreign_key: true  |

### Association
+ has_many :user, through: user_tags
+ has_many :user_jobtags

-------------------------------------------------------------------------------

## user_jobtags table

| Column      | Type                  | Options                         |
|:-----------:|:---------------------:|:-------------------------------:|
| user_id     | references :user  | null: false, foreign_key: true |
| job_tag_id  | references :job_tag | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :job_tag

-------------------------------------------------------------------------------

## articles table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|image|null: false|
|comment|text|null:false|
|price|integer|null: false|
|Application_end_date|integer|null: false|
|company_id|integer|foreign_key: true|

### Association
+ belongs_to :company
+ has_many :categorys, through :articles_category
+ has_many :articles_categorys
+ has_many :users, through :clips
+ has_many :clips
+ has_many :applications

-------------------------------------------------------------------------------

## applications table
|Column|Type|Options|
|------|----|-------|
|often_visiting_places|text||
|good_at_genre|text|       |

### Association
+ belongs_to :user
+ belongs_to :profile
+ belongs_to :article

-------------------------------------------------------------------------------

## categorys table
| Column      | Type                 | Options                        |
|:-----------:|:--------------------:|:------------------------------:|
| name        | string               | null: false |
| article_id  | references :work     | null: false, foreign_key: true |

### Association
+ has_many :articles, through :articles_category
+ has_many :categorys

-------------------------------------------------------------------------------

## articles_categorys table
| Column      | Type                 | Options                        |
|:-----------:|:--------------------:|:------------------------------:|
| article_id  | references :article  | null: false, foreign_key: true |
| category_id | references :category | null: false, foreign_key: true |


### Association
+ belongs_to :article
+ belongs_to :category

-------------------------------------------------------------------------------


## companys table
| Column      | Type           | Options                        |
|:-----------:|:--------------:|:------------------------------:|
| name        | string         | null: false, unique: true      |
| email       | string         | null: false, unique: true      |
| password    | string         | null: false                    |


### Association
+ has_many :articles

