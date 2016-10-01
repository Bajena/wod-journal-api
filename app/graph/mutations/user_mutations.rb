module UserMutations
  RegisterUser = GraphQL::Relay::Mutation.define do
    name "RegisterUser"
    description "Creates a new user with email and password"

    input_field :email, !types.String
    input_field :password, !types.String
    input_field :first_name, types.String
    input_field :last_name, types.String
    input_field :birth_date, types.String
    input_field :height_cm, types.Int
    input_field :weight_kg, types.Int

    return_field :user, UserType

    resolve lambda { |inputs, _ctx|
      user = User.create!(inputs.to_h)

      { user: user }
    }
  end
end
