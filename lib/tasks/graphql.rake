namespace :graphql do
  if Rails.env.development? || Rails.env.test?
    desc "Builds graphql schema.json"

    task schema: :environment do
      # disable max complexity to avoid schema error
      GraphSchema.max_complexity = nil
      schema_json = JSON.pretty_generate(
        GraphSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)
      )
      File.open("db/graph_schema.json", "w") { |file| file.write(schema_json) }
    end
  end
end
