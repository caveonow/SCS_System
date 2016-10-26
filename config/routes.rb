Rails.application.routes.draw do

  resources :studsubquestionanswers
  resources :studsubanswers
  resources :faculties
  resources :programmes
  resources :levelofstudies
  resources :yearofstudies
  resources :subquestionanswers
  resources :subanswers
  resources :answers
  resources :subquestions
  resources :questions do
    collection do
      get 'new_create' #new_create_questions_path
      post 'submit_create'
    end
  end
  resources :sections
  resources :reports do
    collection do
   #   get 'report_test' #report_test_reports_path
    end
  end
  resources :forms do
    collection do 
      get 'create_survey' #create_survey_form_path 
      get 'section_display' #section_display_form_path
      post 'submit_create_survey'
      
      get 'render_section'
      #change this later with correct path
      #get 'create_section'
      post 'submit_create_section'
    end
  end
    #---------------------------------- FORM CREATION ----------------------------------#
    # get '/form_create' => 'forms#createForm',   as: 'form_create'
    #---------------------------------- FORM CREATION ----------------------------------#
   
   
   #---------------------------------- FORM ANSWERING ----------------------------------#
    get '/form_view'      => 'forms#viewForm',    as: 'form_view'
    get '/form_select'    => 'forms#selectForm',    as: 'form_select'
    get '/form_start'     => 'forms#startForm',   as: 'form_start'
    get '/form_displayQ'   => 'forms#displayQ', as: 'form_display_question'
    get '/form_displaySQ' => 'forms#displaySubQ', as: 'form_display_subquestion'
    get '/form_displaySA' => 'forms#displaySubA', as: 'form_display_subanswer'
    post '/form_saveAns'  => 'forms#saveAns', as: 'form_saveAns'
    post '/form_saveSAns'  => 'forms#saveSAns', as: 'form_saveSAns'
    post '/form_saveSQAns'  => 'forms#saveSQAns', as: 'form_saveSQAns'
    post '/form_saveAnsForSubs'  => 'forms#saveAnsForSubs', as: 'form_saveAnsForSubs'
    #---------------------------------- FORM ANSWERING ----------------------------------#  
  resources :studanswers
  resources :formanswers

  devise_for :users
    scope "/admin" do
    resources :users do
      collection do
        get :editmuluser
        put :updatemuluser
      end
    end
  end
  
  authenticated :user do
    root :to => 'welcome#index', as: :authenticated_root
  end
  
  resources :products do
    collection do
      post :import
    end
  end
  
  get 'welcome/index'
  root :to => 'welcome#index'
  
  resources :user_imports
  resources :roles
  resources :backgrounds
  resources :translators do
    collection do
      get :editmultranslate
      put :updatemultranslate
    end
  end

  # advertisement
  resources :bannerslides
  put 'bannerslides', to: 'bannerslides#activebanner', as: :selectBss
  resources :advertisements
  put 'advertisements', to: 'advertisements#activeadvertisement', as: :selectAds
  #get 'home' => 'advertisements#index'
  #get 'signup' => 'students#new'
  #get 'login'  => 'sessions#new'
  #post 'login' => 'sessions#create'
  #delete 'logout' => 'sessions#destroy'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
