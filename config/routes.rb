require "foobara/rails_command_connector"
require "foobara/auth_http"

Foobara::CommandConnectors::RailsCommandConnector.new(authenticator: Foobara::AuthHttp::BearerAuthenticator)
require "foobara/rails/routes"

login_response_mutators = [
  Foobara::AuthHttp::MoveRefreshTokenToCookie.new(
    secure: Rails.env.production? && ENV["FOOBARA_STAGING_ENV"] != "true",
    same_site: Rails.env.production? && ENV["FOOBARA_STAGING_ENV"] != "true" ? :strict : :none
  ),
  Foobara::AuthHttp::MoveAccessTokenToHeader
]
set_user_to_current_user = Foobara::CommandConnectors::Http::SetInputToProcResult.for(:user) do
  authenticated_user
end

Rails.application.routes.draw do
  command Foobara::Auth::Register,
          inputs_transformers: Foobara::AttributesTransformers.only(:username, :email, :plaintext_password)

  command Foobara::Auth::Login,
          inputs_transformers: Foobara::AttributesTransformers.only(:username_or_email, :plaintext_password),
          response_mutators: login_response_mutators

  command Foobara::Auth::RefreshLogin,
          request_mutators: Foobara::AuthHttp::SetRefreshTokenFromCookie,
          inputs_transformers: Foobara::AttributesTransformers.only(:refresh_token),
          response_mutators: login_response_mutators

  command Foobara::Auth::Logout,
          request_mutators: Foobara::AuthHttp::SetRefreshTokenFromCookie,
          response_mutators: Foobara::AuthHttp::ClearAccessTokenHeader

  command Foobara::BlogWww::GetCurrentUser,
          requires_authentication: true,
          # serializers: Foobara::CommandConnectors::Serializers::AggregateSerializer,
          # aggregate_entities: true,
          request_mutators: set_user_to_current_user

  command ComputeExponent, requires_authentication: true

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
