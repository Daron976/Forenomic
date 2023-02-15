require 'rails_helper'

RSpec.describe DealingsController, type: :request do
  describe 'GET transactions path' do
    subject { User.new(name: 'Tom', email: 'tom@mail.com', password: 'password') }

    before { subject.save }

    before(:each) do
      get category_dealings_path(subject.id)
    end

    it 'should redirect to sign_up' do
      Group.create(name: 'Category', author_id: subject.id)

      Dealing.create(name: 'transaction', amount: 15, author_id: subject.id)

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
