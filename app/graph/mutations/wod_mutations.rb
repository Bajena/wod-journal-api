module WodMutations
  CreateWod = GraphQL::Relay::Mutation.define do
    WodItemInput = GraphQL::InputObjectType.define do
      argument :reps, !types.Int
      argument :men_weight_kg, types.Int
      argument :women_weight_kg, types.Int
      argument :movement_id, !types.ID
    end

    name "CreateWod"
    description "Create a new WOD with excercises list and return a new WOD"

    input_field :title, !types.String
    input_field :date, types.String
    input_field :goal_type, !types.String
    input_field :rounds, types.Int
    input_field :wod_items, !types[!WodItemInput]

    return_field :wod, WodType

    resolve lambda { |inputs, ctx|
      user = ctx[:current_user]
      wod = user.wods.new(
        title: inputs[:title],
        goal_type: inputs[:goal_type],
        date: inputs[:date]
      )

      inputs[:wod_items].each do |item|
        wod.wod_items.build(
          reps: item[:reps],
          men_weight_kg: item[:men_weight_kg],
          women_weight_kg: item[:women_weight_kg],
          movement_id: item[:movement_id]
        )
      end

      wod.save!

      { wod: wod }
    }
  end
end
