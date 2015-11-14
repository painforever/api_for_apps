Rails.application.routes.draw do
  namespace :ra do
    resources :sessions
    resources :users, except: [:destroy] do
      post 'upload_avatar', on: :collection
      post 'patient_signup', on: :collection
      get 'check_email_repeat', on: :collection
      post 'update_password', on: :collection
    end
    resources :patient_prescriptions
    resources :adverse_event_reportings, except: :destroy
    resources :patients, except: [:destroy] do
      post "joint_report", on: :collection
    end
    resources :pharmacies, except: [:destroy, :update] do
      get 'find_pharmacies', on: :collection
    end

    resources :ndcs, only: [:index, :show]
    resources :medications, only: [:show, :index] do
      get 'find_by_drug_name', on: :collection
      post 'upload_drug_photo', on: :collection
    end
  end

  namespace :my_rx_tracking do
    resources :sessions
    resources :reminders
    resources :coupons
    resources :npis do
      get 'search_doctor', on: :collection
    end
    resources :patient_provider_assignments do
      get 'can_add', on: :collection
    end

    resources :patient_reported_medications
    resources :medications do
      get 'search_drug', on: :collection
      post 'upload_drug_photo', on: :collection
      post 'update_drug_remote_url', on: :collection
      post 'take_drug', on: :collection
      get 'async_search_drug', on: :collection
    end

    resources :rxs
    resources :profiles do
      patch 'update_profile', on: :collection
      post 'upload_avatar', on: :collection
    end
    resources :users do
      post 'patient_signup', on: :collection
      get 'check_email_repeat', on: :collection
      post 'add_temp_password', on: :collection
    end
    resources :adverse_event_reportings
  end

  namespace :copd do
    resources :sessions
    resources :labresults
    resources :adverse_event_reportings do
      get 'search_drug', on: :collection
    end

    resources :excerbations
    resources :rxs
    resources :patient_reported_conditions
  end

  namespace :diabetes do
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create, :show, :update] do
      post 'patient_signup', on: :collection
      get 'check_email_repeat', on: :collection
    end
    resources :labs
    resources :rxs
    resources :medications
  end
end
