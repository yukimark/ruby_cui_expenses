require_relative 'module/db'
require 'i18n'
require 'pry'
require 'curses'

CURSES_COLOR_RED = 1
CURSES_COLOR_GREEN = 2

def setup
  DB.connect
  i18n_setting
  Curses.init_screen
  Curses.start_color
  Curses.init_pair(CURSES_COLOR_RED, Curses::COLOR_RED, Curses::COLOR_BLACK)
  Curses.init_pair(CURSES_COLOR_GREEN, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
end

private

def i18n_setting
  I18n.load_path = ['config/locales/ja.yml']
  I18n.locale = :ja
end
