class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user.identities.build unless @user.identities.exists?
    @user.email_addresses.build unless @user.email_addresses.exists?
    @user.contact_numbers.build unless @user.contact_numbers.exists?
    @user.addresses.build unless @user.addresses.exists?
    @user.build_bank_account unless @user.bank_account.present?
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render_failure(@client) }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render_failure(@client) }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :first_name, :last_name,
        identities_attributes: [:id, :identity_type, :value, :_destroy],
        email_addresses_attributes: [:id, :email_type, :email, :_destroy],
        contact_numbers_attributes: [:id, :note, :contact_type, *contact_number_attributes(:number), :_destroy],
        addresses_attributes: [:id, :address_type, :primary, :address_line_1, :address_line_2, :area, :city, :district, :state, :country, :pincode, :_destroy],
        bank_account_attributes: [:id, :account_number, :account_holder_name, :code_type, :code, :branch_name]
      )
    end
end
