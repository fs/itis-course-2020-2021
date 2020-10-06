require "sinatra"
require "sinatra/reloader" if development?
require 'pg'
require 'byebug'

configure {set :server, :puma}

conn = PG.connect(dbname: 'sinatra_app', host: 'localhost', user: 'postgres',
  password: 'postgres')

get '/' do
  "Hello world!"
end

get "/todos" do
  @results = conn.exec("SELECT * FROM todos")

  erb :index
end

get "/todos/new" do
  erb :new
end

get "/todos/:id/edit" do
  @result = conn.exec("SELECT * FROM todos WHERE id=#{params['id']}")[0]

  erb :edit
end

get "/todos/:id" do
  @result = conn.exec("SELECT * FROM todos WHERE id=#{params['id']}")[0]

  erb :show
end

post "/todos" do
  if params["custom_method"] == "DELETE"
    result = conn.exec("DELETE FROM todos WHERE id=#{params['id']}")

    redirect to("/todos")
  else
    result = conn.exec("INSERT INTO todos (title) VALUES ('#{params["title"]}') RETURNING id")
    id = result[0]["id"]

    redirect to("/todos/#{id}")
  end
end

post "/todos/:id" do
  if params["custom_method"] == "PUT"
    result = conn.exec("UPDATE todos SET title='#{params['title']}' WHERE id=#{params['id']}")
    id = params["id"]

    redirect to("/todos/#{id}")
  end
end
