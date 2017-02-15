module FreshBooksLegacy
  class Card < FreshBooksLegacy::Base
    define_schema do |s|
      s.string  :number,
                :name
      s.string :cc_token
      s.object  :expiration
    end
  end
end