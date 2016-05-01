module Api
  class RacersController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
   
    def index
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers"
      end
    end

    def show
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers/#{params[:id]}"
      end
    end
  end
end
