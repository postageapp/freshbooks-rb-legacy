module FreshBooksLegacy
  class Autobill < FreshBooksLegacy::Base
    define_schema do |s|
      s.string  :gateway_name
      s.object  :card
    end
  end
end