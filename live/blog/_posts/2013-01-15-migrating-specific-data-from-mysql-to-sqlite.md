---
layout: post
title: Migrating specific data from mysql to sqlite
author: chielo@coshx.com
---
A strategy for migrating specific data (such as all active users) from mysql to a sqlite using Ruby drivers and ActiveRecord.

1. Create/Commandeer a rails app.
2. Install mysql 2.8.1, ruby-mysql and sqlite3
3. Create ActiveRecord schema from existing mysql database by pointing rails config/database.yml to the mysql database and using rake db:schema:dump
4. Remove :force => true from the newly generated schema.rb to prevent accidentally destroying the mysql database data
5. Migrate database structure defined in ActiveRecord schema to new sqlite database by changing config/database.yml to point to a new sqlite database and running rake db:schema:load.
6. Using ruby drivers, select records from mysql database according to the specific parameters and insert the results into the new sqlite database. In the example script below, data is transferred only for active users (users with 'active' field set to true).

------

```ruby


#schema.rb

ActiveRecord::Schema.define(:version => 0) do
  create_table "users" do |t|
    t.integer "photo_id"
    t.boolean "active"
  end
  create_table "posts"  do |t|
    t.integer "user_id"
  end
  create_table "photos" do |t|
  end
end

```

```ruby
#script.rb

require 'mysql'
require 'sqlite3'

#transfer_table('users', 'id', active_user_ids)
#transfer_table('posts', 'user_id', active_user_ids)
#transfer_table('photos', 'id', active_user_photo_ids)

def transfer_table(table_name, id_column_name, ids_to_transfer)
  ids_to_transfer.each do |id|
    mysql_records = mysql_select(table_name, id_column_name, id)
    mysql_records.each do |record|
      sqlite_insert(table_name, record)
    end
  end
end

def active_user_ids
  @active_user_ids ||= mysql_result_to_array(
    mysql.query(
      "SELECT id FROM users
       WHERE active = true ;"
    )
  ).collect { |record| record.first }
end

def active_user_photo_ids
  @active_user_ids ||= mysql_result_to_array(
    mysql.query(
      "SELECT id FROM photos
       WHERE user_id IN (#{active_user_ids});"
    )
  ).collect { |record| record.first }
end

def mysql_result_to_array(mysql_result)
   array = Array.new
   mysql_result.each{|row| array.push(row)}
   return array
end

def mysql_select(table_name, id_column_name, id)
  mysql_columns = mysql_columns(table_name)
  mysql_result_to_array(
    mysql.query(
      "SELECT #{mysql_columns}
       FROM #{table_name}
       WHERE #{id_column_name} = #{id}"
    )
  )
end

def sqlite_insert(table_name,mysql_record)
  sqlite_columns =  sqlite_columns(table_name)
  sqlite_values = sqlite_values(mysql_record)
  sqlite.execute(
    "INSERT INTO #{table_name} (#{sqlite_columns})
     VALUES (#{sqlite_values});"
  )
end

def mysql_columns(table_name)
  columns(table_name).collect{ |column|
    "#{table_name}.#{column.first}"
  }.join ','
end

def sqlite_columns(table_name)
  columns(table_name).collect { |column|
    "[#{column.first}]"
  }.join ','
end

def columns(table_name)
  mysql_result_to_array(
    mysql.query(
      "show columns from #{table_name} ;"
    )
  )
end

def sqlite_values(mysql_record)
  mysql_record.to_s.gsub(/^\[/, "").chop
  .gsub('nil', "\"\"").gsub("\\\"", "'")
end


def sqlite
  @sqlite ||= SQLite3::Database.new('db.sqlite')
end

def mysql
  @mysql ||= Mysql.connect('localhost', 'user', 'password', 'database')
end

transfer_table('users', 'id', active_user_ids)
transfer_table('posts', 'user_id', active_user_ids)
transfer_table('photos', 'id', active_user_photo_ids)
