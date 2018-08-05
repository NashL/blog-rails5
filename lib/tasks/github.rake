# frozen_string_literal: true

namespace :github do
  desc ' >> GitHub commit with message'
  task :commit, [:message] => :environment do |_task, args|
    sh %( git add -A )
    sh %( git commit -m "#{args.message}" )
    sh %( git push )
  end
end
