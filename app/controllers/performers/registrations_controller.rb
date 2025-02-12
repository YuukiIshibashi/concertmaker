class Performers::RegistrationsController < Devise::RegistrationsController
  after_filter :no_flash
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

   #PUT /resource
  #  def update
  #    respond_to do |format|
  #   if @performer.update(configure_account_update_params) && @performer.movie.recreate_versions!
  #     format.html { redirect_to performer_mypage_index_path(@performer), notice: 'Article was successfully updated.' }
  #     format.json { head :no_content }
  #   else
  #     format.html { render action: 'edit' }
  #     format.json { render json: @performer.errors, status: :unprocessable_entity }
  #   end
  # end
  #  end

  # DELETE /resource
  # def destroy
  #   super
  # end
  #
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   params.require(:performer).permit(:name, :email, :prefecture_id, :jenre_id, :message, :avatar_cache, :password, :password_confirmation, :current_password, :movie, :current_password)
  #   # devise_parameter_sanitizer.permit(:account_update, keys: [:performer])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  protected
  def no_flash
    if flash[:notice].present?
      flash.delete(:notice)
    end
  end
end
