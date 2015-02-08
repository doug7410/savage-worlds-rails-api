require 'rails_helper'

describe Api::EdgesController do
  describe 'GET index' do
    it 'responds with 200 status' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'responds with json' do
      category = Fabricate(:category)
      requirement = Fabricate(:requirement)
      Fabricate(:edge, category: category, requirements: [requirement])

      get :index
      parsed = JSON.parse(response.body)
      expect(parsed[0]["category"]["name"]).to eq(category.name)
    end
  end
end