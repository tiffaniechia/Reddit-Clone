require 'spec_helper'

describe 'post index page' do
  context 'no posts' do
    it 'shows a message' do
      visit '/posts'
      expect(page).to have_content('No posts yet')
    end
  end


  context 'valid posts' do
    let!(:test) { create(:test)}
    before(:each) do
      create(:post, user: test)
      login_as create(:tester)
    end

    it 'displays comments' do
      visit '/posts'
      expect(page).to have_content('some comment')
    end

    it 'displays a new post' do
      visit '/posts'
      click_link('Add Post')
      fill_in 'Comment', with: 'some new comment'
      click_button('Create Post')
      expect(current_path).to eq('/posts')
      expect(page).to have_content('some new comment')
    end
  end
end