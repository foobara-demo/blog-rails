Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV.fetch("CORS_ORIGIN", "http://localhost:3001")
    resource "*",
             headers: :any,
             expose: ["X-Access-Token"],
             methods: [:get, :post, :put, :patch, :delete, :options],
             credentials: true
  end
end
