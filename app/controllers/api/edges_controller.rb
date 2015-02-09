module Api
  class EdgesController < ApplicationController
    def index
      render json: Edge.all, root: false
    end

    def create
      rank = Requirement.create( mode: rank, value: params["rank"]["name"])
      
      edge = Edge.new
      edge.name = params["name"]
      edge.description = params["description"]
      edge.category_id = params["category"]["id"]
      edge.requirements = [ rank ]
      edge.save

      render json: edge, root: false
    end
  end
end