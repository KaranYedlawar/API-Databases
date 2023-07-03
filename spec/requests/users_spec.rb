require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns all users" do
      name1 = User.create(name: "praran", age: 25)
      name2 = User.create(name: "vikran", age: 25)
      get "/getdetails"
      expect(response).to have_http_status(:ok)
    end

    it "returns no users" do
      get "/getdetails"
      expect(response).to have_http_status(:not_found)
    end 
  end

  describe "GET /show" do
    it "returns user with ID" do
      name1 = User.create(name: "praran", age: 25)
      name2 = User.create(name: "vikran", age: 25)
      get "/showuser/1"
      expect(response).to have_http_status(:ok)
    end

    it "returns no users" do
      get "/showuser/8"
      expect(response).to have_http_status(:not_found)
    end 
  end


  describe "POST /create" do
    it "returns user created successfully" do
      post "/createuser", params: { user: { name: "John", age: 5 } }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /update" do
    it "returns user updated successfully" do
      name1 = User.create(name: "praran", age: 25)
      put "/updateuser/1", params: { user: { name: "John", age: 5 } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /destroy" do
    it "returns user deleted successfully" do
      name1 = User.create(name: "praran", age: 25)
      delete "/deleteuser/1"
      expect(response).to have_http_status(:ok)
    end

    it "returns user unable to delete" do
      name1 = User.create(name: "praran", age: 25)
      delete "/deleteuser/15"
      expect(response).to have_http_status(:not_found)
    end
  end
end

