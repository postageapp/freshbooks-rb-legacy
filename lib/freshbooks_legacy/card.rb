module FreshBooksLegacy
  class Card < FreshBooksLegacy::Base
    define_schema do |s|
      s.string  :number,
                :name
      s.object  :expiration
    end
  end
end