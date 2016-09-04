UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, types.ID
  field :first_name, types.String
  field :last_name, types.String
  field :birth_date, types.String
  field :height_cm, types.Int
  field :weight_kg, types.Int

  interfaces [NodeIdentification.interface]
  # `id` exposes the UUID
  # global_id_field :id

  connection :created_wods, WodType.connection_type do
    resolve -> (user, _args, _ctx) { user.wods }
  end
end
