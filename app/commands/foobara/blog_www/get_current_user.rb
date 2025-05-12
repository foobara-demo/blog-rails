module Foobara
  module BlogWww
    # TODO: move to foobara-auth-http?
    class GetCurrentUser < Foobara::Command
      inputs { user Foobara::Auth::Types::User }
      result Foobara::Auth::Types::User

      def execute
        user
      end
    end
  end
end
