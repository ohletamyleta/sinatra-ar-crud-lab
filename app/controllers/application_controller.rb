
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @new_article = Article.create(params)
    redirect "/articles/#{@new_article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id]) 
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id]) 
    erb :edit 
  end

  patch '/articles/:id' do  #patch do updates
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    erb :show  
  end

  delete '/articles/:id/delete' do
    @article = Article.find_by_id(params[:id])
    @article.delete
    erb :deleted 
  end

end
