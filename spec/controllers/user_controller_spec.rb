require 'rails_helper'

describe UsersController, type: :controller do
  # let(:user1) { User.create!(first_name: 'Todd', last_name: 'Toddson', email: 'todd@todd.com', password: 'toddtodd') }
  # let(:user2) { User.create!(first_name: 'Bob', last_name: 'Bobson', email: 'bob@bob.com', password: 'bobbob') }
  before do
   @user = FactoryBot.create(:user)
   @admin = FactoryBot.create(:admin)
  end


  describe 'Get #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user
      end
      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq (@user)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
         get :show, params: { id: @user.id }
         expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user attempts to see show of another user' do
      before do
        sign_in @user
      end
      it 'redirects to user path' do
         get :show, params: { id: @admin.id }
         expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

end
