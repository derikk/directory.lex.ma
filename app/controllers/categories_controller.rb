class CategoriesController < ApplicationController
	def index
		@categories = Category.order(:name)
	end
	
	def show
		@category = Category.find(params[:id])
	end
	
	def new
		if params[:admin] == @ADMIN_PASS
			@category = Category.new
		else
			redirect_to categories_path
		end
	end
	
	def edit
		if params[:admin] == @ADMIN_PASS
			@category = Category.find(params[:id])
		else
			redirect_to category_path(Category.find(params[:id]))
		end
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
			params.require(:category).permit(:name, :image, :admin)
		end
end
