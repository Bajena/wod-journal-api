QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :wod do
    type WodType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Wod.find(args[:id])
    }
  end
end
