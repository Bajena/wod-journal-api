require "rails_helper"

describe QueriesController, type: :controller do
  include JsonApiHelpers

  include_context "authenticated user"

  subject do
    post :create, params: { query: query_string }
  end

  context "wod with items" do
    let(:query_string) do
      "mutation {"\
        "CreateWod(input: {"\
          "title: \"Murph\", "\
          "goal_type: \"amrap\", "\
          "date: \"2016-09-19\", "\
          "wod_items: ["\
            "{"\
              "movement_id: #{double_under.id},"\
              "reps: 10"\
            "},"\
            "{"\
              "movement_id: #{clean.id},"\
              "reps: 5,"\
              "men_weight_kg: 50,"\
              "women_weight_kg: 40"\
            "}"\
          "]}) {"\
          "wod { id }"\
        "}"\
      "}"
    end

    let(:wod) { Wod.last }
    let(:double_under) { Movement.find_by_name("Double Under") }
    let(:clean) { Movement.find_by_name("Clean") }

    it "creates a Wod" do
      expect { subject }.to change { Wod.count }.by(1)
      expect(response.status).to eq(200)
      expect(wod.title).to eq("Murph")
      expect(wod.goal_type).to eq("amrap")
      expect(wod.date).to eq(Date.new(2016, 9, 19))
    end

    it "creates wod items" do
      expect { subject }.to change { WodItem.count }.by(2)
      expect(wod.wod_items.first.movement).to eq(double_under)
      expect(wod.wod_items.first.reps).to eq(10)
      expect(wod.wod_items.second.movement).to eq(clean)
      expect(wod.wod_items.second.men_weight_kg).to eq(50)
      expect(wod.wod_items.second.women_weight_kg).to eq(40)
    end
  end

  context "when no wod items argument passed" do
    let(:query_string) do
      "mutation {"\
        "CreateWod(input: {"\
          "title: \"Murph\", "\
          "goal_type: \"amrap\", "\
          "date: \"2016-09-19\", "\
          "}) {"\
          "wod { id }"\
        "}"\
      "}"
    end

    it "does not create wod" do
      expect { subject }.not_to change { Wod.count }
      expect(response.status).to eq(200)
    end
  end

  context "when empty wod items argument passed" do
    let(:query_string) do
      "mutation {"\
        "CreateWod(input: {"\
          "title: \"Murph\", "\
          "goal_type: \"amrap\", "\
          "date: \"2016-09-19\", "\
          "wod_items: []"\
          "}) {"\
          "wod { id }"\
        "}"\
      "}"
    end

    it "does not create wod" do
      expect { subject }.not_to change { Wod.count }
      expect(response.status).to eq(200)
      expect(json[:data][:CreateWod]).to eq(nil)
      expect(json[:errors].first[:message]).to eq(
        "Validation failed: Wod items can't be blank"
      )
    end
  end
end
