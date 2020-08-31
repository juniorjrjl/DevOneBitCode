class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    include Pundit

    rescue_from Pundit::NotAuthorizedError do
        respond_to do |f|
            f.html { redirect_to root_path, flash: { error: 'Unauthorized' } }
        end
    end
end
