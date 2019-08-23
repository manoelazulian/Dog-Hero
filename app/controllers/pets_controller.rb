class PetsController < ApplicationController
    before_action :find_pet, except: [:index, :new, :create]

    def index
        @pets = Pet.all

        respond_to do |format|
            format.html
            format.json { render json: @pets }
        end
    end

    def show
    end

    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.new(pet_params)
        
        if @pet.save
            respond_to do |format|
                format.html { redirect_to pet_path(@pet) }
                format.json { render json: @pet, status: :created }
            end
        else
            respond_to do |format|
                format.html { render 'new' }
                format.json { render json: @pet.errors, status: :bad_request }
            end
        end
    end

    def edit
    end

    def update
        if @pet.update(pet_params)
            respond_to do |format|
                format.html { redirect_to pet_path(@pet) }
                format.json { render json: @pet, status: :ok }
            end
        else
            respond_to do |format|
                format.html { render 'edit' }
                format.json { render json: @pet.errors, status: :bad_request }
            end
        end
    end

    def destroy
        if @pet.destroy
            respond_to do |format|
                format.html { redirect_to pets_path }
                format.json { render json: { message: "removed" }, status: :ok }
            end
        else
            respond_to do |format|
                format.html { redirect_to pets_path }
                format.json { render json: @pet.errors, status: :bad_request }
            end
        end
    end

    private

    def find_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :size)
    end
end
