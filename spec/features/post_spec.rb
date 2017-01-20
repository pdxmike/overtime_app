require 'rails_helper'

describe 'Navigate' do
  before do
    user = User.create(email: 'test@test.com', password: 'testing', password_confirmation: 'testing', first_name: 'Jon', last_name: 'Snow')
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of Posts' do
      post1 = Post.create(date: Date.today, rationale: 'Post 1')
      post2 = Post.create(date: Date.today, rationale: 'Post 2')
      visit posts_path
      expect(page).to have_content(/Post 1|Post 2/)
    end
  end

  describe 'Creation' do
    before do
      visit new_post_path
    end

    it 'has a form that can be reached at posts/new' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some Rationale'
      click_on 'Save'

      expect(page).to have_content('Some Rationale')
    end

    it 'will have a user associated to it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User_Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User_Association')
    end
  end
end
