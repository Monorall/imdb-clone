require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie) }
  let(:rating) { FactoryBot.create(:rating, user: user, movie: movie) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid rating params' do
      it 'creates or updates a rating and redirects to the movie' do
        post :create, params: { movie_id: movie.id, rating: { stars: 4 } }
        expect(Rating.last.stars).to eq(4)
        expect(response).to redirect_to(movie)
      end
    end

    context 'with invalid rating params' do
      it 'does not create or update a rating' do
        expect {
          post :create, params: { movie_id: movie.id, rating: { stars: 6 } }
        }.not_to change(Rating, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid rating params' do
      it 'updates the rating and redirects back' do
        put :update, params: { id: rating.id, rating: { stars: 5 } }
        rating.reload
        expect(rating.stars).to eq(5)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid rating params' do
      it 'does not update the rating and renders the edit template' do
        put :update, params: { id: rating.id, rating: { stars: 6 } }
        expect(response).to render_template(:edit)
      end
    end
  end
end
