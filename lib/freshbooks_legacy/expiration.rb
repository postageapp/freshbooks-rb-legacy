module FreshBooksLegacy
  class Expiration < FreshBooksLegacy::Base
    define_schema do |s|
      s.fixnum  :month,
                :year
    end
  end
end