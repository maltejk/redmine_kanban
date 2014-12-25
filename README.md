# Redmine Kanban Plugin

The Redmine Kanban plugin is used to manage issues according to the Kanban
system of project management.

## Features

  * Global Kanban page showing the status of issues across projects
  * Multiple "Panes" to show the lifecycle of an issue
      * Incoming Pane
      * Unstaffed Backlog pane
      * Quick Tasks pane - issues without a time estimate or with estimate of 2 hours or less
      * Selected Tasks - Manager prioritized list
      * Active Staffed Requests - issues in progress
      * Testing Staffed Requests - issues awaiting testing
      * Finished Requests
  * Updates to Kanban view are saved to the issues
      * Issue status
      * Issue assignment
      * Issue start date

## Installation and Setup

 1. Install the aasm and block_helpers gems: `sudo gem install aasm
    block_helpers`
 2. Follow the normal Redmine plugin installation steps (see
    http://www.redmine.org/projects/redmine/wiki/Plugins)
 3. Run the plugin migrations: `bundle exec rake redmine:plugins:migrate`
 4. Restart your Redmine web servers (e.g. mongrel, thin, mod_rails)
 5. Login and configure the plugin (Administration > Plugins > Configure). See
    below for the recommended approach.
 6. Click the Kanban link in the top left menu

## Usage

### Recommended configuration

The Kanban plugin uses 7 sets of lists, referred to panes:

  * Incoming - New
  * Unstaffed Backlog - Approved
  * Quick Tasks
  * Selected Tasks - Selected
  * Active Staffed Requests - In Progress
  * Testing Staffed Requests - Resolved
  * Finished Requests - Complete

Each pane (except Quick Tasks) needs to be associated with a Issue Status. The
recommended statuses are above but you can customize them as needed. The
Staffed panes (Active, Testing, Finished) also require choosing a Role to use.
Any user with this Role will have their own personal set of panes created on
the Kanban page.

Quick tasks will pull in the highest priority issues from the Backlog that
don't have an estimate (or with estimate of two hours or less). This is useful 
when someone has a limited amount of time but wants to finish something, like 
when it's 4:30pm on a Friday afternoon.

### Notes on using Kanban board

The positions of the issues are only saved for Selected Tasks, Active and Testing 
Stuffed Requests.

The higher issue priorities are expected to have lower position numbers: (i.e. 
"High", "Medium", "Low" instead of "Low", "Medium", "High").

The issues on kanban board on the "Unstuffed Backlog" and "Quick Tasks" panes are 
grouped by priorities, so that the positions influence only apperance of the issues
within a priority for that panes.

The WorkInProgress limits do not prevent issues from saving in the appropriate states
but used for representation on kanban board. So by WiP limit of 5 only first five 
issues will be shown on the board.

The incoming projects if set are not shown on the kanban overview. 

## License

This plugin is licensed under the GNU GPL v2. See COPYRIGHT.txt and GPL.txt for
details.
