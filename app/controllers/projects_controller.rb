class ProjectsController < ApplicationController
  def index
    if current_client.subscriptions.last == nil
      redirect_to :controller => 'subscriptions', :action => 'new'

    else

    @projects = current_client.projects.all
    @current_plan = Plan.find_by(:id => current_client.subscriptions.last.plan_id)
    @current_plan_name = Plan.find_by(:id => current_client.subscriptions.last.plan_id).name
    @current_plan_hours = Plan.find_by(:id => current_client.subscriptions.last.plan_id).hours.to_f
    @total_used_hours = current_client.projects.sum(:hours)

    d1 = Date.today
    d0 = current_client.subscriptions.last.created_at
    year_diff = d1.year - d0.year
    month_diff = d1.month - d0.month + 1
    months = year_diff / 12 + month_diff
    @total_available_hours = @current_plan_hours * months + 1

    @hours_remaining = @total_available_hours - @total_used_hours

    if @status == "Completed"
      @status_label = "Success"
    elsif @status == "In Progress"
      @status_label = "Warning"
    else
      @status_label = "Default"
    end

    render("projects/index.html.erb")

    end
  end

  def show
    @project = Project.find(params[:id])

    if @project.items.where('url LIKE ? OR url LIKE ?', "%jpg%", "%png%").count > 0
      @project_img = @project.items.where('url LIKE ? OR url LIKE ?', "%jpg%", "%png%").last.url
    else
      @project_img = "/images/llama-project-icon.png"
    end



    render("projects/show.html.erb")
  end

  def review
    @project = Project.find(params[:id])

    render("projects/review.html.erb")
  end

  def revise_submit
    @project = Project.find(params[:id])

    render("projects/revise-submit.html.erb")
  end

  def new
    @project = Project.new
    @type = params[:project_type]

    render("projects/new.html.erb")
  end

  def start
    @project = Project.new

    render("projects/start.html.erb")
  end

  def create
    @project = Project.new

    @project.title = params[:title]
    @project.project_type = params[:project_type]
    @project.description = params[:description]
    @project.status = params[:status]
    @project.version = params[:version]
    @project.designer_id = params[:designer_id]
    @project.hours = params[:hours]
    @project.client_id = params[:client_id]
    @project.designer_id = params[:designer_id]

    save_status = @project.save

    if save_status == true
      redirect_to("/items/new/#{@project.id}", :notice => "")
    elsif save_status == false && @project.project_type.empty?
      render("projects/start.html.erb")
    else
      render("projects/new.html.erb")
    end
  end

  def edit
    @project = Project.find(params[:id])

    render("projects/edit.html.erb")
  end

  def update
    @project = Project.find(params[:id])

    @project.title = params[:title]
    @project.project_type = params[:project_type]
    @project.description = params[:description]
    @project.status = params[:status]
    @project.version = params[:version]
    @project.designer_id = params[:designer_id]
    @project.hours = params[:hours]
    @project.client_id = params[:client_id]
    @project.designer_id = params[:designer_id]

    save_status = @project.save

    if save_status == true
      redirect_to("/items/revise/#{@project.id}", :notice => "")
    else
      render("projects/edit.html.erb")
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    if URI(request.referer).path == "/projects/#{@project.id}"
      redirect_to("/", :notice => "Project deleted.")
    else
      redirect_to(:back, :notice => "Project deleted.")
    end
  end
end
