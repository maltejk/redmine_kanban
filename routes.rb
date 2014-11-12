if Rails::VERSION::MAJOR >= 3
  resources :kanban do
    put :sync, :on => :member
  end
else
  resource :kanban, :member => {:sync => :put}
end
