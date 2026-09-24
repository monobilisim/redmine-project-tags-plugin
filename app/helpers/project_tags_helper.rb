# frozen_string_literal: true

module ProjectTagsHelper
  def project_tags_visible?(project)
    project && project.module_enabled?(:project_tags) &&
      (User.current.admin? || User.current.allowed_to?(:view_project_tags, project))
  end

  def project_tag_names(project)
    return [] unless project_tags_visible?(project)

    project.project_tag_list.to_a
  end

  def project_tag_badge(name, removable: false)
    hue = name.to_s.bytes.sum % 360
    remove_button = if removable
                      content_tag(:button, '×', type: 'button', class: 'project-tag-remove',
                                  title: l(:button_delete), data: {project_tag: name})
                    end
    content_tag(:span, safe_join([name.to_s, remove_button].compact), class: 'project-tag',
                style: "--project-tag-hue: #{hue}")
  end
end
