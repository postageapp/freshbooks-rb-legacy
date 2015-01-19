require File.dirname(__FILE__) + '/test_helper.rb'

# this tests a live conection
class LiveConnectionTest < Test::Unit::TestCase
  fixtures :freshbooks_credentials
  
  def setup
    fb_account_info = freshbooks_credentials(:fresh_books_test_account)
    FreshBooksLegacy::Base.establish_connection(fb_account_info['account_url'], fb_account_info['api_key'])
  end

  # just go out there and get a live connection and see if it returns anything
  def test_live_connection_with_start_session
    FreshBooksLegacy::Base.connection.start_session do
      clients = FreshBooksLegacy::Client.list("per_page" => 1)
      FreshBooksLegacy::Invoice.list("per_page" => 100).collect do |invoice|
        assert FreshBooksLegacy::Invoice.get(invoice.invoice_id)
      end 
    end
  end
  
  def test_live_connection_without_start_session
    clients = FreshBooksLegacy::Client.list("per_page" => 1)
    FreshBooksLegacy::Invoice.list("per_page" => 100).collect do |invoice|
      assert FreshBooksLegacy::Invoice.get(invoice.invoice_id)
    end 
  end
end