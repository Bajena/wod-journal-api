# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wod do
    title "new wod"
    goal_type "amrap"
    author_id 1
  end
end
