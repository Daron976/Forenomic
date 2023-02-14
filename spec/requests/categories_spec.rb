require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  describe 'GET categories path' do
    let(:name) { Faker::Internet.name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password(min_length: 6) }
  
    before do
      get new_user_registration_path
    end
  
    it "with valid data" do
      fill_in "user_name", with: name
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      # check "terms_agreement"
      click_button "Sign up"
  
      # expect(page).to have_content("You have signed up successfully.")
      expect(page).to have_text "Welcome back"
    end

    # it 'should redirect to sign_up page' do
    #   status = response.status

    #   expect(status).to eq(302)
    # end

    # it 'renders correct template' do
    #   template = 'categories/index'

    #   expect(response).to render_template(template)
    # end

    # it 'renders correct template' do
    #   @post = Post.create(author_id: subject.id, Title: 'dummy post',
    #                       Text: 'This is a test for the latest_posts method')
    #   get "/users/#{subject.id}/posts/#{@post.id}"

    #   template = 'posts/show'

    #   expect(response).to render_template(template)
    # end
  end
end
