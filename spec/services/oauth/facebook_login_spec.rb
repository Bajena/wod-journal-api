require "rails_helper"

describe Oauth::FacebookLogin do
  subject do
    described_class.new(fb_token)
  end

  let :fb_token do
    "token"
  end
  let(:client) { instance_double(Koala::Facebook::API) }

  context "when token is not a valid fb token" do
    let(:error) { Koala::Facebook::AuthenticationError.new(401, "") }

    before do
      expect(Koala::Facebook::API).to receive(:new).with(fb_token) { client }
      expect(client).to receive(:get_object).with(
        "me",
        fields: "email, first_name, last_name"
      ).and_raise(error)
    end

    it "returns nil" do
      expect(subject.authenticate).to be_nil
    end

    it "does not create neither user nor probider" do
      expect do
        expect do
          subject.authenticate
        end.not_to change { User.count }
      end.not_to change { OauthProvider.count }
    end
  end

  context "when fb data does not include email" do
    let(:user_data) do
      {
        "id" => "1234",
        "first_name" => "Rich",
        "last_name" => "Froning"
      }
    end

    before do
      expect(Koala::Facebook::API).to receive(:new).with(fb_token) { client }
      expect(client).to receive(:get_object).with(
        "me",
        fields: "email, first_name, last_name"
      ) { user_data }
    end

    it "returns nil" do
      expect(subject.authenticate).to be_nil
    end

    it "does not create neither user nor probider" do
      expect do
        expect do
          subject.authenticate
        end.not_to change { User.count }
      end.not_to change { OauthProvider.count }
    end
  end

  context "when user with fetched email does not exist" do
    let(:user_data) do
      {
        "id" => "1234",
        "first_name" => "Rich",
        "last_name" => "Froning",
        "email" => "rich.froning@wod.com"
      }
    end
    let(:created_user) { User.last }
    let(:created_provider) { OauthProvider.last }
    before do
      expect(Koala::Facebook::API).to receive(:new).with(fb_token) { client }
      expect(client).to receive(:get_object).with(
        "me",
        fields: "email, first_name, last_name"
      ) { user_data }
    end

    it "creates the new user with fb data" do
      expect { subject.authenticate }.to change { User.count }.by(1)
      expect(created_user.email).to eq(user_data["email"])
      expect(created_user.first_name).to eq(user_data["first_name"])
      expect(created_user.last_name).to eq(user_data["last_name"])
    end

    it "creates new oauth provider instance for new user" do
      expect { subject.authenticate }.to change { OauthProvider.count }.by(1)
      expect(created_provider.user_id).to eq(created_user.id)
      expect(created_provider.uid).to eq(user_data["id"])
      expect(created_provider.provider).to eq("facebook")
    end
  end

  context "when user with fetched email exists" do
    let(:user_data) do
      {
        "id" => "1234",
        "first_name" => "Rich",
        "last_name" => "Froning",
        "email" => "rich.froning@wod.com"
      }
    end

    let!(:other_provider) do
      FactoryGirl.create(
        :oauth_provider,
        user: user,
        uid: "bad",
        provider: "facebook"
      )
    end
    let!(:user) { FactoryGirl.create(:user, email: "rich.froning@wod.com") }

    before do
      expect(Koala::Facebook::API).to receive(:new).with(fb_token) { client }
      expect(client).to receive(:get_object).with(
        "me",
        fields: "email, first_name, last_name"
      ) { user_data }
    end

    it "does not create a new user" do
      expect { subject.authenticate }.not_to change { User.count }
    end

    context "and OauthProvider for the user already exists" do
      let!(:oauth_provider) do
        FactoryGirl.create(
          :oauth_provider,
          user: user,
          uid: "1234",
          provider: "facebook"
        )
      end

      it "does not create a new one" do
        expect { subject.authenticate }.not_to change { OauthProvider.count }
      end
    end

    context "and OauthProvider for the user does not exist" do
      let(:created_provider) { OauthProvider.last }

      it "creates new oauth provider instance for new user" do
        expect { subject.authenticate }.to change { OauthProvider.count }.by(1)
        expect(created_provider.user_id).to eq(user.id)
        expect(created_provider.uid).to eq(user_data["id"])
        expect(created_provider.provider).to eq("facebook")
      end
    end
  end
end
