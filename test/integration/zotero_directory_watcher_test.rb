require 'test_helper'

class ZoteroDirectoryWatcherTest < ActionController::IntegrationTest
  fixtures :all
  
  # Normally, Rails runs the entire test in a transaction, so the database
  # changes done in test are isolated from the database changes made by daemons.
  # The line can be removed if the test and the daemon don't communicate via the
  # database.
  self.use_transactional_fixtures = false

  test "daemon interactions" do
	  # stuff that should be done before the daemon runs (e.g. database setup)
		
    Daemonz.with_daemons do
		  # test interactions with the daemon
    end
  end
end
