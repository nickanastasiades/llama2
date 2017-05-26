class ItemsController < ApplicationController
  def index
    @items = Item.all

    render("items/index.html.erb")
  end

  def show
    @item = Item.find(params[:id])

    render("items/show.html.erb")
  end

  def new
    @item = Item.new
    @item.project_id = params[:project_id]

    render("items/new.html.erb")
  end

  def create
    @item = Item.new

    @item.project_id = params[:project_id]
    @item.name = params[:url].original_filename
    @item.description = params[:description]
    @item.url = params[:url]

    save_status = @item.save

    if save_status == true
      redirect_to("/items/add/#{@item.project_id}", :notice => "")
    else
      render("items/new.html.erb")
    end
  end

  def revise_item
    @item = Item.new

    @item.project_id = params[:project_id]
    @item.name = params[:url].original_filename
    @item.description = params[:description]
    @item.url = params[:url]

    save_status = @item.save

    if save_status == true
      redirect_to("/items/revise/#{@item.project_id}", :notice => "")
    else
      render("items/new.html.erb")
    end
  end

  def add
    @item = Item.new
    @item.project_id = params[:project_id]
    @project = Project.find(params[:project_id])

    render("items/add.html.erb")
  end

  def revise
    @item = Item.new
    @item.project_id = params[:project_id]
    @project = Project.find(params[:project_id])

    render("items/revise.html.erb")
  end

  def edit
    @item = Item.find(params[:id])

    render("items/edit.html.erb")
  end

  def update
    @item = Item.find(params[:id])

    @item.project_id = params[:project_id]
    @item.name = params[:name]
    @item.description = params[:description]

    save_status = @item.save

    if save_status == true
      redirect_to("/items/#{@item.id}", :notice => "Item updated successfully.")
    else
      render("items/edit.html.erb")
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    if URI(request.referer).path == "/items/#{@item.id}"
      redirect_to("/", :notice => "Item deleted.")
    else
      redirect_to(:back, :notice => "")
    end
  end
end
