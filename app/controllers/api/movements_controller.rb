module Api

  class Api::MovementsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_movement, only: %i[show edit update destroy]
  
    def index
      
      if current_api_user.present?
        @movements = current_api_user.movements.includes(:unit).map do |movement|
          movement.as_json.tap do |json|
            json['concept'] = case movement.concept
                              when 1
                                'income'
                              when 2
                                'expense'
                              end
            json['unit_name'] = movement.unit.name if movement.unit.present?                 
          end
        end
  
        render json: @movements
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    def balance
      if current_api_user.present?
        balance = current_api_user.movements.sum("amount * (CASE concept WHEN 1 THEN 1 ELSE -1 END)")
        render json: { balance: balance }
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    def income_balance
      if current_api_user.present?
        balance = current_api_user.movements.where(concept: 1).sum(:amount)
        render json: { income_balance: balance }
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    def expense_balance
      if current_api_user.present?
        balance = current_api_user.movements.where(concept: 2).sum(:amount)
        render json: { expense_balance: balance }
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    def show
      if current_api_user.present?
        @movement = Movement.find(params[:id])
        respond_to do |format|
          format.json { render json: @movement }
        end
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    def new
      @movement = Movement.new
    end
  
    def edit
    end
  
    def create
      @movement = Movement.new(movement_params)
  
      if current_api_user.present?
        if @movement.save
          render json: @movement, status: :created
          # , location: @movement
        else
          render json: @movement.errors, status: :unprocessable_entity
        end
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    def update
      if current_api_user.present?
        if @movement.update(movement_params)
          render json: @movement, status: :ok, location: @movement
        else
          render json: @movement.errors, status: :unprocessable_entity
        end
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    def destroy
      if current_api_user.present?
        @movement.destroy
        head :no_content
      else
        render json: { error: "Not authenticated" }, status: :unauthorized
      end
    end
  
    private
  
    def set_movement
      @movement = Movement.find(params[:id])
    end
  
    def movement_params
      params.require(:movement).permit(:amount, :concept, :description, :date, :unit_id, :user_id)
    end
  end
end  
# class MovementsController < ApplicationController
#   before_action :set_movement, only: %i[ show edit update destroy ]
#   before_action :authenticate_api_user!
#   movementType = ''
#   # GET /movements or /movements.json

#   def index
#     @movements = current_api_user.movements.map do |movement|
#       movement.as_json.tap do |json|
#         json['concept'] = case movement.concept
#                           when 1
#                             'income'
#                           when 2
#                             'expense'
#                           end
#       end
#     end
  
#     render json: @movements
#   end
  
#   # def index
#   #  @movements = Movement.all.map do |movement|
#   #   movement.as_json.tap do |json|
#   #     json['concept'] = case movement.concept
#   #                       when 1
#   #                         'income'
#   #                       when 2
#   #                         'expense'
#   #                       end
#   #   end
#   # end
#   #   render json: @movements
#   # end

#   # GET /movements/balance.json

#   def balance
#     balance = current_api_user.movements.sum("amount * (CASE concept WHEN 1 THEN 1 ELSE -1 END)")
#     render json: { balance: balance }
#   end
  
#   # def balance
#   #   balance = 0
#   #   Movement.all.each do |movement|
#   #     balance += movement.amount * (movement.concept == 1 ? 1 : -1)
#   #   end
#   #   render json: { balance: balance }
#   # end
#   def income_balance
#     balance = current_api_user.movements.where(concept: 1).sum(:amount)
#     render json: { income_balance: balance }
#   end
  

#   # def income_balance
#   #   balance = 0
#   #   Movement.all.each do |movement|
#   #   if movement.concept == 1
#   #     balance += movement.amount
#   #   end
#   # end
#   #   render json: { income_balance: balance }
#   # end

#   def expense_balance
#     balance = current_api_user.movements.where(concept: 2).sum(:amount)
#     render json: { expense_balance: balance }
#   end
  
#   # def expense_balance
#   #   balance = 0
#   #   Movement.all.each do |movement|
#   #   if movement.concept == 2
#   #     balance += movement.amount
#   #   end
#   # end
#   #   render json: { expense_balance: balance }
#   # end
#   # GET /movements/1 or /movements/1.json
#   def show
#     @movement = Movement.find(params[:id])
#     respond_to do |format|
#       format.json { render json: @movement }
#     end
#   end

#   # GET /movements/new
#   def new
#     @movement = Movement.new
#      end

#   # GET /movements/1/edit
#   def edit
#   end

#   # POST /movements or /movements.json
#   def create
#     @movement = Movement.new(movement_params)

#     respond_to do |format|
#       if @movement.save
#         format.html { redirect_to movement_url(@movement), notice: "Movement was successfully created." }
#         format.json { render :show, status: :created, location: @movement }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @movement.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /movements/1 or /movements/1.json
#   def update
#     respond_to do |format|
#       if @movement.update(movement_params)
#         format.html { redirect_to movement_url(@movement), notice: "Movement was successfully updated." }
#         format.json { render :show, status: :ok, location: @movement }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @movement.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /movements/1 or /movements/1.json
#   def destroy
#     @movement.destroy

#     respond_to do |format|
#       format.html { redirect_to movements_url, notice: "Movement was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
   
#     def set_movement
#       @movement = Movement.find(params[:id])
#     end
#     # def set_movement
#     #   if action_name == "show" || action_name == "edit" || action_name == "update" || action_name == "destroy"
#     #     @movement = Movement.find(params[:id])
#     #   end
#     # end

#     # Only allow a list of trusted parameters through.
#     def movement_params
#       params.require(:movement).permit(:amount, :concept, :description, :date, :unit_id, :user_id)
#     end
# end
# end
