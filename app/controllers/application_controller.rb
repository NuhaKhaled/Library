    class ApplicationController < ActionController::Base  
      protect_from_forgery
        force_ssl    
      
      private  
      
      def current_user 
      #  @current_user=nil
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
      end
    def value=(variable)
           @value = variable
      end
      def value
        @value
      end



       helper_method :value=
       helper_method :value  
       helper_method :current_user  
    end  