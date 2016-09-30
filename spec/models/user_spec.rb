require "rails_helper"

describe User do
  describe "email validations" do
    subject { FactoryGirl.build(:user, email: email) }

    context "presence" do
      context "when blank" do
        let(:email) { "" }

        it "is invalid" do
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(:email)
        end
      end
    end

    context "structure" do
      context "when invalid" do
        let(:email) { "ddaada@email" }

        it "is invalid" do
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(:email)
        end
      end

      context "when valid" do
        let(:email) { "ddaada@email.com" }

        it "is valid" do
          expect(subject).to be_valid
        end
      end
    end
  end

  describe "password validations" do
    subject { FactoryGirl.build(:user, password: password) }
    context "length" do
      context "when less than 6 characters" do
        let(:password) { "12345" }
        it "is invalid" do
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(:password)
        end
      end

      context "when 6 characters" do
        let(:password) { "123456" }
        it "is valid" do
          expect(subject).to be_valid
        end
      end

      context "when nil" do
        let(:password) { nil }
        it "is invalid" do
          expect(subject).not_to be_valid
          expect(subject.errors).to have_key(:password)
        end
      end
    end
  end
end
