Rails.application.routes.draw do
  namespace :ra do
    resources :sessions
    resources :users, except: [:destroy] do
      post 'upload_avatar', on: :collection
      post 'patient_signup', on: :collection
      get 'check_email_repeat', on: :collection
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
    resources :npis do
      get 'search_doctor', on: :collection
    end
  end
end
