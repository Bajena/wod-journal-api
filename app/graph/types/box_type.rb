BoxType = GraphQL::ObjectType.define do
  name "Box"

  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, types.ID
  field :name, types.String

  connection :coaches, UserType.connection_type do
    resolve -> (box, _args, _ctx) { box.coaches }
  end

  connection :members, UserType.connection_type do
    resolve -> (box, _args, _ctx) { box.members }
  end
end
