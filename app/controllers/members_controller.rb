class MembersController < ApplicationController
  def index
    if params[:user_id]
      @members = Member.where(user_id: params[:user_id])
      @member = Member.new
    else
      @members = Member.all
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @users = User.all
    @groups = Group.all
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path
    else
      render :new, status: :unprocessable_entry
    end
  end

  private
  def member_params
    params.expect(member: [ :user_id, :group_id ])
  end
end
