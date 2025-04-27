RSpec.describe "Register endpoint", type: :request do
  after do
    Foobara::Persistence.reset_all
    Foobara::Persistence.default_crud_driver = Foobara::Persistence::CrudDrivers::InMemory.new
  end

  describe "POST /run/Register" do
    let(:valid_params) do
      {
        username:,
        email:,
        plaintext_password:
      }
    end
    let(:username) { "testuser" }
    let(:email) { "some@email.com" }
    let(:plaintext_password) { "password123" }

    it "returns a successful response with user attributes" do
      post "/run/Register", params: valid_params.to_json, headers: { "Content-Type": "application/json" }

      expect(response).to have_http_status(:success)
      user_attributes = JSON.parse(response.body)
      expect(user_attributes.keys).to include("id")
      expect(user_attributes.keys.grep(/pass/)).to be_empty
    end
  end
end
