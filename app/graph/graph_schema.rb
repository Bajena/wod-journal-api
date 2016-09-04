GraphSchema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType
  node_identification NodeIdentification
  max_complexity 100
end
