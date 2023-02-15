require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { User.new(name: 'Tom', email: 'tom@mail.com', password: 'password') }

  before { subject.save }

  it 'Group name should exist' do
    new_group = Group.create(name: 'testCat', author_id: subject.id)

    name = new_group.name

    expect(name).to eq('testCat')
  end

  it 'Group name should not be blank' do
    new_group = Group.create(name: 'testCat', author_id: subject.id)

    new_group.name

    expect(new_group).to be_valid
  end
end
