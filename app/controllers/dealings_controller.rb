class DealingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @msg_bool = true
    @user = current_user
    @category = Group.find(params[:category_id])
    @category_dealings = []
    @total = 0
    @user.groups.includes(:group_dealings)
      .where(id: params[:category_id]).each do |item|
      item.group_dealings.includes(:dealing)
        .order('created_at DESC').each do |el|
        @category_dealings << el.dealing
        @total += el.dealing[:amount].to_i
        @msg_bool = false
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
      redirect_to category_dealings_path(params[:category_id])
    else
      flash.now[:error] = 'Transaction could not be saved'
      render new
    end
  end
end
