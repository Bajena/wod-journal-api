BoxType = GraphQL::ObjectType.define do
  name "Box"

  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, !types.ID
  field :name, types.String
  field :coaches, types[UserType]
  field :members, types[UserType]
  field :wods, types[WodType]
end
