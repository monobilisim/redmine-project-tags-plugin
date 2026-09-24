# frozen_string_literal: true

require File.expand_path('lib/project_tags', __dir__)

Redmine::Plugin.register :project_tags do
  name 'Project Tags'
  author 'Ali Erdem Cerrah'
  author_url 'https://mono.tr'
  description 'Adds permission-controlled tags to projects.'
  version '1.0.0'
  requires_redmine version_or_higher: '5.0.0'

  project_module :project_tags do
    permission :view_project_tags, {}, read: true
  end
end
