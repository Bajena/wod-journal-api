namespace :db do
  unless Rails.env.production?
    namespace :dev do
      desc "Setup or migrate (MySQL)"
      task setup: :environment do
        Rake::Task["db:setup_or_migrate"].execute
      end

      desc "Reset and setup (MySQL)"
      task reset: :environment do
        Rake::Task["db:reset"].execute
      end
    end
  end

  desc "Setup or migrate MySQL database"
  task setup_or_migrate: :environment do
    begin
      ActiveRecord::Base.connection
    rescue => e
      raise e unless e.to_s =~ /Unknown database/
      puts "Setting up MySQL database"
      Rake::Task["db:setup"].invoke
    else
      puts "Running MySQL migrations"
      Rake::Task["db:migrate"].invoke
      Rake::Task["db:seed"].invoke
    end
  end
end
