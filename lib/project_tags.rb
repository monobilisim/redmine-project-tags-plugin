# frozen_string_literal: true

require_dependency File.expand_path('project_tags/patches/project_patch', __dir__)
require_dependency File.expand_path('project_tags/patches/projects_helper_patch', __dir__)
require_dependency File.expand_path('project_tags/hooks/view_hook', __dir__)
require_dependency File.expand_path('../app/helpers/project_tags_helper', __dir__)

ApplicationController.helper ProjectTagsHelper
