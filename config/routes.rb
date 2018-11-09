Rails.application.routes.draw do
  get 'student/new'
  root 'users#show'
   get 'teacher/new'
   resources :teacher
end
