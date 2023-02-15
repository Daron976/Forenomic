require 'rails_helper'

RSpec.describe 'users tests', type: :system do
  describe 'users' do
    subject { User.new(name: 'Tom', email: 'tom@mail.com', password: 'password') }
    before { subject.save }
    before(:each) do
      @category = Group.create(name: 'Category', author_id: subject.id)
      @dealing = Dealing.create(name: 'transaction', amount: 15, author_id: subject.id)
      visit root_path
    end

    it 'shows app name' do
      expect(page).to have_content('Forenomic')
    end

    it 'shows login button' do
      expect(page).to have_content('Login')
    end

    it 'shows signup button' do
      expect(page).to have_content('Sign up')
    end

    it 'shows welcome message' do
      expect(page).to have_content('Lets us help')
    end
  end
end
