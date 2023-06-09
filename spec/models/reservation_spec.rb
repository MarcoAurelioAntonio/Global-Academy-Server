require 'rails_helper'

RSpec.describe Reservation, type: :model do

  let(:user) { User.create(name: 'Nelson') }
  let(:course) { Course.create(name: 'Ruby', description: 'In this course we are going to learn something', price: 1000, course_type: 'programming', start_date: '2020-10-01', end_date: '2020-11-01') }
	
	subject { Reservation.new(user: user, course: course) }

  before { subject.save }

  it 'if resrvation is valid, expected true' do
		expect(subject).to be_valid
	end

	it 'if course_id is not valid, expected false' do
		subject.course_id = 5
    expect(subject).to_not be_valid
	end

	it 'if user_id is not valid, expected false' do
		subject.user_id = 5
		expect(subject).to_not be_valid
	end

end
