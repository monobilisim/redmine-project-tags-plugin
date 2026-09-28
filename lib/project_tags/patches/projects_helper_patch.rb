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

      def render_project_hierarchy(projects)
        render_project_nested_lists(projects) do |project|
          classes = project.css_classes.split
          classes += %w(icon icon-user my-project) if User.current.member_of?(project)
          classes += %w(icon icon-bookmarked-project) if User.current.bookmarked_project_ids.include?(project.id)

          content = link_to_project(project, {}, class: classes.uniq.join(' '))
          tags = project_tag_names(project)
          content << content_tag('div', safe_join(tags.map { |name| project_tag_badge(name) }, ' '),
                                 class: 'project-tags project-tags-list') if tags.any?
          if project.description.present?
            content << content_tag('div', textilizable(project, :short_description, project: project),
                                   class: 'wiki description')
          end
          content
        end
      end
    end
  end
end

ProjectsController.helper(ProjectTags::Patches::ProjectsHelperPatch)
