require 'rails_helper'
require 'date'

RSpec.describe PromisesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      sign_in
      get :index
      expect(response).to have_http_status(:success)
      sign_out
    end

    it 'renders the index page' do
      sign_in
      get :index
      expect(response).to render_template(:index)
      sign_out
    end
  end

  describe 'fetching promises' do
    it 'only fetch promises created by current user' do
      sign_in
      post :create, params: { promise: { text: 'test promise 1',
                                         end_datetime: '31/01/2019',
                                         interval: '1 day' } }
      sign_out

      sign_in
      post :create, params: { promise: { text: 'test promise 2',
                                         end_datetime: '31/01/2019',
                                         interval: '1 day' } }

      get :index
      expect(assigns(:promises).length).to eq(1)
      expect(assigns(:promises)[0].text).to eq('test promise 2')
      sign_out
    end
  end

  describe 'POST #create' do
    it "save a new entry to the 'promise' database" do
      sign_in
      dt = DateTime.new(2010,1,1)
      allow(DateTime).to receive(:now).and_return(dt)
      post :create, params: { promise: { text: 'test promise',
                                         end_datetime: '31/01/2019',
                                         interval: '1 day',
                                         punishment: 'test punishment' } }
      expect(Promise.find_by(text: 'test promise')).to be_truthy
      expect(Promise.find_by(punishment: 'test punishment')).to be_truthy

      sign_out
    end
  end
end
