# Hackery to get Rails 2 to share a common session in the browser with Rails 3
# Rails 2 and 3 both put FlashHash in the session but have different APIs and cannot de-serialize sessions from the other version.

# Provide empty stub of Rails3 FlashHash so Rails2 can de-serialize the session in the browser
module ActionDispatch
  class Flash
    class FlashHash
      def method_missing(m, *a, &b)
      end
    end
  end
end

# Provide Rails2 with its own namespace for flash messages in the session to prevent name collisions with Rails3
module ActionController
  module Flash
    class FlashHash < Hash
      def store(session, key = "legacy_flash")
        return if self.empty?
        session[key] = self
      end
    end
    module InstanceMethods
        # Access the contents of the flash. Use <tt>flash["notice"]</tt> to
        # read a notice you put there or <tt>flash["notice"] = "hello"</tt>
        # to put a new one.
        def flash #:doc:
          if !defined?(@_flash)
            @_flash = session["legacy_flash"] || FlashHash.new
            @_flash.sweep
          end

          @_flash
        end
    end
  end
end