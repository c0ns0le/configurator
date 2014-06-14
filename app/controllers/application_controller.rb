class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :except => ['set_current_user']


   class << self
    Swagger::Docs::Generator::set_real_methods

    def inherited(subclass)
      super
      subclass.class_eval do
        setup_basic_api_documentation(subclass)
      end
    end

    private
    def setup_basic_api_documentation(subclass)
      [:create, :update].each do |api_action|
        swagger_api api_action do
          param :header, 'Authentication-Token', :string, :required, 'Authentication token'
        end
      end

      create_show_doc(subclass.name.gsub('Controller', '').singularize)
      create_index_doc(subclass.name.gsub('Controller', '').singularize)
      create_delete_doc( subclass.name.gsub('Controller', '').singularize)

    end

    def create_show_doc(class_name)
      swagger_api :show do
        summary "Fetches a single #{class_name}"
        param :path, :id, :integer, :required, "#{class_name} Id"
        response :unauthorized, :string
        response :not_acceptable, :string
      end
    end

     def create_delete_doc(class_name)
      swagger_api :delete do
        summary "Deletes a single #{class_name}"
        param :path, :id, :integer, :required, "#{class_name} Id"
        response :unauthorized, :string
        response :not_acceptable, :string
      end
    end

    def create_index_doc(class_name)
      swagger_api :index do
        summary "Fetches a list of #{class_name.pluralize}"
        response :unauthorized, :string
        response :not_acceptable, :string
      end
    end

  end
end
