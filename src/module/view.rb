require 'highline/import'

module View
  class << self
    def line(count)
      count.times do
        puts '----------------------------------------------------------------------------------'
      end
    end

    def color_message(message, color)
      output_message = HighLine.new
      puts output_message.color(message, color)
    end

    def confirm(content: nil, message: '進めていいですか?')
      if content.is_a?(ActiveRecord::Base) # modelを想定している
        excluded_attributes = %w[id created_at updated_at]
        attributes = content.attributes.except(*excluded_attributes)
        View.color_message('確認画面です。', :green)
        attributes.each do |key, value|
          puts "#{key}: #{value}"
        end
      end
      View.line(2)
      View.boolean(message)
    end

    def top
      choices = {
        'a' => 'お小遣い帳入力',
        's' => 'お小遣い帳一覧',
        ';' => '終了する'
      }

      select_menu('メニューを選択してください。', choices)
    end

    def spend_category
      choices = {
        'a' => '食費',
        's' => '日用品',
        'd' => '家賃'
      }

      choice = select_menu('項目を選択してください。', choices)
      choices[choice]
    end

    def boolean(desc)
      choices = {
        'y' => 'Yes',
        'n' => 'No'
      }

      choice = select_menu(desc, choices)
      choice == 'y'
    end

    def spend_index(_spends)
      p Spend.all
    end
  end
end

private

def select_menu(message, choices)
  View.color_message(message, :green)
  choices.each do |key, name|
    say("#{key}: #{name}")
  end

  ask('選択肢に対応したキーを入力してください。') { |q| q.in = choices.keys }
end
