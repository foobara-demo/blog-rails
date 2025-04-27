RSpec.describe "foobara manifest endpoint", type: :request do
  it "is a 200" do
    get "/manifest", headers: { "Content-Type": "application/json" }

    expect(response.status).to eq(200)
  end
end
