# frozen_string_literal: true

namespace :routes do
  desc 'Alias for rails routes'
  task :show do
    puts `bin/rails routes`
  end
end

task routes: 'routes:show'
