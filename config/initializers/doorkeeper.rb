Doorkeeper.configure do
  orm :active_record

  resource_owner_from_credentials do |_routes|
    user = User.find_by(email: params[:email])
    user if user && user.valid_password?(params[:password])
  end

  resource_owner_from_assertion do
    Oauth::FacebookLogin.new(params[:assertion]).authenticate
  end

  grant_flows %w(password assertion)
end
