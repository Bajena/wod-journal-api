require "rails_helper"

describe QueriesController, type: :controller do
  include JsonApiHelpers

  subject do
    post :create, params: { query: query_string }
  end

  let(:input) do
    "{"\
      "email: \"#{email_input}\","\
      "password: \"amrap1\","\
      "first_name: \"Rich\","\
      "last_name: \"Froning\","\
      "height_cm: 180,"\
      "weight_kg: 90,"\
      "birth_date: \"2016-09-19\""\
    "}"
  end
  let(:query_string) do
    "mutation {"\
      "RegisterUser(input: #{input}) { user { id email }"\
      "}"\
    "}"
  end

  context "valid params" do
    let(:user) { User.last }
    let(:email_input) { "email@email.com" }

    it "creates a User" do
      aggregate_failures do
        expect { subject }.to change { User.count }.by(1)
        expect(response.status).to eq(200)
        expect(user.email).to eq("email@email.com")
        expect(user.first_name).to eq("Rich")
        expect(user.last_name).to eq("Froning")
        expect(user.height_cm).to eq(180)
        expect(user.weight_kg).to eq(90)
        expect(user.birth_date).to eq(Date.parse("2016-09-19"))
      end
    end
  end

  context "invalid params" do
    let(:email_input) { "email@email" }
    it "does not create a User" do
      aggregate_failures do
        expect { subject }.not_to change { User.count }
        expect(response.status).to eq(200)
        expect(json[:data][:RegisterUser]).to eq(nil)
        expect(json[:errors].first[:message]).to eq(
          "Validation failed: Email is invalid"
        )
      end
    end
  end
end
