require 'rails_helper'

describe 'Navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'has a status that can be edited on the form' do
      visit edit_admin_post_path(@post)
      select('approved', :from => 'post_status')
      click_button('Update Post')

      expect(@post.reload.status).to eq('approved')
    end
  end
end
