require 'rake'
require 'active_record'
require_relative 'src/module/db'

namespace :db do
  desc 'Create a new migration file'
  task :create_migration do
    file_name = ENV['file_name']
    if file_name.nil?
      puts 'You must provide a name for the migration'
      puts 'usage=>rake db:create_migration file_name=file_name'
      exit 1
    end

    timestamp = Time.now.utc.strftime('%Y%m%d%H%M%S')
    migration_name = "#{timestamp}_#{file_name}.rb"
    migration_dir = 'db/migrate'
    FileUtils.mkdir_p(migration_dir) unless Dir.exist?(migration_dir)
    migration_file = File.join(migration_dir, migration_name)

    File.open(migration_file, 'w') do |file|
      file.write <<~MIGRATION
        class #{file_name.split('_').map(&:capitalize).join} < ActiveRecord::Migration[7.1]
          def change
            # Your migration code goes here
          end
        end
      MIGRATION
    end

    puts "Created migration #{migration_file}"
  end

  desc 'Migrate the database'
  task :migrate do
    DB.connect
    ActiveRecord::Migrator.migrations_paths = ['db/migrate']
    ActiveRecord::Tasks::DatabaseTasks.migrate
    Rake::Task['db:schema_dump'].invoke
  end

  desc 'Dump the database schema to a file'
  task :schema_dump do
    filename = 'db/schema.rb'
    File.open(filename, 'w:utf-8') do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
    puts "Schema dumped to #{filename}"
  end

  desc 'Drop the database'
  task :drop do
    system 'rm db/*.sqlite3*'
    system 'rm db/schema.rb'
  end
end

desc 'Run application'
task :run do
  system 'bundle exec ruby src/main.rb'
end
