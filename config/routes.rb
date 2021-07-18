Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: redirect('/home')
  get 'home', to: 'pages#home', as: 'home'

  # Admin and Report
  get 'reports', to: 'reports#index', as: 'reports'
  delete 'reports/:id', to: 'reports#destroy', as: 'report'

  # Guideline
  get 'guidelines', to: 'guidelines#index', as: 'guidelines'
  post 'guidelines', to: 'guidelines#create'
  get 'guidelines/new', to: 'guidelines#new', as: 'new_guideline'
  delete 'guidelines/:id', to: 'guidelines#destroy', as: 'guideline'

  # Profile
  get 'users/:id', to: 'users#index', as: 'user'
  delete 'users/:id', to: 'users#destroy'

  # Feed and Post
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  post 'users/:user_id/posts', to: 'posts#create'
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  delete 'users/:user_id/posts/:id', to: 'posts#destroy', as: 'user_post'
  patch 'users/:user_id/posts/:id', to: 'posts#update'
  get 'users/:user_id/posts/:id/edit', to: 'posts#edit', as: 'edit_user_post'

  # Comment
  get 'users/:user_id/posts/:post_id/comments', to: 'comments#index', as: 'user_post_comments'
  post 'users/:user_id/posts/:post_id/comments', to: 'comments#create'
  get 'users/:user_id/posts/:post_id/comments/new', to: 'comments#new', as: 'new_user_post_comment'
  delete 'users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy', as: 'user_post_comment'

  # React
  post 'users/:user_id/posts/:post_id/reacts/like', to: 'reacts_like#create', as: 'user_post_react_likes'
  post 'user/:user_id/posts/:post_id/reacts/dislike', to: 'reacts_dislike#create', as: 'user_post_react_dislikes'

  # User and Report
  get 'users/:user_id/posts/:post_id/reports/new', to: 'reports_post#new', as: 'new_post_report'
  post 'users/:user_id/posts/:post_id/reports', to: 'reports_post#create', as: 'user_post_reports'
  get 'users/:user_id/posts/:post_id/comments/:comment_id/reports/new', to: 'reports_comment#new', as: 'new_post_comment_report'
  post 'users/:user_id/posts/:post_id/comments/:comment_id/reports', to: 'reports_comment#create', as: 'user_post_comment_reports'

  # Search and Add friends
  get 'users/:user_id/friends', to: 'friends#index', as: 'user_friends'
  get 'users/:user_id/requests/:requestee_id', to: 'friends#create', as: 'user_request_pending'

  # Receive friend requests
  get 'users/:user_id/requests', to: 'requests#index', as: 'user_requests'
  post 'users/:user_id/requests/:requester_id', to: 'friends#update', as: 'user_request_accepted'
  delete 'users/:user_id/requests/:requester_id', to: 'friends#destroy', as: 'user_friend'

  # Message
  get 'users/:user_id/friends/:friend_id/message', to: 'messages#show', as: 'user_friend_message'
  post 'users/:user_id/friends/:friend_id/messages', to: 'messages#create', as: 'user_friend_messages'
  
end