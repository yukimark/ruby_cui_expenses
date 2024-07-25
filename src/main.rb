require_relative 'module/view'
require_relative 'controller'
require_relative 'setup'

def main
  setup
  loop do
    menu_str = View.top

    case menu_str
    when 'a'
      add_spend
    when 's'
      spends = all_spend
      View.spend_index(spends)
    when 'l'
      delete
    when ';'
      break
    end
  end
end

def delete
  if Spend.count.zero?
    View.color_message('お小遣い帳のデータは0件です。', :red)
    return
  end
  menu_str = View.delete_spend_menu

  case menu_str
  when 'a'
    delete_spend_last
  when 's'
    delete_spend_find_id
  end
end

main
