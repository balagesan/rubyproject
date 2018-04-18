class Client
  class Detail < Grape::API
    resource :client_detail do
      desc "List all clients"
      format:json
      get do
        Client.all
      end

       get ':id' do
        Client.find(params[:id])
      end

      put ':id' do
        Client.find(params[:id]).update({
          organization_name: params[:organization_name],
          email: params[:email]
        })
      end

       delete ':id' do
        Client.find(params[:id]).destroy
      end

    end
  end
end
