# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    #バリデーションチェック
     unless @user.valid?
       render :new and return
     end
    #入力内容をッションに保持
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    #weddingのインスタンス生成、遷移
    @wedding = @user.build_wedding
    render :new_wedding
  end

  def create_wedding
    @user = User.new(session["devise.regist_data"]["user"])
    @wedding = Wedding.new(wedding_params)
    #バリデーションチェック
     unless @wedding.valid?
       render :new_wedding and return
     end
    #userとweddingとcommunityをまとめてユーザー情報として保存
    @user.build_wedding(@wedding.attributes)
    @user.save
    #セッション削除、ログイン
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  private
 
  def wedding_params
    params.require(:wedding).permit(:gloom_name, :bride_name, :gloom_name_en, :bride_name_en, :date, :answer_date, :message, :message_info, :location, :url, :address, :reception_time, :wedding_time, :photo_time, :party_time, :bye_time, :second_party_time)
  end

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

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

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
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
