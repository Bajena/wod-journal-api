QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :node, field: NodeIdentification.field

  field :wod do
    type WodType
    argument :id, !types.ID

    resolve -> (_obj, args, _ctx) { Wod.find(args[:id]) }
  end

  field :wods, types[WodType] do
    resolve -> (_obj, _args, _ctx) { Wod.all }
  end
  field :movements, types[MovementType] do
    resolve -> (_obj, _args, _ctx) { Movement.all }
  end
  field :user do
    type UserType
    argument :id, !types.ID
    resolve -> (_obj, args, _ctx) { User.find(args[:id]) }
  end

  field :current_user do
    type UserType
    resolve -> (_obj, _args, ctx) { ctx[:current_user] }
  end
end
