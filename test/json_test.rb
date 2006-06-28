$: << File.dirname(__FILE__) + '/../lib/'
require 'cobravsmongoose'
require 'test/unit'
begin
  require 'json' 
rescue LoadError
  $stderr.puts 'You need to install the JSON library for Ruby (http://json.rubyforge.org/)'
  $stderr.puts 'to use and test the XML<->JSON features of Cobra vs Mongoose.'
end

class HashToXMLTest < Test::Unit::TestCase
  
  def test_xml_to_json
    xml = '<alice><bob>charlie</bob><bob>david</bob></alice>'
    assert_equal(
      '{"alice":{"bob":[{"$":"charlie"},{"$":"david"}]}}',
      CobraVsMongoose.xml_to_json(xml)
    )
  end
  
  def test_json_to_xml    
    json = '{"alice":{"$":"bob","@charlie":"david"}}'
    assert_equal(
      "<alice charlie='david'>bob</alice>",
      CobraVsMongoose.json_to_xml(json)
    )
  end
  
end