require "rails_helper"

describe QueriesController, type: :controller do
  include JsonApiHelpers

  include_context "authenticated user"

  subject do
    post :create, params: { query: query_string }
  end

  let(:input) do
    "{"\
      "preset_wod_id: #{preset_wod_id},"\
      "date: \"2016-09-19\""\
    "}"
  end

  let(:query_string) do
    "mutation {"\
      "CreateWodFromPreset(input: #{input}) "\
      "{ wod { id preset_wod { id title } }"\
      "}"\
    "}"
  end

  context "when wod exists" do
    let!(:other_wod) { FactoryGirl.create(:wod) }
    let(:preset_wod_id) { other_wod.id }

    context "but is not a preset" do
      it "does not create a WOD" do
        aggregate_failures do
          expect { subject }.not_to change { Wod.count }
          expect(response.status).to eq(200)
          expect(json[:data][:CreateWodFromPreset]).to eq(nil)
          expect(json[:errors].first[:message]).to eq(
            "Couldn't find Wod"
          )
        end
      end
    end

    context "and is a preset" do
      let(:preset_wod) { Wod.find_by(preset: true) }
      let(:preset_wod_id) { preset_wod.id }
      let(:created_wod) { Wod.last }

      it "creates a new WOD as a dup of the preset" do
        aggregate_failures do
          expect { subject }.to change { Wod.count }.by(1)
          expect(response.status).to eq(200)
          expect(created_wod.title).to eq(preset_wod.title)
          expect(created_wod.date).to eq(Date.parse("2016-09-19"))
          expect(created_wod.preset_wod_id).to eq(preset_wod_id)
          expect(created_wod.author_id).to eq(user.id)
          expect(created_wod.wod_items.count).to eq(preset_wod.wod_items.count)
        end
      end
    end
  end
end
