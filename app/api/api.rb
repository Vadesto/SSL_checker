class API < Grape::API
  format :json

  desc 'Returns urls and their statuses'
  get :status do
    Link.all.select("url, status")
  end

  desc 'Adds domain to the list'
  post :domain do
    Link.create!(url: params[:url])
  end
end
