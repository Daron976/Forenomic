class DealingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @category_dealings = []
    @total = 0
    @user.groups.includes(:group_dealings)
    .where(id: params[:category_id]).each do |item|
      item.group_dealings.includes(:dealing).each do |el|
        @category_dealings << el.dealing
        @total = @total + el.dealing[:amount].to_i
      end
    end
  end

  def new
    @dealing = Dealing.new
  end

  def create
    new_dealing = Dealing.new(name: params[:name], amount: params[:amount].to_i, author_id: current_user.id)
    if new_dealing.save
      GroupDealing.create(group_id: params[:category_id], dealing_id: new_dealing.id)
      flash[:success] = 'transaction has been created'
      redirect_to categories_path
    else
      flash.now[:error] = 'Transaction could not be saved'
      render new
    end
  end
end
