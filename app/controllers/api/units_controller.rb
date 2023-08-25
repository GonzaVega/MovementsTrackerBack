module Api
  class Api::UnitsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_unit, only: %i[ show edit update destroy ]

    # GET /units or /units.json
    def index
      @units = Unit.all
      render json: @units
    end

    # GET /units/1 or /units/1.json
    def show
    end

    # GET /units/new
    def new
      @unit = Unit.new
    end

    # GET /units/1/edit
    def edit
    end

    # POST /units or /units.json
    def create
      @unit = Unit.new(unit_params)
  
      if current_api_user.present?
        if @unit.save
          render json: @unit, status: :created
          # , location: @unit
        else
          render json: @unit.errors, status: :unprocessable_entity
        end
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end

    # PATCH/PUT /units/1 or /units/1.json
    def update
      respond_to do |format|
        if @unit.update(unit_params)
          format.html { redirect_to unit_url(@unit), notice: "Unit was successfully updated." }
          format.json { render :show, status: :ok, location: @unit }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @unit.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /units/1 or /units/1.json
    def destroy
      @unit.destroy

      respond_to do |format|
        format.html { redirect_to units_url, notice: "Unit was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    #user_units method

    # def user_units
    #   if current_api_user.present?
    #     # @user_units = current_api_user.units.includes(:users, :unit_type)
    #     @user_units = [current_api_user.unit]
    #     render json: @user_units, include: [:users, :unit_type, :movements]
    #   else
    #     render json: { error: "Not authenticated" }, status: :unauthorized
    #   end
    # end
    def user_units
      if current_api_user.present?
        @user_units = [current_api_user.unit]
        movements_with_users = Movement.where(unit_id: @user_units.first.id).includes(:user)
        render json: @user_units, include: { users: { only: :name }, unit_type: {}, movements: { include: { user: { only: :name } } } }
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
    
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_unit
        @unit = Unit.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def unit_params
        params.require(:unit).permit(:name, :address, :unit_type_id)
      end
  end
end
