class QueriesController < ApplicationController
  before_action :doorkeeper_authorize!

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
end
