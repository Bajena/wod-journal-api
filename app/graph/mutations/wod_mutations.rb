module WodMutations
  CreateWod = GraphQL::Relay::Mutation.define do
    name "CreateWod"
    description "Create a new WOD with excercises list and return a new WOD"

    # Define input parameters
    input_field :title, !types.String
    input_field :goal_type, !types.String

    # Define return parameters
    return_field :wod, WodType

    resolve lambda { |inputs, ctx|
      user = ctx[:current_user]
      wod = user.wods.create(
        title: inputs[:title],
        goal_type: inputs[:goal_type]
      )

      { wod: wod }
    }
  end
end
