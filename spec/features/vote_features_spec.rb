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
    clink_link 'Upvote'
    expect(page).to have_content('1 vote')
  end  


  it 'downvote' do 
    visit'/posts'
    clink_link 'Upvote'
    expect(page).to have_content('1 vote')
    clink_link 'Downvote'
    expect(page).to have_content('0 votes')
  end  

end  