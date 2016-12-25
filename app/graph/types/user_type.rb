UserType = GraphQL::ObjectType.define do
  name "User"

  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, !types.ID
  field :email, types.String
  field :first_name, types.String
  field :last_name, types.String
  field :birth_date, types.String
  field :height_cm, types.Int
  field :weight_kg, types.Int
  field :created_wods, types[WodType], "WODs created by the user"
  field :coached_boxes, types[BoxType], "List of boxes the user is a coach of"
  field :boxes, types[BoxType], "List of boxes the user belong to"
end
