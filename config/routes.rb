Rails.application.routes.draw do
  mount Karafka::Web::App, at: '/karafka'
end
