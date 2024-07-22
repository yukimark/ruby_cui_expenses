require 'active_record'
require 'yaml'

module DB
  class << self
    def connect
      db_config = YAML.load_file('config/database.yml', aliases: true)

      ActiveRecord::Base.establish_connection(db_config['production'])
    end
  end
end
