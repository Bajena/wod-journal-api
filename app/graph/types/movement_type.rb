MovementType = GraphQL::ObjectType.define do
  name "Movement"
  description "An excercise"
  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, !types.ID, "Movement id"
  field :default_reps, types.Int, "Typical number of reps"
  field :default_kg_men, types.Int, "Typical weight for men in kilograms"
  field :default_kg_women, types.Int, "Typical weight for women in kilograms"
  field :default_reps, types.Int, "Typical number of reps"
  field :name, types.String, "Movement name"
end
