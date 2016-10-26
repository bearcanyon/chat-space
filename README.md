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
:messages, :group_id
:users, :name
:users, :email, unique: true
:groups, :name
:users_groups, [:group_id, :user_id]
