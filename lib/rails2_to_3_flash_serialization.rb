# Hackery to get Rails 3 to share a common session in the browser with Rails 2
# Rails 2 and 3 both put FlashHash in the session but have different APIs and cannot de-serialize sessions from the other version.

# Provide empty stub of Rails2 FlashHash so Rails3 can de-serialize the session in the browser
module ActionController
  module Flash
    class FlashHash < Hash
      def method_missing(m, *a, &b)
      end
    end
  end
end