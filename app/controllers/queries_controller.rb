class QueriesController < ApplicationController
  def create
    result = GraphQL::Query.new(
      GraphSchema,
      params[:query],
      variables: params[:variables] || {},
      context: {
        current_user: current_user
      }
    ).result
    render json: result
  end

  private

  def current_user
    User.first
  end
end
