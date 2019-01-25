class ContactsController < ApplicationController
  def new
    @categories = Category.all
  end

  def create
  end

  def index
    @categories = Category.all
    #code
  end
end
