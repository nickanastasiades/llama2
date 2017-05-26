class PlansController < ApplicationController
  def index
    @plans = Plan.all

    render("plans/index.html.erb")
  end

  def show
    @plan = Plan.find(params[:id])

    render("plans/show.html.erb")
  end

  def new
    @plan = Plan.new

    render("plans/new.html.erb")
  end

  def create
    @plan = Plan.new

    @plan.name = params[:name]
    @plan.price = params[:price]
    @plan.hours = params[:hours]

    save_status = @plan.save

    if save_status == true
      redirect_to("/plans/#{@plan.id}", :notice => "Plan created successfully.")
    else
      render("plans/new.html.erb")
    end
  end

  def edit
    @plan = Plan.find(params[:id])

    render("plans/edit.html.erb")
  end

  def update
    @plan = Plan.find(params[:id])

    @plan.name = params[:name]
    @plan.price = params[:price]
    @plan.hours = params[:hours]

    save_status = @plan.save

    if save_status == true
      redirect_to("/plans/#{@plan.id}", :notice => "Plan updated successfully.")
    else
      render("plans/edit.html.erb")
    end
  end

  def destroy
    @plan = Plan.find(params[:id])

    @plan.destroy

    if URI(request.referer).path == "/plans/#{@plan.id}"
      redirect_to("/", :notice => "Plan deleted.")
    else
      redirect_to(:back, :notice => "Plan deleted.")
    end
  end
end
