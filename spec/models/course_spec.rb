require 'rails_helper'

RSpec.describe Course, type: :model do
   let(:course) { Course.new(name: 'Ruby', description: 'In this course we are going to learn something', price: 1000, course_type: 'programming', start_date: '2020-10-01', end_date: '2020-11-01') }
   subject { course }
    
   before { subject.save }

    it 'if course is valid, expected true' do
        expect(subject).to be_valid
    end

    it 'if name is not valid, expected false' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'if description is not valid, expected false' do
        subject.description = nil
        expect(subject).to_not be_valid
    end

    it 'the description length should be greater than 30 characters' do
        subject.description = 'The description must be 30 characters The description must be 30 characters'
        expect(subject).to be_valid
    end

    it 'the description length should be greater than 30 characters' do
        subject.description = 'The is not 30 char'
        expect(subject).to_not be_valid
    end

end