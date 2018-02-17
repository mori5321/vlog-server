class UsersController < ApplicationController
  def sign_in
    user = User.find_by(email: params[:email])
    password = params[:password]
    #TODO: Userを探す → PassWord確認の2工程にする。
    if user.authenticated?(password)
      render json: {token: user.token, user: user.name }
    else
      #TODO: ERRORを返す。
      render plain: 'no auth'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :pwd, :token)
    end
end
