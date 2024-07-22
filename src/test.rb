require "active_record"
require_relative 'module/db'
require 'pry'
require_relative 'models/spend'

DB.connect


# モデルを生成
Spend.create(category: '食費',
             price: 123,
             fixedcost: true,
             deferredpay: true)


# 表示
p Spend.last

binding.pry
