class QueriesController < ApplicationController
  def new
  end

  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    result = GraphQL::Query.new(
      GraphSchema,
      query_string,
      variables: query_variables,
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
