class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  mount Client::Detail
end
