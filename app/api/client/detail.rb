require 'rest-client'

class Client
  class Detail < Grape::API
    resource :client_detail do
      desc "List all clients"
      format:json
      get do
        Client.all
      end

      # desc 'Create a client.'
      # params do
      #   requires :client, type: Hash, desc: 'Client object to create' do
      #     requires :organization_name, type: String, desc: 'Client Organization Name'
      #     requires :email, type: String, desc: 'Client Email'
      #     requires :business_phone, type: String, desc: 'Client business phone'
      #     requires :firstname, type: String, desc: 'Client firstname'
      #     requires :lastname, type: String, desc: 'Client mobile'
      #     requires :mobile, type: String, desc: 'Client business phone'
      #     requires :available_credit_amount, type: Float, desc: 'Client available credit amount'
      #     requires :company, type: Integer, desc: 'Client company'
      #     requires :country, type: String, desc: 'Client country'
      #     requires :currency, type: Integer, desc: 'Client currency'
      #     requires :street_first, type: String, desc: 'Client street1'
      #     requires :street_second, type: String, desc: 'Client street2'
      #     requires :city, type: String, desc: 'Client city'
      #     requires :pincode, type: String, desc: 'Client pincode'
      #     requires :industry, type: String, desc: 'Client industry'
      #     requires :companysize, type: String, desc: 'Client company size'
      #     requires :fax, type: String, desc: 'Client fax' 
      #     requires :internal_notes, type: String, desc: 'Client internal_notes'
      #   end
      #   requires :client_contacts, type: Array, desc: 'Client contacts object to create' do
      #     requires :id,type: Integer, desc: 'Client contact ID'
      #     requires :client_id,type: Integer, desc: 'Client ID'
      #     requires :contact_email,type: String, desc: 'Client contact email'
      #     requires :contact_name,type: String, desc: 'Client contact name'
      #     requires :contact_phone,type: String, desc: 'Client contact phone'
      #     requires :contact_mobile,type: String, desc: 'Client contact mobile'
      #   end
      # end
      post do          
        client = Client.create({
          organization_name: params[:client][:organization_name],
          email: params[:client][:email],
          business_phone: params[:client][:business_phone],
          firstname: params[:client][:firstname],
          lastname: params[:client][:lastname],
          mobile: params[:client][:mobile],
          available_credit_amount: params[:client][:available_credit_amount],
          company: params[:client][:company],
          country: params[:client][:country],
          currency: params[:client][:currency],
          street_first: params[:client][:street_first],
          street_second: params[:client][:street_second],
          city: params[:client][:city],
          state: params[:client][:state],
          pincode: params[:client][:pincode], 
          industry: params[:client][:industry],
          companysize: params[:client][:companysize],
          fax: params[:client][:fax],
          internal_notes: params[:client][:internal_notes]})
        ClientContact.create({
              id: params[:client][:client_contacts][:id],
              client_id:client.id,
              contact_email:params[:client][:client_contacts][:contact_email],
              contact_name:params[:client][:client_contacts][:contact_name],
              contact_phone:params[:client][:client_contacts][:contact_phone],
              contact_mobile:params[:client][:client_contacts][:contact_mobile]})
      end
      
      

    

      # get ':id' do
      #   Client.find(params[:id])
      # end

      # get ':firstname' do
      #   result = Client.find_by_firstname(params[:firstname])
      #   cc = ClientContact.where(client_id: result.id)
      #   cc.each do |contact|
      #     if result.id == contact.client_id
      #       ClientContact.all
      #     end
      #   end
      # end


      get ':id/contact/:contact_mobile' do
      # http://localhost:3000/api/v1/client_detail/263/contact/8877889909
        vvv = params[:contact_mobile]
        result = Client.find(params[:id])
        p result.client_contacts.where(client_id: result.id,contact_mobile: vvv)
      end

    #   # post '/create' do
    #   #   p 'kkkkkkkkkkkkkkkkkkkkkkk'
    #   #   Client.new(params(:organization_name,
    #   #                              :email, :business_phone,
    #   #                              :firstname, :lastname,
    #   #                              :mobile, :available_credit_amount,
    #   #                              :company, :country, :currency,
    #   #                              :street_first, :street_second,
    #   #                              :city, :state, :pincode, :industry,
    #   #                              :companysize,
    #   #                              :fax, :internal_notes))
    #   # end

    #   # put ':id' do
    #   #   Client.find(params[:id]).update({
    #   #     organization_name: params[:organization_name],
    #   #     email: params[:email]
    #   #   })
    #   # end

    #   #  delete ':id' do
    #   #   Client.find(params[:id]).destroy
    #   # end

    end


    resource :rest_client do
      format:json
      get do
        response =RestClient.get 'https://jsonplaceholder.typicode.com/posts/'
        code = response.code
        cookie = response.cookies
        headers = response.headers
        content = JSON.parse(response.body)
        content.each do |key, value|
          userId = key['userId']
          id = key['id']
          title = key['title']
          body = key['body']
          # p body
          vs = ClientPost.create({name:'Riverstone',title: title,content: body})
          # p vs
        end
      end
    end


  end
end
