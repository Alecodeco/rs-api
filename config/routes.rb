Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000"

  namespace 'api', defaults: {format: 'json'} do
    mount_devise_token_auth_for 'User', at: 'auth/users', controllers: {
      registrations: 'api/auth/registrations',
      passwords:     'api/auth/passwords'
    }

    get 'topics', action: :index, controller: 'topics'
  end

end
