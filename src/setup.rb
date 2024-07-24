require_relative 'module/db'
require 'i18n'
require 'pry'

def setup
  DB.connect
  i18n_setting
end

private

def i18n_setting
  I18n.load_path = ['config/locales/ja.yml']
  I18n.locale = :ja
end
