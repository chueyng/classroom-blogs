class PagesController < ApplicationController

  # GET /pages
  # GET /pages.json
  def index
    @users = User.where("role = 'teacher'")
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    
  end

  # GET /pages/new
  def new
   
  end

  # GET /pages/1/edit
  def edit
  end

end
