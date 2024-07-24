require_relative 'module/view'
require_relative 'controller'
require_relative 'setup'

def main
  setup
  loop do
    View.line(1)
    menu_str = View.top

    case menu_str
    when 'a'
      add_spend
      View.line(2)
    when 's'
      spends = all_spend
      View.spend_index(spends)
      View.line(2)
    when ';'
      View.line(1)
      View.color_message('アプリを終了します。', :green)
      break
    end
  end
end

main
