module AuthlogicOauth
  module Helper
    def oauth_register_button(options = {})
      oauth_button('register_with_oauth', options)
    end
    
    def oauth_login_button(options = {})
      oauth_button('login_with_oauth', options)
    end

    def oauth_register_image_button(image, options = {})
      oauth_image_button('register_with_oauth', image, options)
    end
    
    def oauth_login_image_button(image, options = {})
      oauth_image_button('login_with_oauth', image, options)
    end
  
  private
    def oauth_button(name, options = {})
      submit_tag(options[:value], :name => name, :id => 'user_submit', :class => options[:class])
    end

    def oauth_image_button(name, image, options = {})
      image_submit_tag(image, :name => name, :id => 'user_submit', :class => options[:class])
    end
  end
end
