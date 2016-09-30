Doorkeeper.configure do
  orm :active_record

  resource_owner_from_credentials do |_routes|
    User.find_by(email: params[:email]).try(:authenticate, params[:password])
  end

  resource_owner_from_assertion do
    Oauth::FacebookLogin.new(params[:assertion]).authenticate
  end

  grant_flows %w(password assertion)
end
