class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entry
    end
  end

  private
  def group_params
    params.expect(group: [:name])
  end
end
