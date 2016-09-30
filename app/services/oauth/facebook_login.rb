module Oauth
  class FacebookLogin
    def initialize(access_token)
      @access_token = access_token
    end

    def authenticate
      return unless user.persisted?

      find_or_create_provider
      user
    rescue Koala::Facebook::AuthenticationError
      nil
    end

    private

    attr_reader :access_token

    def user_data
      @user_data ||= Koala::Facebook::API.new(access_token).
                     get_object("me", fields: "email, first_name, last_name")
    end

    def user
      @user ||= find_user || create_user
    end

    def find_user
      User.find_by(email: user_data["email"])
    end

    def create_user
      User.create(
        email: user_data["email"],
        first_name: user_data["first_name"],
        last_name: user_data["last_name"],
        password: Devise.friendly_token[0, 20]
      )
    end

    def find_or_create_provider
      user.oauth_providers.
        find_or_create_by(provider: "facebook", uid: user_data["id"])
    end
  end
end
