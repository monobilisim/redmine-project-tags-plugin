require_dependency 'queries_helper'

module ProjectTags
  module Patches
    module QueriesHelperPatch
      def column_content(column, item)
        value = column.value_object(item)
        content = if value.is_a?(Array)
                    safe_join(value.filter_map { |entry| column_value(column, item, entry) }, ', ')
                  else
                    column_value(column, item, value)
                  end
        if item.is_a?(Project) && column.name == :name
          tags = project_tag_names(item)
          if tags.any?
            content << content_tag('div', safe_join(tags.map { |name| project_tag_badge(name) }, ' '),
                                   class: 'project-tags project-tags-list')
          end
        end
        content
      end
    end
  end
end

QueriesHelper.prepend(ProjectTags::Patches::QueriesHelperPatch)
