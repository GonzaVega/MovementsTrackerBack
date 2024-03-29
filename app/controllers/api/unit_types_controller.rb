module Api
  class Api::UnitTypesController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_unit_type, only: %i[ show edit update destroy ]

    # GET /unit_types or /unit_types.json
    def index
      @unit_types = UnitType.all
      render json: @unit_types
    end

    # GET /unit_types/1 or /unit_types/1.json
    def show
    end

    # GET /unit_types/new
    def new
      @unit_type = UnitType.new
    end

    # GET /unit_types/1/edit
    def edit
    end

    # POST /unit_types or /unit_types.json
    def create
      @unit_type = UnitType.new(unit_type_params)
  
      if current_api_user.present?
        if @unit_type.save
          render json: @unit_type, status: :created
        else
          render json: @unit_type.errors, status: :unprocessable_entity
        end
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end

    # PATCH/PUT /unit_types/1 or /unit_types/1.json
    def update
      respond_to do |format|
        if @unit_type.update(unit_type_params)
          format.html { redirect_to unit_type_url(@unit_type), notice: "Unit type was successfully updated." }
          format.json { render :show, status: :ok, location: @unit_type }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @unit_type.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /unit_types/1 or /unit_types/1.json
    def destroy
      @unit_type.destroy

      respond_to do |format|
        format.html { redirect_to unit_types_url, notice: "Unit type was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_unit_type
        @unit_type = UnitType.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def unit_type_params
        params.require(:unit_type).permit(:name)
      end
  end
end

 # @unit_type = UnitType.new(unit_type_params)

      # respond_to do |format|
      #   if @unit_type.save
      #     format.html { redirect_to unit_type_url(@unit_type), notice: "Unit type was successfully created." }
      #     format.json { render :show, status: :created, location: @unit_type }
      #   else
      #     format.html { render :new, status: :unprocessable_entity }
      #     format.json { render json: @unit_type.errors, status: :unprocessable_entity }
      #   end
      # end
