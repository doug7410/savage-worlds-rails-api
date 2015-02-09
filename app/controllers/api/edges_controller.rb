module Api
  class EdgesController < ApplicationController
    before_filter :authenticate_user_from_token!
    def index
      render json: Edge.all, root: false
    end
  end
end