class Dashboard::LoginController < DashboardController

	def login
		@user, token = ::User.authenticate(params[:email], params[:password])
	  if @user
	  	render json: {:token => token, :user => {uuid: @user.uuid, name: @user.name, email: @user.email}}
	  else
	    render json: {:user => {}, :message => "Invalid Username or Password"}, status: 400
	  end
  end

  def logout
  	token = params[:token]
  	user_id = Resque.redis.get("user:token:#{token}")
		Resque.redis.del("user:set_token:#{user_id}")
		Resque.redis.del("user:token:#{token}")
		render json: {message: "Logged out successfully"}
  end

  def create
	  @user = ::User.new(note_params)
	  if @user.save
	  	@user.reload
	    render json: UserSerializer.new(@user)
	  else
	    render json: {:message => "#{@user.errors.full_messages}"}
	  end
	end

	private
	def note_params
	  params.require(:user).permit(:email, :password,:password_confirmation)
	end

end