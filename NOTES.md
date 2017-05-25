Plan for upcoming Project:

<!--1. Create Rails App-->
2. Add Devise 
    <!--created user with devise-->
    https://learn.co/tracks/full-stack-web-dev-with-react/rails/authentication/devise-lab?batch_id=306&track_id=23144
    add omniauth (maybe google) 
    add gem
    add fields to user column --> provider:index uid:index
    <!--add devise alerts to layouts-->
    And add the Omniauth configuration to config/initializers/devise.rb:
   
    Some setup you must do manually if you haven't yet:

      1. Ensure you have defined default url options in your environments files. Here
        is an example of default_url_options appropriate for a development environment
        in config/environments/development.rb:

          config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

        In production, :host should be set to the actual host of your application.

      2. Ensure you have defined root_url to *something* in your config/routes.rb.
        For example:

          root to: "home#index"

      3. Ensure you have flash messages in app/views/layouts/application.html.erb.
        For example:

          <p class="notice"><%= notice %></p>
          <p class="alert"><%= alert %></p>

      4. You can copy Devise views (for customization) to your app by running:

          rails g devise:views


3. Push to Heroku
   setting export secret etc to heroku https://devcenter.heroku.com/articles/config-vars
4. Models --- 
5. CanCan
    https://learn.co/tracks/full-stack-web-dev-with-react/rails/authentication/cancan?batch_id=306&track_id=23144
    https://github.com/CanCanCommunity/cancancan
5. Move navbar to it's own partial
6. Move alerts to it's own partial