class API < Grape::API
  format :json

  desc 'Returns urls and their statuses'
  get :status do
    links = Link.all
    present links, with: API::Entities::Link
  end

  desc 'Adds domain to the list'
  post :domain do
    link = Link.create!(url: params[:url])
    present link, with: API::Entities::Link
  end
end
