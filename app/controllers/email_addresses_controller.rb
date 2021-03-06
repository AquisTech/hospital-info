class EmailAddressesController < ApplicationController
  before_action :set_email_address, only: %i[ show edit update destroy ]

  # GET /email_addresses or /email_addresses.json
  def index
    @email_addresses = EmailAddress.all
  end

  # GET /email_addresses/1 or /email_addresses/1.json
  def show
  end

  # GET /email_addresses/new
  def new
    @email_address = EmailAddress.new
  end

  # GET /email_addresses/1/edit
  def edit
  end

  # POST /email_addresses or /email_addresses.json
  def create
    @email_address = EmailAddress.new(email_address_params)

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to @email_address, notice: "Email address was successfully created." }
        format.json { render :show, status: :created, location: @email_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_addresses/1 or /email_addresses/1.json
  def update
    respond_to do |format|
      if @email_address.update(email_address_params)
        format.html { redirect_to @email_address, notice: "Email address was successfully updated." }
        format.json { render :show, status: :ok, location: @email_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_addresses/1 or /email_addresses/1.json
  def destroy
    @email_address.destroy
    respond_to do |format|
      format.html { redirect_to email_addresses_url, notice: "Email address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_address
      @email_address = EmailAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_address_params
      params.fetch(:email_address, {})
    end
end
