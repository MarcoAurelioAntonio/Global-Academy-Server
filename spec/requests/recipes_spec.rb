require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  let(:user) do
    User.create!(
      name: 'Tom',
      email: 'test@mail.com',
      password: '123456'
    )
  end
  let(:recipe) do
    Recipe.create!(
      name: 'icecream',
      preparation_time: 3,
      cooking_time: 4,
      description: 'ice cream made easy',
      public: true,
      user_id: user.id
    )
  end
  describe 'GET /index' do
    before(:each) do
      get recipes_path(user_id: user.id)
      recipe.save
    end

    it 'renders index template' do
      get '/recipes'
      expect(response).to render_template(:index)
    end
    it 'renders a successful response' do
      get '/recipes'
      expect(response).to be_successful
    end

    it 'Test if /recipes is loading correctly the body' do
      get '/recipes'

      expect(response.body).to include('Recipes')
      expect(response.body).to include('New recipe')
      expect(response.body).to include('icecream')
    end

    it 'Test if /recipes has the right recipe created' do
      get '/recipes'
      expect(response.body).to include('ice cream made easy')
      expect(response.body).to include('icecream')
    end
  end

  describe 'GET /show' do
    let(:food1) do
      Food.create(name: 'Apple', measurement_unit: 'kg', price: 2.5, user_id: user)
    end
    let(:food2) do
      Food.create(name: 'Flour', measurement_unit: 'kg', price: 1.2, user_id: user)
    end
    let(:food3) do
      Food.create(name: 'Egg', measurement_unit: 'units', price: 0.8, user_id: user)
    end
    let(:r_foods1) { RecipeFood.create(quantity: 1, recipe_id: recipe.id, food_id: food1.id) }
    let(:r_foods2) { RecipeFood.create(quantity: 2, recipe_id: recipe.id, food_id: food2.id) }
    let(:r_foods3) { RecipeFood.create(quantity: 3, recipe_id: recipe.id, food_id: food3.id) }
    before(:each) do
      get recipe_path(id: recipe.id)
      recipe.save
    end
    it 'renders show template' do
      expect(response).to render_template(:show)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'Test if is loading correctly the body' do
      expect(response.body).to include('icecream')
      expect(response.body).to include('Public')
    end
  end
end
