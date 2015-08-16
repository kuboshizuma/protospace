#仕様
##DB設計
各テーブルは
* id intrger
* created_at datetime
* updated_at datetime

を含みます。

また、必要があればその都度indexを張ります。

###prototypes
* title varchar
* catch_copy varchar
* concept text

###prototype_images
* image varchar
* type enum(0, 1)
* prototype_id integer

###tags
* name varchar

###prototype_tags
* prototype_id integer
* tag_id integer

###users
* nickname varchar
* team varchar
* profile text
* work varchae
* avator varchar

***以下、devise使用のため***
* email
* encrypted_password
* reset_password_token
* reset_password_sent_at
* remember_created_at
* sign_in_count
* current_sign_in_ip
* last_sign_in_ip

### comments
* text text
* prototype_id integer
* user_id integer

### likes
* prototype_id
* user_id
