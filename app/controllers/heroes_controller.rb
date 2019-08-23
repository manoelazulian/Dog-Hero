class HeroesController < ApplicationController
    before_action :find_hero, except: [:index, :new, :create]

    def index
        @heroes = Hero.all

        respond_to do |format|
            format.html
            format.json { render json: @heroes }
        end
    end

    def show
    end

    def new
        @hero = Hero.new
    end

    def create
        @hero = Hero.new(hero_params)
        
        if @hero.save
            respond_to do |format|
                format.html { redirect_to hero_path(@hero) }
                format.json { render json: @hero, status: :created }
            end
        else
            respond_to do |format|
                format.html { render 'new' }
                format.json { render json: @hero.errors, status: :bad_request }
            end
        end
    end

    def edit
    end

    def update
        if @hero.update(hero_params)
            respond_to do |format|
                format.html { redirect_to hero_path(@hero) }
                format.json { render json: @hero, status: :ok }
            end
        else
            respond_to do |format|
                format.html { render 'edit' }
                format.json { render json: @hero.errors, status: :bad_request }
            end
        end
    end

    def destroy
        if @hero.destroy
            respond_to do |format|
                format.html { redirect_to heroes_path }
                format.json { render json: { message: "removed" }, status: :ok }
            end
        else
            respond_to do |format|
                format.html { redirect_to heroes_path }
                format.json { render json: @hero.errors, status: :bad_request }
            end
        end
    end

    private

    def find_hero
        @hero = Hero.find(params[:id])
    end

    def hero_params
        params.require(:hero).permit(:name, :mail, :phone, :address, :about)
    end
end
