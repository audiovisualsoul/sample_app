namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Sean Flynn",
                         :email => "seanflynn@comcast.net",
                         :password => "banker1480",
                         :password_confirmation => "banker1480")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    50.times do
      User.all(:limit => 6).each do |user|
        user.projects.create!(:name => Faker::Lorem.sentence(2), :description => Faker::Lorem.sentence(5))
      end
    end
  end
end