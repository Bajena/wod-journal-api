require "rails_helper"

describe Wod do
  let(:author) { FactoryGirl.create(:user) }

  describe "goal_type validations" do
    subject { FactoryGirl.build(:wod, author: author) }

    it "is required" do
      subject.goal_type = ""
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:goal_type)
    end
  end
end
