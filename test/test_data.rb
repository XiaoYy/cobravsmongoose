COBRA_VS_MONGOOSE_TEST_DATA = {
  :text_content => [
    { 'alice' => { '$' => 'bob' } },
    '<alice>bob</alice>'
  ],
  :nested_elements => [
    { 
      "alice" => { 
        "bob" => { "$" => "charlie" }, 
        "david" => { "$" => "edgar"} 
      } 
    },
    '<alice><bob>charlie</bob><david>edgar</david></alice>'
  ],
  :multiple_elements => [
    { 
      "alice" => { 
        "bob" => [
          { "$" => "charlie" }, 
          { "$" => "david" }
        ] 
      } 
    },
    '<alice><bob>charlie</bob><bob>david</bob></alice>'
  ],
  :attributes => [
    { 
      "alice" => { 
        "$" => "bob", 
        "@charlie" => "david" 
      } 
    },
    '<alice charlie="david">bob</alice>'
  ],
  :namespace_uri => [
    { 
      "alice" => { 
        "$" => "bob", 
        "@xmlns" => { 
          "$" => "http://some-namespace"
        } 
      } 
    },
    '<alice xmlns="http://some-namespace">bob</alice>'
  ],
  :other_namespaces => [
    { 
      "alice" => { 
        "$" => "bob", 
        "@xmlns" => { 
          "$" => "http://some-namespace", 
          "charlie" => "http://some-other-namespace" 
        } 
      } 
    },
    '<alice xmlns="http://some-namespace" xmlns:charlie="http://some-other-namespace">bob</alice>'
  ],
  :namespace_prefixes => [
    { 
      "alice" => { 
        "bob" => { 
          "$" => "david" , 
          "@xmlns" => {
            "charlie" => "http://some-other-namespace" , 
            "$" => "http://some-namespace"
          } 
        }, 
        "charlie:edgar" => {
          "$" => "frank", 
          "@xmlns" => {
            "charlie" => "http://some-other-namespace", 
            "$" => "http://some-namespace"
          } 
        }, 
        "@xmlns" => { 
          "charlie" => "http://some-other-namespace", 
          "$" => "http:\/\/some-namespace"
        } 
      } 
    },
    '<alice xmlns="http://some-namespace" xmlns:charlie="http://some-other-namespace"> 
    <bob>david</bob> <charlie:edgar>frank</charlie:edgar> </alice>'
  ],
  :attribute_escaping => [
    {"a" => {"@attribute" => "foo & bar", "$" => "string"}},
    "<a attribute='foo &amp; bar'>string</a>"
  ],
  :string_escaping => [
    {"a" => {"$" => "foo & bar"}},
    "<a>foo &amp; bar</a>"
  ],
  :empty_element => [
    {"a" => {}},
    "<a />"
  ],
  :empty_element_with_attributes => [
    {"a" => {"@foo" => "bar"}},
    "<a foo='bar' />"
  ]
}