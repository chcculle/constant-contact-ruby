require 'rubygems'
require 'test/unit'
require 'fakeweb'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib', 'constant_contact'))
require 'constant-contact-ruby'

class Test::Unit::TestCase

  fixtures_path = File.join( File.dirname( __FILE__ ), 'fixtures' )
  
  # setup FakeWeb 
  FakeWeb.allow_net_connect = false
  # GET /contacts
  FakeWeb.register_uri( :get, %r{https://.+:.+@api\.constantcontact\.com/ws/customers/.+/contacts$}, :body => File.read( File.join( fixtures_path, 'get_contacts.xml' ) ) )
  # GET /contact/:id
  FakeWeb.register_uri( :get, %r{https://.+:.+@api\.constantcontact\.com/ws/customers/.+/contact/\d+$}, :body => File.read( File.join( fixtures_path, 'get_contact.xml' ) ) )

end
