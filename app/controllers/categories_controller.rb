class CategoriesController < ApplicationController
	before_action :check_admin!, except: [ :index, :show ]

	def index
		@categories = Category.order(:name)
	end
	
	def show
		@category = Category.find(params[:id])
	end
	
	def new
		@category = Category.new
	end
	
	def edit
		@category = Category.find(params[:id])
	end
	
	def create
		@category = Category.new(category_params)
		
		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end
	
	def update
		@category = Category.find(params[:id])
		
		if @category.update(category_params)
			redirect_to @category
		else
			render 'edit'
		end
	end
	
	private
		def category_params
			params.require(:category).permit(:name, :image)
		end

		def check_admin!
			unless session[:password] == @ADMIN_PASS
				redirect_to categories_path
				flash[:error] = "You're not logged in'"
				return false
			end
		end
end
