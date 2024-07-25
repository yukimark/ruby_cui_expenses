require_relative 'models/spend'
require_relative 'module/view'

def add_spend
  spend = Spend.new
  spend.category = View::SpendView.spend_category
  loop do
    View.color_message('金額を入力してください。', :green)
    spend.price = gets.chomp.to_i
    break if spend.input_price_validate

    View.color_message('金額は1から999,999,999までの数字を入力する必要があります。', :red)
  end
  spend.fixedcost = View.boolean('固定費ですか?')
  spend.deferredpay = View.boolean('カードなどの後払いですか?')
  if View.confirm(content: spend, message: '上記の内容で登録しますか?') && spend.save
    View.color_message('保存しました。', :green)
  else
    View.color_message('保存できませんでした。', :green)
  end
end

def all_spend
  Spend.all
end

def delete_spend_last
  spend = Spend.last
  delete_spend_confirm(spend)
end

def delete_spend_find_id
  View.line(2)
  View.color_message('IDを入力してください。', :green)
  id = gets.chomp.to_i
  begin
    spend = Spend.find(id)
  rescue StandardError
    View.color_message('データが見つかりません。', :red)
    return
  end
  delete_spend_confirm(spend)
end

private

def delete_spend_confirm(spend)
  View.line(2)
  if View.confirm(content: spend, message: '上記の内容を削除しますか?') && spend.delete
    View.color_message('削除しました。', :red)
  else
    View.color_message('削除できませんでした。', :red)
  end
end
