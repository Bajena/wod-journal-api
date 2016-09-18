WodItemType = GraphQL::ObjectType.define do
  name "WodItem"
  description "A part of WOD"
  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, !types.ID, "WOD item id"
  field :reps, types.Int, "Number of repetitions"
  field :men_weight_kg, types.Int, "Weight in kg for men"
  field :women_weight_kg, types.Int, "Weight in kg for women"
  field :movement, MovementType, "Movement"
  field :wod, WodType, "WOD"
end
