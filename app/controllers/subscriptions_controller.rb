class SubscriptionsController < ApplicationController
  def confirm_email

    render("subscriptions/confirm_email.html.erb")
  end

  def index
    @subscriptions = Subscription.all

    render("subscriptions/index.html.erb")
  end

  def show
    @subscription = Subscription.find(params[:id])

    render("subscriptions/show.html.erb")
  end

  def new
    @subscription = Subscription.new

    render("subscriptions/new.html.erb")
  end

  def create
    @subscription = Subscription.new

    @subscription.client_id = params[:client_id]
    @subscription.plan_id = params[:plan_id]
    @subscription.end_date = params[:end_date]

    save_status = @subscription.save

    if save_status == true
      redirect_to("/subscriptions/#{@subscription.id}", :notice => "Subscription created successfully.")
    else
      render("subscriptions/new.html.erb")
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])

    render("subscriptions/edit.html.erb")
  end

  def update
    @subscription = Subscription.find(params[:id])

    @subscription.client_id = params[:client_id]
    @subscription.plan_id = params[:plan_id]
    @subscription.end_date = params[:end_date]

    save_status = @subscription.save

    if save_status == true
      redirect_to("/subscriptions/#{@subscription.id}", :notice => "Subscription updated successfully.")
    else
      render("subscriptions/edit.html.erb")
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])

    @subscription.destroy

    if URI(request.referer).path == "/subscriptions/#{@subscription.id}"
      redirect_to("/", :notice => "Subscription deleted.")
    else
      redirect_to(:back, :notice => "Subscription deleted.")
    end
  end
end
