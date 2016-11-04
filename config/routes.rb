Rails.application.routes.draw do

  resources :studsubquestionanswers
  resources :studsubanswers
  resources :faculties
  resources :programmes
  resources :levelofstudies
  resources :yearofstudies
  resources :subquestionanswers
  resources :subanswers
  resources :answers do
    collection do
      get 'new_create' 
      post 'submit_create'
      
      get 'create_subAnswer'
      get 'create_subQuestion'
      get 'remove_createSub' 
          
      post 'create_edit_answer_change'
      post 'create_edit_subanswer_change'
      post 'create_edit_subanswers_change' #subanswer's Answer     
      post 'create_edit_answer_subquestion_change'
      post 'create_edit_subquestion_change'
      post 'create_edit_subquestionanswers_change' #subquestion's Answer
      get 'create_subQuestionAnswer_change'
    end
  end
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
      get 'displayPie' #report_test_reports_path
      get 'displayHorizonBar'
      get 'displayVerticalBar'
      get 'horizonbar'
    end
  end
  resources :forms do
    collection do 
                    #----------SURVEY CREATION----------#
                    
        # renders =>_layout_newForm => submit_create_survey            
      get 'create_survey' #create_survey_forms_path 
         
        # renders =>_layout_createSections => _layout_newSection => submit_create_section
        # and
        # renders => create_question_display_section
      post 'submit_create_survey'
      
       # renders =>_layout_createSections => _layout_newSection => submit_create_section
      get 'create_render_new_section' #create_render_new_section_forms_path
      
       # renders => create_render_new_section_forms_path
      post 'submit_create_section'
      
      
      # renders => create_question_display
      get 'create_question_display_section' #create_question_display_section_forms_path
      
      # renders => layout_questionAddButton => question_creation
      # and
      # renders => layout_questionList => create_render_answer
      get 'create_question_display' #question_display_forms_path
      
      # renders => Questions#newCreate => newQuestion
      get 'create_render_question' #question_creation_forms_path
      
      
      # renders => Answers#newCreate => newAnswer
      get 'create_render_answer' #create_render_answer_forms_path
      get 'create_render_subanswer' 
      get 'create_render_subquestion' 
      get 'create_render_subquestionanswer'
      
      get 'create_edit_answer'  
      get 'create_edit_subanswer' 
      get 'create_edit_subanswer_answer'
      get 'create_edit_answer_subquestion'
      get 'create_edit_subquestion'
      get 'create_edit_subquestion_answer'
     
      #done
      get 'create_question_remove'
      get 'create_answer_remove'
      get 'create_subanswer_remove'
      get 'create_subquestion_remove'
      get 'create_subquestionanswer_remove'
      
    
    end
  end
   
   
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
  resources :advertisements do
    collection do
      put :updateadvertassocite
      get :editassociate
      get :deleteassociate ,as: :deleteassoc
    end
  end
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
