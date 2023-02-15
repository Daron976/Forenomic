require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET user path' do
    subject { User.new(name: 'Tom', email: 'tom@mail.com', password: 'password') }

    before { subject.save }

    before(:each) do
      get users_path
    end

    it 'should respond with correct status' do
      status = response.status

      expect(status).to eq(200)
    end

    it 'renders correct template' do
      template = 'users/index'

      expect(response).to render_template(template)
    end
  end
end
