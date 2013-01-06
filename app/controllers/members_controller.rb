class MembersController < ApplicationController
   before_filter :authenticate_user!
   def index
      @users = User.all
   end


   def edit
      if ['ADMIN'].include?(current_user.role)
         @user = User.find(params[:id])
      end
   end

   def update
      if ['ADMIN'].include?(current_user.role)
         @user = User.find(params[:id])
         @user.update_attributes(params[:user])
      end
   end
end
