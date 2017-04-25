class ItemsController < ApplicationController
before_action :find_items, only: [:show, :edit,:update ,:destroy]

	def index
		if user_signed_in?
		@items = Item.where(:user_id => current_user.id).order("created_at DESC")
	end
	end 



	def new 
		@item = current_user.items.build
	end 
	#create action happens in the new

	def create
		@items = current_user.items.build(item_params) 
		if @items.save
			redirect_to root_path
		else 
			render 'new'
		end

	end 

	def edit 
		
	end 

	def update
		if @item.update(item_params)
			redirect_to item_path(@item) 
		else 
			render "edit"
		end
	end 

	def show
	end 

	def destroy 
		@item.destroy 
		redirect_to root_path
	end 

	private 
	def item_params 
		params.require(:item).permit(:title,:description)
	end 
	def find_items 
		@item = Item.find(params[:id])
	end


end
