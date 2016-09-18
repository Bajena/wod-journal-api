WodType = GraphQL::ObjectType.define do
  name "Wod"
  description "A set of excercises with reps/times"

  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, !types.ID, "WOD id"
  field :author, UserType, "User who created the WOD"
  field :comment, types.String, "Additional comment"
  field :created_at, types.String, "Date when the WOD was created"
  field :date, types.String, "Date when the WOD happens"
  field :goal_type, !WodEnums::GoalTypeEnum, "Goal type"
  field :title, types.String, "Custom WOD title"

  connection :wod_items, WodItemType.connection_type
end
