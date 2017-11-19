class ShmshmealattributesController < ApplicationController
  before_action :set_shmshmealattribute, only: [:show, :update, :destroy]

  # GET /shmshmealattributes
  def index
    @shmshmealattributes = Shmshmealattribute.all

    render json: @shmshmealattributes
  end

  # GET /shmshmealattributes/1
  def show
    render json: @shmshmealattribute
  end

  # POST /shmshmealattributes
  def create
    @shmshmealattribute = Shmshmealattribute.new(shmshmealattribute_params)

    @shmeal = Shmeal.find(params[:shmealID])
    #@shmshmealattribute.shmeal = @shmeal
    @menuitem = Menuitem.find(params:@shmeal.menuItemID)
    #@shmshmeals

    if @shmshmealattribute.save
      render json: @shmshmealattribute, status: :created, location: @shmshmealattribute
    else
      render json: @shmshmealattribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmshmealattributes/1
  def update
    if @shmshmealattribute.update(shmshmealattribute_params)
      render json: @shmshmealattribute
    else
      render json: @shmshmealattribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmshmealattributes/1
  def destroy
    @shmshmealattribute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmshmealattribute
      @shmshmealattribute = Shmshmealattribute.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmshmealattribute_params
      params.require(:shmshmealattribute).permit(:attributeName, :shmealAttribute, :shmealAtrbDate, :attributeDate, :shmealID, :menuItemID)
    end
end
