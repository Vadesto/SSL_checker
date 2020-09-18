module Entities
  class Link < Grape::Entity
    expose :id, :url, :status
  end
end
