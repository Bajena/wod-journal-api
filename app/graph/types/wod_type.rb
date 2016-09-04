WodType = GraphQL::ObjectType.define do
  name "Wod"
  description "A set of excercises with reps/times"

  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, !types.ID, "WOD id"
  field :title, types.String, "Custom WOD title"
  field :goal_type, !WodEnums::GoalTypeEnum, "Goal type"
  field :comment, types.String, "Additional comment"
  field :date, types.String, "Date when the WOD happens"
  field :created_at, types.String, "Date when the WOD was created"
  field :author, UserType, "User who created the WOD"

  connection :wod_items, WodItemType.connection_type
end
