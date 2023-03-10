class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def filter
    if params[:filter] == "all"
      @groups = Group.all
    elsif params[:filter] == "mine"
      @groups = Group.where(user_id: current_user.id)
    elsif params[:filter] == "joined"
      query = Membership.where(user_id: current_user.id)
      list = []
      query.each { |q| list.push(q.group_id) }
      @groups = Group.where(id: list)
    else
      @groups = []
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("groups", partial: "groups/filter_results", locals: {groups: @groups} )
        ]
      end
    end
  end

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @posts = Post.where(group_id: @group.id)

    @query = Membership.where(group_id: @group.id)
    list = []
    @query.each { |q| list.push(q.user_id) }
    @members = User.where(id: list)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    
    respond_to do |format|
      if @group.save
        Membership.create!(user_id: current_user.id, group_id: @group.id )
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :user_id)
    end
end
