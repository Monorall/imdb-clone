require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid email and password' do
      it 'creates a session and redirects to the user page' do
        post :create, params: { email_or_username: user.email, password: user.password }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(user)
        expect(flash[:notice]).to eq("Welcome back, #{user.name}!")
      end
    end

    context 'with valid username and password' do
      it 'creates a session and redirects to the user page' do
        post :create, params: { email_or_username: user.name, password: user.password }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(user)
        expect(flash[:notice]).to eq("Welcome back, #{user.name}!")
      end
    end

    context 'with invalid email or username and password' do
      it 'renders new template and sets flash alert' do
        post :create, params: { email_or_username: 'invalid', password: 'invalid' }
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq("Invalid email/password combination!")
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in user
      delete :destroy
    end

    it 'destroys the session and redirects to movies_url' do
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(movies_url)
      expect(flash[:notice]).to eq("You're now signed out!")
    end
  end
end
