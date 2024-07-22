require 'tty'

def display_menu_top
  choice_menu = TTY::Prompt.new.select('メニューを選んでください。') do |menu|
    menu.choice 'お小遣い帳入力', {num: 1}
    menu.choice 'お小遣い帳一覧', {num: 2}
    menu.choice '終了',           {num: 3}
  end

  choice_menu[:num]
end
