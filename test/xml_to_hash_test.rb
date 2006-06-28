$: << File.dirname(__FILE__) + '/../lib/'
require 'cobravsmongoose'
require 'test/unit'
require File.dirname(__FILE__) + '/test_data'

class XMLToHashTest < Test::Unit::TestCase
  
  COBRA_VS_MONGOOSE_TEST_DATA.each do |name, data|
    method = ("test_data_" << name.to_s << "_xml_to_hash").to_sym
    define_method(method) do
      assert_xml_to_hash(name)
    end
  end
  
  def test_data_loaded
    assert !COBRA_VS_MONGOOSE_TEST_DATA.empty?
    assert methods.grep(/^test_/).length > COBRA_VS_MONGOOSE_TEST_DATA.keys.length
  end
  
  def test_should_accept_a_rexml_document_source
    expected, source = COBRA_VS_MONGOOSE_TEST_DATA[:nested_elements]
    rexml_doc = REXML::Document.new(source)
    assert_equal(expected, CobraVsMongoose.xml_to_hash(rexml_doc))
  end
    
  def assert_xml_to_hash(name)
    expected, source = COBRA_VS_MONGOOSE_TEST_DATA[name]
    assert_not_nil(expected)
    assert_not_nil(source)
    assert_equal(expected, CobraVsMongoose.xml_to_hash(source))
  end
  
end