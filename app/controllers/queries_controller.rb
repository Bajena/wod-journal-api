class QueriesController < ApplicationController
  before_action :doorkeeper_authorize!, unless: :unauthenticated?

  UNAUTHENTICATED_QUERIES = [
    UserMutations::RegisterUser.name
  ].freeze

  def create
    result = GraphQL::Query.new(
      GraphSchema,
      params[:query],
      variables: params[:variables] || {},
      context: context
    ).result
    render json: result
  end

  private

  def unauthenticated?
    query = params[:query].to_s
    return false if query.blank?

    UNAUTHENTICATED_QUERIES.any? { |name| query.include?(name) }
  end

  def context
    unauthenticated? ? {} : { current_user: current_user }
  end
end
