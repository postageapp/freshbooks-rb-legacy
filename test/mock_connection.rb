require 'freshbooks_legacy/connection'

class MockConnection < FreshBooksLegacy::Connection
  def initialize(response_body)
    @response_body = response_body
  end
  
protected
  
  def post(request_body)
    @response_body
  end
end
