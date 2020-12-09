class ContactsController < PortfolioResourcesController

    protected

    def load_portfolio_resources
        load_portfolio_resource
     end
 
     def load_portfolio_resource
        @portfolio.contact || @portfolio.create_contact(phone: "(99)99999-9999", email: "example@example.com.br")
     end
 
     def build_portfolio_resource
         @portfolio.build_contact
     end
 
     def portfolio_resource_params
         params.require(:contact).permit(:phone, :email, :website, :address_country, :address_city)
     end

end
