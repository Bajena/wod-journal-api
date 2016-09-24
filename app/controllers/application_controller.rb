class ApplicationController < ActionController::API
  private

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: { name: error.name, message: error.description } } }
  end
end
