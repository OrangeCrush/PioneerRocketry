class PostsController < ApplicationController
 before_filter :authenticate_user!, :except => [:index]

 #don't auth to allow public access
 #if no one is logged in, don't display private posts
 def index
    if user_signed_in?
       @posts = Post.all.sort{|a,b| b.created_at <=> a.created_at }[0..4]
    else
       @posts = Post.where(:public => true).sort{|a,b| b.created_at <=> a.created_at }[0..4]
    end
 end

 def new
    @post = Post.new
 end

 def create
    @post = Post.new(params[:post])
    if @post.save
       redirect_to posts_path
    end
 end

 def archive
    @posts = Post.all.sort{|a,b| b.created_at <=> a.created_at }
 end
end
