host_is_engine = ! Rake::Task.tasks.map { |t| t.name =~ /app:/ }.uniq.compact.empty?
task_name = host_is_engine ? 'reset' : 'app:reset'

rails_env = ENV['RAILS_ENV']
rails_envs = rails_env.nil? ? ['test', 'development'] : [rails_env]

desc 'Resets (and if available, seeds) your development and test databases'
task task_name => 'db:create' do
  rails_envs.each do |env|
    puts '=' * 35
    puts "Resetting #{env} database ..."
    puts '=' * 35

    # this workaround is faster than spawning subprocesses,
    # but due to the nature of it (it re-enables pretty much all tasks),
    # it probably is a bad idea to have it as a dependency for other tasks
    Rake::Task.tasks.each do |task|
      task.reenable unless task.name == 'load_app'
    end

    Rails.env = env

    Rake::Task['db:migrate:reset'].invoke

    # execute the main app's seeds.rb file
    load 'db/seeds.rb'
  end

  # ensure we reset the Rails.env in case other tasks depend on this
  ENV['RAILS_ENV'] = rails_env
end
