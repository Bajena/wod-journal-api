Doorkeeper.configure do
  orm :active_record

  resource_owner_from_credentials do |_routes|
    User.find_by(email: params[:email])
  end

  grant_flows %w(password)
end
