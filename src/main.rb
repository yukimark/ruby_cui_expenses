require_relative 'module/view'
require_relative 'controller'
require_relative 'module/db'

def main
  DB.connect
  loop do
    View.line(1)
    menu_str = View.top

    case menu_str
    when "a"
      add_spend
      View.line(2)
    when "s"
      spends = all_spend
      View.spend_index(spends)
      View.line(2)
    when ";"
      View.line(1)
      end_message = HighLine.new
      puts end_message.color('アプリを終了します。', :green)
      break
    end
  end
end

main
