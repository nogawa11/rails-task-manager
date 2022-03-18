require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe '#create' do
    it 'creates a new task' do
      post :create, params: { task: { title: 'Task1', details: 'Long Details' } }
      expect(Task.find_by(title: 'Task1').details).to eq('Long Details')
    end
  end
end
