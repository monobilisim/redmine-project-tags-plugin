# frozen_string_literal: true

module ProjectTags
  module Patches
    module ProjectPatch
      def self.included(base)
        base.class_eval do
          acts_as_taggable_on :project_tags
          safe_attributes 'project_tag_list'
        end
      end
    end
  end
end

Project.include(ProjectTags::Patches::ProjectPatch) unless Project.included_modules.include?(ProjectTags::Patches::ProjectPatch)
