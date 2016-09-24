MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :CreateWod, field: WodMutations::CreateWod.field
end
