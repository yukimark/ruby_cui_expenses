require 'highline/import'
require 'pry'

module View
  class << self
    def line(i)
      i.times do
        puts '----------------------------------------------------------------------------------'
      end
    end

    def top
      choices = {
        'a' => 'お小遣い帳入力',
        's' => 'お小遣い帳一覧',
        ';' => '終了する'
      }

      choice = select_menu('メニューを選択してください。', choices)

      selected_value = choice
      selected_value
    end

    def spend_category
      choices = {
        'a' => '食費',
        's' => '日用品',
        'd' => '家賃'
      }

      choice = select_menu('項目を選択してください。', choices)

      selected_value = choices[choice]
      selected_value
    end

    def boolean(desc)
      choices = {
        'y' => 'Yes',
        'n' => 'No'
      }

      choice = select_menu(desc, choices)
      selected_value = choice == 'y' ? true : false
      selected_value
    end

    def spend_index(spends)
      p Spend.all
      # binding.pry
    end
  end
end

private
def select_menu(message, choices)
  say(message)
  # puts Highline.new.color(message, :green)
  choices.each do |key, name|
    say("#{key}: #{name}")
  end

  choice = ask('選択肢に対応したキーを入力してください。') { |q| q.in = choices.keys }
  choice
end
