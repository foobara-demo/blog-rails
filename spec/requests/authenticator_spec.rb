RSpec.describe "An endpoint requiring authentication", type: :request do
  after do
    Foobara::Persistence.reset_all
    Foobara::Persistence.default_crud_driver = Foobara::Persistence::CrudDrivers::InMemory.new
  end

  context "when a user exists" do
    let(:username) { "testuser" }
    let(:plaintext_password) { "password123" }

    let(:user) do
      Foobara::Auth::Register.run!(username:, plaintext_password:)
    end
    let(:access_token) { nil }

    context "when not authenticated" do
      it "is a 401" do
        post "/run/ComputeExponent", params: { base: 2, exponent: 3 }.to_json, headers: {
          "Content-Type": "application/json"
        }

        expect(response.status).to eq(401)
      end
    end

    context "when authenticated" do
      let(:access_token) do
        user
        Foobara::Auth::Login.run!(username: "testuser", plaintext_password: "password123")[:access_token]
      end

      it "is a 200" do
        post "/run/ComputeExponent", params: { base: 2, exponent: 3 }.to_json, headers: {
          "Content-Type": "application/json", Authorization: "Bearer #{access_token}"
        }

        expect(response.status).to eq(200)
      end
    end
  end
end
