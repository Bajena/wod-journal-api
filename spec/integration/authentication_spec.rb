require "rails_helper"

describe QueriesController, type: :controller do
  include JsonApiHelpers

  let(:application) { FactoryGirl.create(:doorkeeper_application) }
  let(:token) do
    FactoryGirl.create(
      :doorkeeper_token,
      application: application,
      resource_owner_id: user.id
    )
  end
  let!(:user) { FactoryGirl.create(:user) }
  let(:params) do
    { query: query_string, access_token: token.token }
  end

  subject do
    post :create, params: params
  end

  let(:query_string) do
    "{"\
      "movements {"\
        "edges { node { id name } }"\
      "}"\
    "}"
  end

  context "when valid token passed" do
    it "triggers the query" do
      subject
      expect(response.status).to eq(200)
    end
  end

  context "when invalid token passed" do
    let(:params) { super().merge(access_token: "invalid") }
    it "responds with 401 and error message" do
      subject
      expect(response.status).to eq(401)
      expect(json[:error][:name]).to eq("invalid_token")
      expect(json[:error][:message]).to eq("The access token is invalid")
    end
  end
end
