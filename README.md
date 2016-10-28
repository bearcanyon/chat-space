== README

#Tables
## messages
| column | type | Constraint |
|:---------------| -----------:| -----------:|
| body           |        text | null:false |
| image          |      string |           |
| group_id       |     integer | references :groups |
| user_id        |     integer | references :users |

## users
| column | type | Constraint |
|:-----------|------------:|------------:|
| name       |      string |              null:false |
| email      |      string |              null:false |
| password   |      string |              null:false |


## groups
| column | type | Constraint |
|:-----------|------------:|------------:|
| name       |      string |  null:false |

## users_groups <!-- 誰がどのグループに属するか -->
| column | type | Constraint |
|:-----------|------------:|------------:|
| group_id       |     integer | references :groups |
| user_id        |     integer | references :users |

## add_index
:messages, :group_id <br>
:users, :name <br>
:users, :email, unique: true <br>
:groups, :name <br>
:users_groups, [:group_id, :user_id] <br>

<!-- 1対多の関係を表すもの -->
#Association
## message
- belongs_to :user
- belongs_to :group

## user
- has_many :messages
- has_many :users_groups
- has_many :groups, through: users_groups

## group
- has_many :messages
- has_many :users_groups
- has_many :users, through: users_groups

## user_group
- belongs_to :user
- belongs_to :group
