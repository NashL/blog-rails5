namespace :github do
  desc ' >> GitHub commit with message'
  task :commit, [:message] => :environment do |task, args|
    sh %{ git add -A }
    sh %{ git commit -m "#{args.message}" }
    sh %{ git push }
  #  sh %( git add )
 #   sh %( git commit -m "#{args.message}" )
#    sh %( git push )
  end

end
