class ShmrequestattributesController < ApplicationController
  before_action :set_shmrequestattribute, only: [:show, :update, :destroy]

  # GET /shmrequestattributes
  def index
    @shmrequestattributes = Shmrequestattribute.all

    render json: @shmrequestattributes
  end

  # GET /shmrequestattributes/1
  def show
    render json: @shmrequestattribute
  end

  # POST /shmrequestattributes
  def create
    @shmrequestattribute = Shmrequestattribute.new(shmrequestattribute_params)

    if @shmrequestattribute.save
      render json: @shmrequestattribute, status: :created, location: @shmrequestattribute
    else
      render json: @shmrequestattribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmrequestattributes/1
  def update
    if @shmrequestattribute.update(shmrequestattribute_params)
      render json: @shmrequestattribute
    else
      render json: @shmrequestattribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmrequestattributes/1
  def destroy
    @shmrequestattribute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmrequestattribute
      @shmrequestattribute = Shmrequestattribute.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmrequestattribute_params
      params.require(:shmrequestattribute).permit(:attributeName, :requestAttribute, :requestDateAtrb, :attributeDate, :requestID)
    end
end
