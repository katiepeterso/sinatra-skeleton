# Homepage (Root path)
helpers do
    def current_user
      @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
end  

get '/' do
    erb :index
end

get '/login' do
    erb :login
end

post '/login' do
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user.password == password
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/login'
    end
end

get '/logout' do
    erb :logout
end

get '/signup' do
    erb :signup
end

post '/signup' do
    first = params[:first]
    last = params[:last]
    username = params[:username]
    state = params[:state]
    password = params[:password]

    user = User.find_by(username: username)
    if user
      redirect '/login'
    else
      user = User.create(first: first, last: last, username: username, state: state, password: password)
      session[:user_id] = user.id
      redirect '/'
    end
end

get '/profile' do
    erb :profile
end

post '/profile' do
    redirect '/'
end

get '/pins/new' do
  erb :new_pin
end

post '/pins/create' do
    title = params[:title]
    url = params[:url]
    
    current_user.pins.create(title: title, url: url)
    redirect '/'
end