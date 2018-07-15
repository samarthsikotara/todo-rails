namespace :dashboard do
	resources :projects do
		member do
			get 'tasks' => 'projects#tasks'
		end
	end
	post 'login' => "login#login"
	post 'logout' => "login#logout"
	post 'users' => "login#create"
	resources :tasks
end