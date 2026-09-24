# frozen_string_literal: true

module ProjectTags
  module Hooks
    class ViewHook < Redmine::Hook::ViewListener
      render_on :view_issues_show_details_bottom, partial: 'project_tags/issue_project_tags'
      render_on :view_layouts_base_html_head, partial: 'project_tags/header_assets'

      def view_projects_show_left(context)
        render_project_tags_overview(context)
      end

      def view_projects_show_right(context)
        render_project_tags_overview(context)
      end

      def view_projects_show_sidebar_bottom(context)
        render_project_tags_overview(context)
      end

      private

      def render_project_tags_overview(context)
        caller = context[:hook_caller] || context[:controller]
        return ''.html_safe if caller&.instance_variable_defined?(:@project_tags_overview_rendered)

        caller.instance_variable_set(:@project_tags_overview_rendered, true) if caller
        options = {locals: context, partial: 'project_tags/project_tags'}
        if caller&.respond_to?(:render)
          caller.render(options)
        elsif context[:controller].is_a?(ActionController::Base)
          context[:controller].render_to_string(options)
        else
          ''.html_safe
        end
      end
    end
  end
end
