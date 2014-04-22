require 'spec_helper'

describe ' votes ' do 

before(:each) do
  create(:post)
end

  it 'initial' do 
    visit'/posts'
    expect(page).to have_content('0 votes')
  end  


  it 'upvote' do 
    visit'/posts'
    click_button 'Upvote'
    expect(page).to have_content('1 vote')
  end  


  it 'downvote' do 
    visit'/posts'
    click_button'Upvote'
    expect(page).to have_content('1 vote')
    click_button 'Downvote'
    expect(page).to have_content('0 votes')
  end  

  it 'only displays votes from the last week' do
    visit '/posts'
    click_button 'Upvote'
    Timecop.freeze(Date.today + 8) do
      visit '/posts'
      expect(page).to have_content('0 votes')
    end 
  end

end  