CollectionType = GraphQL::ObjectType.define do
  # Hack to support root queries
  name 'Collection'
  description 'Support unassociated root queries that fetches collections.'
  # interfaces [NodeIdentification.interface]

  connection :wods, WodType.connection_type do
    description 'Wod connection to fetch paginated wods collection.'
    resolve ->(object, args, ctx) do
      Wod.all
    end
  end
end
