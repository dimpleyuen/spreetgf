require 'spree/core/validators/email'
module Spree
  class ContactController < Spree::StoreController

    def deliver_contact_email
      order = params[:order]
      OrderMailer.contact_email(order)

      redirect_to '/shop'
    end
  end
end
