class HospitalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :filter, :show]
  before_action :set_hospital, only: %i[ show edit update destroy ]

  # GET /hospitals or /hospitals.json
  def index
    @hospitals = Hospital.all
  end

  def search
    @hospitals = Hospital.filter(params)
    render template: 'hospitals/search'
  end

  # GET /hospitals/1 or /hospitals/1.json
  def show
  end

  # GET /hospitals/new
  def new
    @hospital = Hospital.new
    @hospital.identities.build
    @hospital.email_addresses.build
    @hospital.contact_numbers.build
    @hospital.addresses.build
  end

  # GET /hospitals/1/edit
  def edit
  end

  # POST /hospitals or /hospitals.json
  def create
    @hospital = Hospital.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: "Hospital was successfully created." }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
        format.js { render_failure(@hospital) }
      end
    end
  end

  # PATCH/PUT /hospitals/1 or /hospitals/1.json
  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: "Hospital was successfully updated." }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
        format.js { render_failure(@hospital) }
      end
    end
  end

  # DELETE /hospitals/1 or /hospitals/1.json
  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_path, notice: "Hospital was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hospital_params
      params.require(:hospital).permit(
        :name, :website, :vacant_gen_beds, :occupied_gen_beds, :vacant_o2_beds, :occupied_o2_beds,
        :vacant_icu_beds, :occupied_icu_beds, :vacant_ventilators, :occupied_ventilators,
        identities_attributes: [:id, :identity_type, :value, :_destroy],
        email_addresses_attributes: [:id, :email_type, :email, :_destroy],
        contact_numbers_attributes: [:id, :note, :contact_type, *contact_number_attributes(:number), :_destroy],
        addresses_attributes: [:id, :address_type, :primary, :address_line_1, :address_line_2, :area, :city, :district, :state, :country, :pincode, :_destroy]
      )
    end
end
