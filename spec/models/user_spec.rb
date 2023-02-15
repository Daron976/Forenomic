require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', email: 'tom@mail.com', password: 'password') }

  before { subject.save }

  it 'Name should be tom' do
    name = subject.name

    expect(name).to eq('Tom')
  end

  it 'Name should not be blank' do
    subject.name

    expect(subject).to be_valid
  end
end
