require 'rails_helper'

describe 'edges page', js: true do
  scenario 'see list of all edges' do
    3.times do
      Fabricate(:edge)
    end

    visit '/#/edges'
    expect(page).to have_css('ul#edges>li', count: 3)
  end

  scenario 'clicking on edge toggles the description' do
    Fabricate(:edge, description: 'desc1')
    visit '/#/edges'
    expect(page).not_to have_content('desc1')
    first('ul#edges>li').click
    expect(page).to have_content('desc1')
  end

  scenario 'only one description is actibe' do
    Fabricate(:edge, description: 'desc1')
    Fabricate(:edge, description: 'desc2')
    visit '/#/edges'

    expect(page).not_to have_content('desc1')
    first('ul#edges>li').click
    expect(page).to have_content('desc1')
    all('ul#edges>li')[2].click
    expect(page).not_to have_content('desc1')
    expect(page).to have_content('desc2')
  end

  scenario 'search for edge' do
    Fabricate(:edge, name: 'first', description: 'desc1')
    Fabricate(:edge, name: 'second', description: 'desc2')    
    visit '/#/edges'

    find(:xpath, '//input[@type="search"]').set('fi')
    expect(page).to have_css('ul#edges>li', count: 1)
  end

  scenario 'filtering by category' do
    cat1 = Fabricate(:category, name: 'Background')
    cat2 = Fabricate(:category, name: 'Combat')    
    
    3.times { Fabricate(:edge, category: cat1) }
    2.times { Fabricate(:edge, category: cat2) }
    visit '/#/edges'

    find(:xpath, '//option[contains(text(), "Background")]', 'Background').select_option
    expect(page).to have_css('ul#edges>li', count: 3)
    find(:xpath, '//option[contains(text(), "Combat")]', 'Combat').select_option
    expect(page).to have_css('ul#edges>li', count: 2)
  end

  scenario 'filtering by rank' do
    2.times { Fabricate(:edge) }
    edge = Fabricate(:edge)
    rank = Fabricate(:requirement, mode: 'rank', name: nil, value: 'Novice', edge: edge)
    save_and_open_page
    visit '/#/edges'

    find(:xpath, '//option[contains(text(), "Novice")]', 'Novice').select_option #TODO fix this
    expect(page).to have_css('ul#edges>li', count: 1)
  end 
end