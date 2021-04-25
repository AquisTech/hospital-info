class ContactNumbersController < ApplicationController
  before_action :set_contact_number, only: %i[ show edit update destroy ]

  # GET /contact_numbers or /contact_numbers.json
  def index
    @contact_numbers = ContactNumber.all
  end

  # GET /contact_numbers/1 or /contact_numbers/1.json
  def show
  end

  # GET /contact_numbers/new
  def new
    @contact_number = ContactNumber.new
  end

  # GET /contact_numbers/1/edit
  def edit
  end

  # POST /contact_numbers or /contact_numbers.json
  def create
    @contact_number = ContactNumber.new(contact_number_params)

    respond_to do |format|
      if @contact_number.save
        format.html { redirect_to @contact_number, notice: "Contact number was successfully created." }
        format.json { render :show, status: :created, location: @contact_number }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_numbers/1 or /contact_numbers/1.json
  def update
    respond_to do |format|
      if @contact_number.update(contact_number_params)
        format.html { redirect_to @contact_number, notice: "Contact number was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_numbers/1 or /contact_numbers/1.json
  def destroy
    @contact_number.destroy
    respond_to do |format|
      format.html { redirect_to contact_numbers_url, notice: "Contact number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_number
      @contact_number = ContactNumber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_number_params
      params.fetch(:contact_number, {})
    end
end
