# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    rating ""
    product_id ""
    description "MyText"
  end
end
