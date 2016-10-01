RSpec.shared_context "authenticated user" do
  let!(:user) { FactoryGirl.create(:user) }

  let(:token) do
    double(
      Doorkeeper::AccessToken, acceptable?: true, resource_owner_id: user.id
    )
  end

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end
end
