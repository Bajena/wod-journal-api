module WodMutations
  CreateWod = GraphQL::Relay::Mutation.define do
    WodItemInput = GraphQL::InputObjectType.define do
      name "WodItemInput"
      description "A part of WOD"
      argument :reps, !types.Int
      argument :men_weight_kg, types.Int
      argument :women_weight_kg, types.Int
      argument :time_seconds, types.Int
      argument :movement_id, !types.ID
    end

    name "CreateWod"
    description "Create a new WOD with excercises list and return the WOD"

    input_field :title, types.String
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
        rounds: inputs[:rounds],
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

  CreateWodFromPreset = GraphQL::Relay::Mutation.define do
    name "CreateWodFromPreset"
    description "Creates a WOD based on a specific preset (benchmark WOD)"
    input_field :date, types.String
    input_field :preset_wod_id, !types.ID

    return_field :wod, WodType

    resolve lambda { |inputs, ctx|
      user = ctx[:current_user]
      preset_wod = Wod.find_by!(preset: true, id: inputs[:preset_wod_id])
      wod = preset_wod.dup
      wod.author = user
      wod.preset = false
      wod.preset_wod_id = preset_wod.id
      wod.date = inputs[:date]
      wod.wod_items = preset_wod.wod_items.map(&:dup)

      wod.save!

      { wod: wod }
    }
  end
end
