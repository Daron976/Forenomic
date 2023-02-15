class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @msg_bool = true
    @user = current_user
    @categories = @user.groups.order('created_at DESC')
    @total = []
    @categories.includes(:group_dealings).each do |item|
      arr = []
      next unless item.group_dealings.includes(:dealing)

      item.group_dealings.includes(:dealing).each do |el|
        arr << el.dealing[:amount]
      end
      item.total = arr.reduce(:+)
      item.save
      @total << if arr.empty?
                  0
                else
                  arr.reduce(:+)
                end
      @msg_bool = false
    end
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
