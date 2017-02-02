require 'rails_helper'

describe 'Navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
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
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Some|super/)
    end
  end

  describe 'New' do
    it 'has a link from the homepage' do
      visit root_path
      click_link('new_post_from_nav')

      expect(page.status_code).to eq(200)
    end
  end

  describe 'Delete' do
    it 'can be delete' do
      @post = FactoryGirl.create(:post)
      visit posts_path
      click_link("delete_post_#{@post.id}_from_index")

      expect(page.status_code).to eq(200)
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

  describe 'Edit' do
    before do
      @edit_user = User.create(first_name: 'Test', last_name: 'User', email: 'testuser@test.com', password: 'testing', password_confirmation: 'testing')
      login_as(@edit_user, :scope => :user)
      @edit_post = Post.create(date: Date.today, rationale: 'pootahtoez', user_id: @edit_user.id)
    end

    it 'can be edited' do
      visit edit_post_path(@edit_post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited Content'
      click_on 'Save'

      expect(page).to have_content('Edited Content')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)
      visit edit_post_path(@edit_post)

      expect(current_path).to eq(root_path)
    end
  end
end
