class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"], password: params["password"])
    if @user
      session[:id] = @user.id
      redirect '/users/home'
    else
      redirect 'sessions/login'
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  get '/users/home' do
<<<<<<< HEAD
     @user = User.find(session[:id])
=======
    @user = User.find(session[:id])
>>>>>>> 6a790c4483c81cc09f02452a75dacd5497071c7e
    erb :'/users/home'
  end

end
