if Rails.env.development?
  require 'annotate'
  task routes: :environment do
    puts `bundle exec rails routes`
  end
end
