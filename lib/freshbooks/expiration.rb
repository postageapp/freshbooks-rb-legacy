module FreshBooks
  class Expiration < FreshBooks::Base
    define_schema do |s|
      s.fixnum  :month,
                :year
    end
  end
end