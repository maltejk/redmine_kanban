
  require_dependency 'user_preference'
  UserPreference.send(:include, RedmineKanban::Patches::UserPreferencePatch)

  require_dependency 'principal'
  Principal.send(:include, RedmineKanban::Patches::PrincipalPatch)
  require_dependency 'issue'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless Issue.included_modules.include? RedmineKanban::IssuePatch
    Issue.send(:include, RedmineKanban::IssuePatch)
  end
