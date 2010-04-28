module FreshBooks
  class Recurring < FreshBooks::Base
    define_schema do |s|
      s.date    :date
      s.fixnum  :client_id,
                :recurring_id,
                :po_number,
                :occurences
      s.float   :discount,
                :amount
      s.string  :frequency,
                :currency_code,
                :notes,
                :terms,
                :first_name,
                :last_name,
                :organization,
                :p_street1,
                :p_street2,
                :p_city,
                :p_state,
                :p_country,
                :p_code,
                :vat_name,
                :vat_number,
                :return_uri
      s.string  :status, :read_only => true
      s.boolean :send_email,
                :send_snail_mail,
                :stopped
      s.object  :autobill
      s.array   :lines
    end
    
    actions :list, :get, :create, :update, :delete
  end
end