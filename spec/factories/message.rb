require 'faker'
FactoryGirl.define do
  factory :message do
    body Faker::Pokemon.name
    group_id "1"
  end
  factory :empty_message, class: Message do
    body ""
    group_id "1"
  end
end
#
