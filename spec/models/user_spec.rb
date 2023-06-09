require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Kender') }

  before { subject.save }

  it 'name should be present, expected false' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be present, expected true' do
    expect(subject).to be_valid
  end

  it 'name should be present, expected true' do
    new_user1 = User.create(name: 'Kender')
    new_user2 = User.new(name: 'Kender')
    expect(new_user2).to be_invalid
    expect(new_user2.errors[:name]).to include('has already been taken')
  end
  it 'name should be present, expected true' do
    new_user1 = User.create(name: 'Kender')
    new_user2 = User.new(name: 'Nelson')
    expect(new_user2).to be_valid
  end
end
