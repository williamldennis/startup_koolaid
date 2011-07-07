require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User", 
                 :email => "example@spinlister.com",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    User.all(:limit => 6).each do |user|
      3.times do
        user.bikes.create!(:name => "Will's Sweet Ride", 
                           :description => "this is a great bike",
                           :size => "6 feet",
                           :biketype => "Road",
                           :price => 19.50)
      end
    end
  end
end