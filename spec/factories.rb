Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "thepen@isblue.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :bike do |bike|
  bike.name "Foobar"
  bike.description "lorem ipsum"
  bike.size "size"
  bike.biketype "road"
  bike.price "6.00" 
  bike.association :user
end