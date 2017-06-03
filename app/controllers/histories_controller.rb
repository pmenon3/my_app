class HistoriesController < ApplicationController
  def index
    
    @histories = History.all

    render("histories/index.html.erb")
  end

  def show
    @history = History.find(params[:id])

    render("histories/show.html.erb")
  end

  def new
    @history = History.new

    render("histories/new.html.erb")
  end

  def create
    @history = History.new

    @history.pseudoID = params[:pseudoID]
    @history.course_data = params[:course_data]
    @history.course_num = params[:course_num]
    @history.year = params[:year]
    @history.quarter_num = params[:quarter_num]
    @history.quarter_text = params[:quarter_text]
    @history.section = params[:section]

    save_status = @history.save

    if save_status == true
      redirect_to("/histories/#{@history.id}", :notice => "History created successfully.")
    else
      render("histories/new.html.erb")
    end
  end

  def edit
    @history = History.find(params[:id])

    render("histories/edit.html.erb")
  end

  def update
    @history = History.find(params[:id])

    @history.pseudoID = params[:pseudoID]
    @history.course_data = params[:course_data]
    @history.course_num = params[:course_num]
    @history.year = params[:year]
    @history.quarter_num = params[:quarter_num]
    @history.quarter_text = params[:quarter_text]
    @history.section = params[:section]

    save_status = @history.save

    if save_status == true
      redirect_to("/histories/#{@history.id}", :notice => "History updated successfully.")
    else
      render("histories/edit.html.erb")
    end
  end

  def destroy
    @history = History.find(params[:id])

    @history.destroy

    if URI(request.referer).path == "/histories/#{@history.id}"
      redirect_to("/", :notice => "History deleted.")
    else
      redirect_to(:back, :notice => "History deleted.")
    end
  end
end
