class ShmuserattributesController < ApplicationController
  before_action :set_shmuserattribute, only: [:show, :update, :destroy]

  # GET /shmuserattributes
  def index
    @shmuserattributes = Shmuserattribute.all

    render json: @shmuserattributes
  end

  # GET /shmuserattributes/1
  def show
    render json: @shmuserattribute
  end

  # POST /shmuserattributes
  def create
    @shmuserattribute = Shmuserattribute.new(shmuserattribute_params)

    @shmuserattribute.user_id = @shmuserattribute.userID

    if @shmuserattribute.save
      render json: @shmuserattribute, status: :created, location: @shmuserattribute
    else
      render json: @shmuserattribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmuserattributes/1
  def update
    if @shmuserattribute.update(shmuserattribute_params)
      render json: @shmuserattribute
    else
      render json: @shmuserattribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmuserattributes/1
  def destroy
    @shmuserattribute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmuserattribute
      @shmuserattribute = Shmuserattribute.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmuserattribute_params
      params.require(:shmuserattribute).permit(:attributeName, :userAttribute, :attributeDate, :userID)
    end
end
