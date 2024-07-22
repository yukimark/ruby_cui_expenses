require 'tty'
require 'pry'

module View
  class << self
    def top
      choice_menu = TTY::Prompt.new.select('メニューを選んでください。') do |menu|
        menu.choice 'お小遣い帳入力', {num: 1}
        menu.choice 'お小遣い帳一覧', {num: 2}
        menu.choice '終了',           {num: 3}
      end
    
      choice_menu[:num]
    end

    def spend_category
      choice_menu = TTY::Prompt.new.select('カテゴリーを選んでください。') do |menu|
        menu.choice '食費'
        menu.choice '日用品'
        menu.choice '家賃'
      end
      choice_menu
    end

    def boolean(desc)
      choice_menu = TTY::Prompt.new.select(desc) do |menu|
        menu.choice 'YES', {num: 1}
        menu.choice 'NO',  {num: 0}
      end
      choice_menu
    end

    def spend_index(spends)
      
      # binding.pry
    end
  end
end
