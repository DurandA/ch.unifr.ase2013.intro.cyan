class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action  :is_me_car, only: [:edit, :update, :destroy]
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new

    if  !signed_in?
    flash[:info] = 'please login before creating a new car for selling'
      redirect_to signin_path
    end

  end

  # GET /cars/1/edit
  def edit


  end

  # POST /cars
  # POST /cars.json
  def create


    car = Car.new(car_params)
    car.user_id= current_user.id
    respond_to do |format|
      if car.save
        format.html { redirect_to car, notice: 'Car was successfully created.' }
        format.json { render action: 'show', status: :created, location: car }
      else
        format.html { render action: 'new' }
        format.json { render json: car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:title, :description, :mileage, :color, :brand, :ask_price,:auction_ending, :user_id)
    end

  def is_me_car
    @car = Car.find_by_id(params[:id])

    if !signed_in? || @car.user_id !=current_user.id
      flash[:info] = "h3LL0 K3vin , 5orRy 8u7 n07 t0d@Y :)  "

      redirect_to root_path
    end
  end
end
