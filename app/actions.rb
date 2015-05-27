
=begin
helpers do
    def current_user
      @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
end 

#Check whether or not there is a user logged
before do
    redirect '/login' if !current_user && request.path != '/login' && request.path !='/signup'
end
=end

# Homepage (Root path)
get '/' do
    @pins = Pin.all.reverse
    erb :index
end

=begin
#User login form
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

#New user signup form
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

#User profile editor
get '/profile/edit' do
    current_user
    erb :profile
end

post '/profile/edit' do
    first = params[:first]
    last = params[:last]
    username = params[:username]
    state = params[:state]
    password = params[:password]

    current_user.update(first: first, last: last, username: username, state: state, password: password)
    redirect '/'
end

#New pins
get '/pins/new' do
  erb :new_pin
end

post '/pins/create' do
    title = params[:title]
    url = params[:url]
    
    new_pin = current_user.pins.create(title: title, url: url)
    redirect "/pins/#{new_pin.id}"
end

get '/pins/:id' do
    @pin = Pin.find(params[:id])
    erb :pins
end
=end