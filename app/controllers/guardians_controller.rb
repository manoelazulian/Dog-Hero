class GuardiansController < ApplicationController
    before_action :find_guardian, except: [:index, :new, :create]

    def index
        @guardians = Guardian.all

        respond_to do |format|
            format.html
            format.json { render json: @guardians }
        end
    end

    def show
    end

    def new
        @guardian = Guardian.new
    end

    def create
        @guardian = Guardian.new(guardian_params)
        
        if @guardian.save
            respond_to do |format|
                format.html { redirect_to guardian_path(@guardian) }
                format.json { render json: @guardian, status: :created }
            end
        else
            respond_to do |format|
                format.html { render 'new' }
                format.json { render json: @guardian.errors, status: :bad_request }
            end
        end
    end

    def edit
    end

    def update
        if @guardian.update(guardian_params)
            respond_to do |format|
                format.html { redirect_to guardian_path(@guardian) }
                format.json { render json: @guardian, status: :ok }
            end
        else
            respond_to do |format|
                format.html { render 'edit' }
                format.json { render json: @guardian.errors, status: :bad_request }
            end
        end
    end

    def destroy
        if @guardian.destroy
            respond_to do |format|
                format.html { redirect_to guardians_path }
                format.json { render json: { message: "removed" }, status: :ok }
            end
        else
            respond_to do |format|
                format.html { redirect_to guardians_path }
                format.json { render json: @guardian.errors, status: :bad_request }
            end
        end
    end

    private

    def find_guardian
        @guardian = Guardian.find(params[:id])
    end

    def guardian_params
        params.require(:guardian).permit(:name)
    end
end
