class BusinessesController < ApplicationController
	#TODO: Rename business => listing?
	def index
		@businesses = Business.order(:name)
	end
	
	def show
		@business = Business.find(params[:id])
	end
	
	def new
		if params[:admin] == @ADMIN_PASS
			@business = Business.new
		else
			redirect_to businesses_path
		end
	end
	
	def edit
		if params[:admin] == @ADMIN_PASS
			@business = Business.find(params[:id])
		else
			redirect_to business_path(Business.find(params[:id]))
		end
	end
	
	def create
		@business = Business.new(business_params)
		
		if @business.save
			redirect_to @business
		else
			render 'new'
		end
	end
	
	def update
		@business = Business.find(params[:id])
		
		if @business.update(business_params)
			redirect_to @business
		else
			render 'edit'
		end
	end
	
	def destroy
		@business = Business.find(params[:id])
		@business.destroy
		
		redirect_to businesses_path
	end
	
	def search
		@businesses = Business.where(['name ILIKE ? OR description ILIKE ?'] + ['%' + params[:q] + '%']*2)\
		| (Category.where('name ILIKE ?', '%' + params[:q] + '%').map {|cat| cat.businesses}).flatten  # Union of sets
	end
	
	private
		def business_params
			params.require(:business).permit(:name, :address, :phone, :fax, :website, :premium, :image, :description, :hours, :reservation, :category_id)
		end
	
	
end
