class ShmorderfeedbacksController < ApplicationController
  before_action :set_shmorderfeedback, only: [:show, :update, :destroy]

  # GET /shmorderfeedbacks
  def index
    @shmorderfeedbacks = Shmorderfeedback.all

    render json: @shmorderfeedbacks
  end

  # GET /shmorderfeedbacks/1
  def show
    render json: @shmorderfeedback
  end

  # POST /shmorderfeedbacks
  def create
    @shmorderfeedback = Shmorderfeedback.new(shmorderfeedback_params)

    if @shmorderfeedback.save
      render json: @shmorderfeedback, status: :created, location: @shmorderfeedback
    else
      render json: @shmorderfeedback.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmorderfeedbacks/1
  def update
    if @shmorderfeedback.update(shmorderfeedback_params)
      render json: @shmorderfeedback
    else
      render json: @shmorderfeedback.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmorderfeedbacks/1
  def destroy
    @shmorderfeedback.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmorderfeedback
      @shmorderfeedback = Shmorderfeedback.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmorderfeedback_params
      params.require(:shmorderfeedback).permit(:requestID, :feedbackScore, :feedbackComment, :feedbackTime)
    end
end
