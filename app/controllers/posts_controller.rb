class PostsController < ApplicationController
   before_filter :authenticate_user!, :except => [:index]

   #don't auth to allow public access
   #if no one is logged in, don't display private posts
   #Control the size of the page by counting the number of psots with an image.
   def index
      if user_signed_in? 
         temp = Post.all.sort{|a,b| b.created_at <=> a.created_at }[0..3]
         if temp.select{|x| x.image != ''}.size > 2
            limit = 2
         else
            limit = 3
         end
         @posts = Post.all.sort{|a,b| b.created_at <=> a.created_at }[0..limit] 
      else
         temp = Post.where(:public => true).sort{|a,b| b.created_at <=> a.created_at }[0..3]
         if temp.select{|x| x.image != ''}.size > 2
            limit = 2
         else
            limit = 3
         end
         @posts = Post.where(:public => true).sort{|a,b| b.created_at <=> a.created_at }[0..limit]
      end
   end

   def new
      @post = Post.new
   end

   def create
      @post = Post.new(params[:post])
      @post.posted_by = /[a-z0-9_]*@/i.match(current_user.email).to_s[0..-2]
      if @post.save
         redirect_to posts_path
      end
   end

   def archive
      if user_signed_in?
         @posts = Post.all.sort{|a,b| b.created_at <=> a.created_at }
      else
         @posts = Post.where(:public => true).sort{|a,b| b.created_at <=> a.created_at }
      end
   end

   def edit
      if ['ADMIN'].include?(current_user.role)
         @post = Post.find(params[:id])
      end
   end

   def update
      if ['ADMIN'].include?(current_user.role)
         @post = Post.find(params[:id])
         @post.update_attributes(params[:post])
         redirect_to posts_path
      end
   end

end
