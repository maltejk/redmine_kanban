require File.dirname(__FILE__) + '/../test_helper'

class RoutingTest < ActionController::IntegrationTest
  should route :get, "/kanban", :controller => 'kanbans', :action => 'show'
  should route :put, "/kanban", :controller => 'kanbans', :action => 'update'
  should route :put, "/kanban.js", :controller => 'kanbans', :action => 'update', :format => 'js'
  should route :put, "/kanban/sync", :controller => 'kanbans', :action => 'sync'

  should route :get, "/kanban_issues/100/edit.js", :controller => 'kanban_issues', :action => 'edit', :id => 100, :format => 'js'

  should route :get, "/kanban/my-requests", :controller => 'user_kanbans', :action => 'show'
  should route :get, "/kanban/users/100", :controller => 'user_kanbans', :action => 'show', :id => 100
end
