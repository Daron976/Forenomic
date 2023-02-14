require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  describe 'GET categories path' do
    subject { User.new(name: 'Tom', email: 'tom@mail.com', password: 'password') }

    before { subject.save }

    before(:each) do
      get categories_path
    end

    it 'should redirect to sign_up' do
      Group.create(name: 'Category', author_id: subject.id)

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
