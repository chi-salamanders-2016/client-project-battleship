require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:user) { User.create!(username: 'tester', email: 'test@test.com', password: "password1234") }
	describe "GET users#new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe "GET users#show" do
  	it "responds with status code 200" do
  		get :show, {id: user.id}
    	expect(response).to have_http_status 200
  	end
  end

  describe "POST users#create" do
  	it "responds with status code of 302" do
  		post :create, {user: {username: 'tester', email: 'test@test.com', password: 'password1234'} }
  		expect(response).to have_http_status 302
  	end
  end
end

