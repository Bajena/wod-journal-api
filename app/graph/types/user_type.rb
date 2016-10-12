UserType = GraphQL::ObjectType.define do
  name "User"

  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, types.ID
  field :email, types.String
  field :first_name, types.String
  field :last_name, types.String
  field :birth_date, types.String
  field :height_cm, types.Int
  field :weight_kg, types.Int

  connection :created_wods, WodType.connection_type do
    resolve -> (user, _args, _ctx) { user.wods }
  end

  connection :coached_boxes, BoxType.connection_type do
    resolve -> (user, _args, _ctx) { user.boxes }
  end

  connection :boxes, BoxType.connection_type do
    resolve -> (user, _args, _ctx) { user.boxes }
  end
end
