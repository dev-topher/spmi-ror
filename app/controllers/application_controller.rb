class ApplicationController < ActionController::Base
    include Pagy::Backend
    def after_sign_in_path_for(resource)
        if current_user && (current_user.role == "student")
            postulacion_path
        else
            dashboard_path
        end
    end
end
