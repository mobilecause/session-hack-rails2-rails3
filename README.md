session-hack-rails2-rails3
==========================

Hackery to get Rails 2 and 3 to share a common session in the browser.
Rails 2 and 3 both put FlashHash in the session but have different APIs and cannot de-serialize sessions from the other version.

Installation
============
Add this line to your application's Gemfile:
<p><code>gem 'session-hack-rails2-rails3'

And then execute:
<p><code> $ bundle

Or install it yourself as:
<p><code> $ gem install 'session-hack-rails2-rails3'

Usage
=====
In your rails3 app, add the following in the config/initializers/session_store.rb
<p><code>require 'rails2_to_3_flash_serialization'

In your rails2 app, add the following in the config/initializers/session_store.rb
<p><code>require 'rails3_to_2_flash_serialization'

That's all! You should be able to share session object between your rails2 and rails3 apps.

Contributing to session-hack-rails2-rails3
==========================================
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.
