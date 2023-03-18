require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }

  context 'when user is not signed in' do
    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to be_successful
      end
    end

    describe 'POST #create' do
      it 'creates a new user and redirects to the user page' do
        expect {
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(assigns(:user))
        expect(flash[:notice]).to eq("Thanks for signing up!")
      end

      it 'renders new template when user is invalid' do
        expect {
          post :create, params: { user: FactoryBot.attributes_for(:user, name: nil) }
        }.not_to change(User, :count)
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  context 'when user is signed in' do
    before do
      sign_in user
    end

    describe 'GET #index' do
      it 'returns a success response' do
        get :index
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: user.id }
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do
      it 'returns a success response when user is correct' do
        get :edit, params: { id: user.id }
        expect(response).to be_successful
      end

      it 'redirects to root_url when user is incorrect' do
        get :edit, params: { id: other_user.id }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'PUT #update' do
      it 'updates the user and redirects to the user page when user is correct' do
        put :update, params: { id:user.id, user: { name: 'New Name', email: 'new@example.com', password: 'new_password', password_confirmation: 'new_password' } }
        user.reload
        expect(user.name).to eq('New Name')
        expect(user.email).to eq('new@example.com')
        expect(response).to redirect_to(user)
        expect(flash[:notice]).to eq("Account successfully updated!")
      end

      it 'renders edit template when update is invalid' do
        put :update, params: { id: user.id, user: { name: '', email: 'new@example.com', password: 'new_password', password_confirmation: 'new_password' } }
        expect(response).to render_template(:edit)
        expect(response.status).to eq(422)
      end

      it 'redirects to root_url when user is incorrect' do
        put :update, params: { id: other_user.id, user: { name: 'New Name', email: 'new@example.com', password: 'new_password', password_confirmation: 'new_password' } }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the user and redirects to movies_url when user is correct' do
        sign_in user
        expect {
          delete :destroy, params: { id: user.id }
        }.to change(User, :count).by(-1)
        expect(response).to redirect_to(movies_url)
        expect(flash[:alert]).to eq("Account successfully deleted!")
      end

      it 'does not delete the user and redirects to root_url when user is incorrect' do
        sign_in other_user
        expect {
          delete :destroy, params: { id: user.id }
        }.not_to change(User, :count)
        expect(response).to redirect_to(root_url)
      end
    end
  end
end

