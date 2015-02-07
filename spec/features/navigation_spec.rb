require 'rails_helper'

describe "Navigation Menu", js: true do
  it "changes active menu elemtn depending on route" do
    visit '/'
    
    text = find('.active').find('a').text
    expect(text).to eq('Home')

    click_link('Edges')
    text = find('.active').find('a').text
    expect(text).to eq('Edges')
  end
end