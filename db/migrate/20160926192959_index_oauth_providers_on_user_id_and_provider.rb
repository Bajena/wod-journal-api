class IndexOauthProvidersOnUserIdAndProvider < ActiveRecord::Migration[5.0]
  def change
    add_index :oauth_providers, :provider
  end
end
