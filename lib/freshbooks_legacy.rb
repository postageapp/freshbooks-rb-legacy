$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

begin
  require 'active_support'

rescue LoadError
  require 'rubygems'
  gem 'activesupport'
  require 'active_support'
end

require 'freshbooks_legacy/base'
require 'freshbooks_legacy/category'
require 'freshbooks_legacy/client'
require 'freshbooks_legacy/connection'
require 'freshbooks_legacy/estimate'
require 'freshbooks_legacy/expense'
require 'freshbooks_legacy/invoice'
require 'freshbooks_legacy/item'
require 'freshbooks_legacy/line'
require 'freshbooks_legacy/links'
require 'freshbooks_legacy/list_proxy'
require 'freshbooks_legacy/payment'
require 'freshbooks_legacy/project'
require 'freshbooks_legacy/recurring'
require 'freshbooks_legacy/response'
require 'freshbooks_legacy/staff'
require 'freshbooks_legacy/task'
require 'freshbooks_legacy/time_entry'
require 'freshbooks_legacy/autobill'
require 'freshbooks_legacy/card'
require 'freshbooks_legacy/expiration'

require 'net/https'
require 'rexml/document'
require 'logger'

#------------------------------------------------------------------------------
# FreshBooksLegacy.rb - Ruby interface to the FreshBooksLegacy API
#
# Copyright (c) 2007-2008 Ben Vinegar (http://www.benlog.org)
#
# This work is distributed under an MIT License:
# http://www.opensource.org/licenses/mit-license.php
#
#------------------------------------------------------------------------------
# Usage:
#
# FreshBooksLegacy.setup('sample.freshbooks.com', 'mytoken')
#
# clients = FreshBooksLegacy::Client.list
# client = clients[0]
# client.first_name = 'Suzy'
# client.update
#
# invoice = FreshBooksLegacy::Invoice.get(4)
# invoice.lines[0].quantity += 1
# invoice.update
#
# item = FreshBooksLegacy::Item.new
# item.name = 'A sample item'
# item.create
#
#==============================================================================
module FreshBooksLegacy
  VERSION = '3.0.12'     # Gem version
  API_VERSION = '2.1' # FreshBooksLegacy API version
  SERVICE_URL = "/api/#{API_VERSION}/xml-in"

  class Error < StandardError; end;
  class InternalError < Error; end;
  class AuthenticationError < Error; end;
  class UnknownSystemError < Error; end;
  class InvalidParameterError < Error; end;
  class ApiAccessNotEnabledError < Error; end;
  class InvalidAccountUrlError < Error; end;
  class AccountDeactivatedError < Error; end;

  class ParseError < StandardError
    attr_accessor :original_error, :xml

    def initialize(original_error, xml, msg = nil)
      @original_error = original_error
      @xml = xml
      super(msg)
    end

    def to_s
      message = super

      "Original Error: #{original_error.to_s}\n" +
      "XML: #{xml.to_s}\n" +
      "Message: #{message}\n"
    end
  end
end

