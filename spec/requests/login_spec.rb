RSpec.describe "Login endpoint", type: :request do
  after do
    Foobara::Persistence.reset_all
    Foobara::Persistence.default_crud_driver = Foobara::Persistence::CrudDrivers::InMemory.new
  end

  describe "POST /run/Login" do
    let(:username) { "testuser" }
    let(:plaintext_password) { "password123" }

    let(:user) do
      Foobara::Auth::Register.run!(username:, plaintext_password:)
    end

    let(:valid_params) do
      {
        username_or_email: username,
        plaintext_password:
      }
    end

    it "returns a successful response with the refresh token in the cookie headers" do
      expect(user.username).to eq(username)

      # TODO: why do we need these headers??
      post "/run/Login", params: valid_params.to_json, headers: { "Content-Type": "application/json" }

      expect(response).to have_http_status(:success)

      login_result = JSON.parse(response.body)

      expect(login_result).to eq({})

      expect(response.headers["Set-Cookie"]).to match(
        # It is samesite=none in all but prod without staging env flag on
        /refresh_token=[^;]+; path=\/run\/Foobara\/Auth\/; httponly; samesite=none/
      )
      expect(response.headers["X-Access-Token"]).to be_a(String)
    end
  end
end
