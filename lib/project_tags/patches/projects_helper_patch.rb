# frozen_string_literal: true

require_dependency 'projects_helper'

module ProjectTags
  module Patches
    module ProjectsHelperPatch
      def project_settings_tabs
        super.tap do |tabs|
          if @project && @project.module_enabled?(:project_tags) &&
             User.current.allowed_to?(:view_project_tags, @project) &&
             User.current.allowed_to?(:edit_project, @project)
            tabs << {
              name: 'project_tags',
              action: :view_project_tags,
              partial: 'project_tags/settings',
              label: :label_project_tags
            }
          end
        end
      end
    end
  end
end

ProjectsController.helper(ProjectTags::Patches::ProjectsHelperPatch)
