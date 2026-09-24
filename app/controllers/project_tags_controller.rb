# frozen_string_literal: true

class ProjectTagsController < ApplicationController
  before_action :find_project
  before_action :authorize_view_project_tags
  before_action :authorize_edit_project_tags, only: :update

  helper :project_tags

  def index
    @project_tags = @project.project_tag_list
    render :settings
  end

  def update
    @project.project_tag_list = project_tag_params[:project_tag_list].to_s

    if @project.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to settings_project_path(@project, tab: 'project_tags')
    else
      @project_tags = @project.project_tag_list
      render :settings, status: :unprocessable_entity
    end
  end

  def autocomplete
    name = params[:q].to_s.strip
    scope = ActsAsTaggableOn::Tag.joins(:taggings)
      .where(taggings: {context: 'project_tags'})
      .distinct
      .order(:name)
    scope = scope.where('LOWER(tags.name) LIKE LOWER(?)', "%#{ActiveRecord::Base.sanitize_sql_like(name)}%") if name.present?
    render json: scope.limit(20).pluck(:name)
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def authorize_view_project_tags
    return if @project.module_enabled?(:project_tags) &&
      (User.current.admin? || User.current.allowed_to?(:view_project_tags, @project))

    deny_access
  end

  def authorize_edit_project_tags
    return if User.current.admin? || User.current.allowed_to?(:edit_project, @project)

    deny_access
  end

  def project_tag_params
    params.require(:project).permit(:project_tag_list)
  end
end
