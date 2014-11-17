require File.dirname(__FILE__) + '/../test_helper'

class IssueTest < ActiveSupport::TestCase
  def shared_setup
    configure_plugin
  end

  context 'after_destroy' do
    should 'destroy any associated KanbanIssues' do
      shared_setup
      project = Project.generate!
      project.trackers << Tracker.generate!(:name => "SomeTracker")
      issue = Issue.custom_generate!(:project => project,
                         :tracker => project.trackers.first,
                         :status => IssueStatus.find_by_name('Active'),
                         :priority => medium_priority
                         )

      assert KanbanIssue.find_by_issue_id(issue.id)
      assert_difference('KanbanIssue.count',-1) do
        issue.destroy
      end
      assert_nil KanbanIssue.find_by_issue_id(issue.id)
    end
  end
  
end
