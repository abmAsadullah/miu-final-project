class ClassjoinsController < ApplicationController
    # before_action :authenticate_user!, except: %i[show index]
    def index
        @classjoins = Classjoin.all
    end
    
    def show
        @classjoin = Classjoin.find(params[:id])
    end
    
    def new
        @classjoin = Classjoin.new
    end
    
    def create
        @classjoin = current_user.classjoins.build(classjoin_params)
        @classjoin.creator = current_user
        if @classjoin.save
        redirect_to @classjoin
        else
        render :new
        end
    end
    
    private
    
    def classjoin_params
        params.require(:event).permit(:topic, :details, :time)
    end
end
