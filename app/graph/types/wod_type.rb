WodType = GraphQL::ObjectType.define do
  name "Wod"
  description "A WOD"
  field :title, types.String
  field :comment, types.String
  # field :author do
  #   type AuthorType
  #   resolve -> (obj, args, ctx) {
  #     obj.author
  #   }
  # end
end
