require "rails_helper"

describe QueriesController, type: :controller do
  include JsonApiHelpers

  include_context "authenticated user"

  subject do
    post :create, params: { query: query_string }
  end
  let(:wod) { FactoryGirl.create(:wod) }
  let(:wod_id) { wod.id }

  let(:input) do
    "{"\
      "wod_id: #{wod_id},"\
      "reps: 10,"\
      "scaled: false,"\
      "done: true"\
    "}"
  end

  let(:query_string) do
    "mutation {"\
      "AddWodResult(input: #{input}) "\
      "{ wod_result { id } }"\
    "}"
  end

  context "when wod does not exist" do
    let(:wod_id) { 0 }

    it "does not create a WOD result" do
      aggregate_failures do
        expect { subject }.not_to change { WodResult.count }
        expect(response.status).to eq(200)
        expect(json[:data][:AddWodResult]).to eq(nil)
        expect(json[:errors].first[:message]).to eq(
          "Validation failed: Wod can't be blank"
        )
      end
    end
  end

  context "when wod exists" do
    let(:created_result) { WodResult.last }

    it "creates a new WOD result" do
      aggregate_failures do
        expect { subject }.to change { WodResult.count }.by(1)
        expect(response.status).to eq(200)
        expect(created_result.wod).to eq(wod)
        expect(created_result.reps).to eq(10)
        expect(created_result.time_seconds).to eq(nil)
        expect(created_result.scaled).to eq(false)
        expect(created_result.done).to eq(true)
        expect(created_result.user).to eq(user)
      end
    end
  end
end
