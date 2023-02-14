class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @categories = @user.groups
    total = 0
    @total_arr = []
    @categories.includes(:group_dealings).each do |item|
      item.group_dealings.includes(:dealing).each do |el|
        total = total + el.dealing[:amount].to_i
      end
      @total_arr << total
    end
    p @total_arr
  end

  def show
    @user = current_user
    @category_dealings = []
    @user.groups.includes(:group_dealings).each do |group|
      group.group_dealings.includes(:dealing).each do |el|
        @category_dealings << el.dealing
      end
    end
  end

  def new
    @category = Group.new
  end

  def create
    new_category = Group.new(name: params[:name], author_id: current_user.id)
    if new_category.save
      flash[:success] = 'Category has been created'
      redirect_to categories_path
    else
      flash.now[:error] = 'Category could not be saved'
      render new
    end
  end
end
