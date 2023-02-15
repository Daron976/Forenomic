require 'rails_helper'

RSpec.describe Dealing, type: :model do
  subject { User.new(name: 'Tom', email: 'tom@mail.com', password: 'password') }

  before { subject.save }

  it 'Dealing name should exist' do
    new_dealing = Dealing.create(name: 'testdeal', author_id: subject.id, amount: 15)

    name = new_dealing.name

    expect(name).to eq('testdeal')
  end

  it 'Dealing name should not be blank' do
    new_dealing = Dealing.create(name: 'testdeal', author_id: subject.id, amount: 15)

    new_dealing.name

    expect(new_dealing).to be_valid
  end

  it 'Dealing amount should not be blank' do
    new_dealing = Dealing.create(name: 'testdeal', author_id: subject.id, amount: 15)

    new_dealing.amount

    expect(new_dealing).to be_valid
  end
end
