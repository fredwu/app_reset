require 'app_reset'
require 'rails'

module AppReset
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/app_reset_tasks.rake'
    end
  end
end
