Rails.application.routes.draw do
  get 'parents/new'
  get 'student/new'
  root 'users#show'
   get 'teacher/new'
   resources :teacher
   resources :student
   resources :parents
end
