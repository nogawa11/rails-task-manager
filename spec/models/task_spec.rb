require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { Task.new(title: 'Task', details: 'Very long detailed description') }

  describe '#initialize' do
    context 'when valid' do
      it 'creates a valid task' do
        expect(task.valid?).to eq(true)
      end
    end

    context 'when invalid' do
      context 'without title' do
        before { task.title = nil }
        it 'generates an invalid task' do
          puts task.details
          expect(task.valid?).to eq(false)
        end

        it 'generates an error message' do
          task.valid?
          expect(task.errors.messages).to eq({ title: ["can't be blank"] })
        end
      end
    end

    context "details too long" do
      before { task.details = (0..55).to_a.join("") }
      it 'details too long' do
        expect(task.details.length).to be > 50
        expect(task.valid?).to eq(false)
        expect(task.errors.messages).to eq({ details: ["is too long (maximum is 50 characters)"]})
      end
    end

    context "details too short" do
      before { task.details = "1234" }
      it 'details too short' do
        expect(task.details.length).to be < 5
        expect(task.valid?).to eq(false)
        expect(task.errors.messages).to eq({ details: ["is too short (minimum is 5 characters)"]})
      end
    end
  end

  describe '#truncated_details' do
    it 'returns truncated details' do
      expect(task.truncated_details).to eq('Very long detail...')
    end
  end
end
