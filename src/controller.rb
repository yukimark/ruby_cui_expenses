require_relative 'models/spend'
require_relative 'module/view/view'
require_relative 'module/view/spend'

def add_spend
  spend = Spend.new
  spend.category = View::SpendView.spend_category
  spend.price = View::SpendView.spend_price(spend)
  spend.fixedcost = View.boolean(desc: '固定費ですか?')
  spend.deferredpay = View.boolean(desc: 'カードなどの後払いですか?')
  if View.confirm(content: spend, message: '上記の内容で登録しますか?') && spend.save
    View.success_message('保存しました。')
  else
    View.error_message('保存できませんでした。')
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
    View.error_message('データが見つかりません。')
    return
  end
  delete_spend_confirm(spend)
end

private

def delete_spend_confirm(spend)
  View.line(2)
  if View.confirm(content: spend, message: '上記の内容を削除しますか?') && spend.delete
    View.success_message('削除しました。')
  else
    View.error_message('削除できませんでした。')
  end
end
