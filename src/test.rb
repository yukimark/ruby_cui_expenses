require "active_record"
require 'pry-rails'

# データベースへの接続
ActiveRecord::Base.establish_connection(
  adapter:   'sqlite3',
  database:  'test.sqlite3'
)

# スキーマの設定
# class InitialSchema < ActiveRecord::Migration[7.1]
#   def self.up
#     create_table :users do |t|
#       t.string :name
#     end
#   end

#   def self.down
#     drop_table :users
#   end
# end

# マイグレーション
# InitialSchema.migrate(:up)

class User < ActiveRecord::Base
end

# モデルを生成
# User.create(name: 'hogehoge')

binding.pry

# 表示
p User.find(1).name
