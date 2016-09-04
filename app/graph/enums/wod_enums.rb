module WodEnums
  GoalTypeEnum = GraphQL::EnumType.define do
    name 'Goal'
    description 'Type of goal to reach in a WOD'
    value 'amrap', 'As many reps/rounds as possible'
    value 'for_time', 'Finish the workout as fast as possible'
    value 'emom', 'Every minute on the minute'
  end
end
