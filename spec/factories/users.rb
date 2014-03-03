FactoryGirl.define do
  factory :user do

    name "person"
    email "asha@gmail.com"
    address "blah blah blah"
    password "hello"
    password_digest "hello"
  end

  factory :invalid_user do 
    name " "
    email " "
    address "invalid invalid"
  end
end
