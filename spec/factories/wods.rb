# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wod do
    title "new wod"
    goal_type "amrap"
    author { create(:user, email: "wod@email.com") }
    wod_items { [WodItem.new(movement: Movement.first, reps: 1)] }
  end
end
