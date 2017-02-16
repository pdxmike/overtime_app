require 'rails_helper'

describe 'Navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'Edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'has a status that can be edited on the form' do
      visit edit_post_path(@post)
      select('approved', :from => 'post_status')
      click_button('Save')

      expect(@post.reload.status).to eq('approved')
    end

    it 'cannot be edited by a non admin' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit edit_post_path(@post)

      expect(page).to_not have_content('approved')
    end

    it 'cannot be edited after it has been approved' do
      logout(:user)
      login_as(@admin_user, :scope => :user)

      @post.update(status: 'approved')
      logout(@admin_user)

      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit edit_post_path(@post)


      expect(current_path).to eq(root_path)
    end
  end
end
