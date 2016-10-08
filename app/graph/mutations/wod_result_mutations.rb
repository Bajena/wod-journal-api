module WodResultMutations
  AddWodResult = GraphQL::Relay::Mutation.define do
    name "AddWodResult"
    description "Add a result of a given WOD"

    input_field :reps, types.Int
    input_field :time_seconds, types.Int
    input_field :done, types.Boolean
    input_field :scaled, types.Boolean
    input_field :wod_id, !types.ID

    return_field :wod_result, WodResultType

    resolve lambda { |inputs, ctx|
      user = ctx[:current_user]
      wod_result = user.wod_results.create!(inputs.to_h)

      { wod_result: wod_result }
    }
  end
end
