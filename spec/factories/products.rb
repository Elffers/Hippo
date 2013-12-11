FactoryGirl.define do
  factory :product1 do |f|
    f.user_id 2
    f.name "black boots"
    f.price 9.99
    f.description "Comfortable black boots"
    f.retired false
    f.inventory 5
  end

  factory :product2 do |f|
    f.user_id 4
    f.name "red ring"
    f.price 19.99
    f.description "pretty red ring"
    f.retired false
    f.inventory 23
  end

  factory :product3 do |f|
    f.user_id 12
    f.name "white tablecloth"
    f.price 12.00
    f.description "Lacy white tablecloth"
    f.retired false
    f.inventory 1
  end
end