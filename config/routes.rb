# frozen_string_literal: true

get '/projects/:project_id/project_tags', to: 'project_tags#index', as: :project_project_tags
patch '/projects/:project_id/project_tags', to: 'project_tags#update'
get '/projects/:project_id/project_tags/autocomplete', to: 'project_tags#autocomplete', as: :autocomplete_project_tags
