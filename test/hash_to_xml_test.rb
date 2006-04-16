$: << File.dirname(__FILE__) + '/../lib/'
require 'cobravsmongoose'
require 'test/unit'
begin
  require 'test/unit/xml' 
rescue 
  puts 'You need to install Test::Unit::XML (http://testunitxml.rubyforge.org/) for this test.'
end
require File.dirname(__FILE__) + '/test_data'

class HashToXMLTest < Test::Unit::TestCase
  
  COBRA_VS_MONGOOSE_TEST_DATA.each do |name, data|
    method = ("test_data_" << name.to_s << "_hash_to_xml").to_sym
    define_method(method) do
      assert_hash_to_xml(name)
    end
  end
  
  def test_data_loaded
    assert !COBRA_VS_MONGOOSE_TEST_DATA.empty?
    assert methods.grep(/^test_/).length > COBRA_VS_MONGOOSE_TEST_DATA.keys.length
  end
  
  def assert_hash_to_xml(name)
    CobraVsMongoose.sort_keys = true
    source, expected = COBRA_VS_MONGOOSE_TEST_DATA[name]
    assert_not_nil(expected)
    assert_not_nil(source)
    actual = CobraVsMongoose.hash_to_xml(source)
    if (expected == actual)
      assert true
    else
      assert_xml_equal(expected, actual)
    end
  end
  
end