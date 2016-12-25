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
  field :rounds, types.Int, "Number of rounds to perform"
  field :preset, types.Boolean, "Is this a preset WOD?"
  field :preset_wod, WodType, "A preset WOD this WOD is based on"
  field :box, BoxType, "The Box for which the WOD was created"

  connection :wod_items, WodItemType.connection_type
end
