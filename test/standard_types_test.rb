require 'test/unit'
require File.dirname(__FILE__) + '/../lib/NextNumber/standard_types'

class StandardTypesTest < Test::Unit::TestCase

  def test_next_number
    assert_equal "abc","abc".next_number
    assert_equal "101","100".next_number
    
    assert_equal "abc100","abc99".next_number
    assert_equal "abc100","abc099".next_number
    assert_equal "abc00100","abc00099".next_number
    assert_equal "abc01000","abc00099".next_number(901)
    assert_equal "01000abc","00099abc".next_number(901)
    
    assert_equal "abc0101","abc0100".next_number
    
    assert_equal "abc101","abc100".next_number
    assert_equal "101abc","100abc".next_number
    
    assert_equal "abc101de","abc100de".next_number
    assert_equal "abc-101de","abc-100de".next_number
    
    assert_equal "abc-100-101-de","abc-100-100-de".next_number
    
    assert_equal "abc","abc".next_number(10)
    assert_equal "110","100".next_number(10)
    
    assert_equal "abc110","abc100".next_number(10)
    assert_equal "110abc","100abc".next_number(10)
    
    assert_equal "abc110de","abc100de".next_number(10)
    assert_equal "abc-110de","abc-100de".next_number(10)
    
    assert_equal "abc-100-110-de","abc-100-100-de".next_number(10)
    
    assert_equal "abc109de","abc110de".next_number(-1)
    assert_equal "abc-109de","abc-110de".next_number(-1)
    assert_equal "abc98","abc99".next_number(-1)
    assert_equal "abc098","abc099".next_number(-1)
    assert_equal "abc00099","abc00100".next_number(-1)
    assert_equal "abc00099","abc01000".next_number(-901)
    assert_equal "00099abc","01000abc".next_number(-901)
    
    number="abc110de"
    number.next_number(10)
    assert_equal "abc110de",number
  end
  
  def test_region_to
	assert_equal nil,nil.region_to
	
    assert_equal "abc","abc".region_to
    assert_equal "100","100".region_to
    
    assert_equal "abc99","abc99".region_to
    assert_equal "abc100","abc99".region_to(2)
    assert_equal "abc099","abc099".region_to
    assert_equal "abc00100","abc00099".region_to(2)
    assert_equal "abc01000","abc00099".region_to(902)
    assert_equal "01000abc","00099abc".region_to(902)
    
    assert_equal "abc0100","abc0100".region_to
    
    assert_equal "abc100","abc100".region_to
    assert_equal "101abc","100abc".region_to(2)
    
    assert_equal "abc101de","abc100de".region_to(2)
    assert_equal "abc-101de","abc-100de".region_to(2)
    
    assert_equal "abc-100-101-de","abc-100-100-de".region_to(2)
    
    assert_equal "abc","abc".region_to(10)
    assert_equal "110","100".region_to(11)
    
    assert_equal "abc110","abc100".region_to(11)
    assert_equal "110abc","100abc".region_to(11)
    
    assert_equal "abc110de","abc100de".region_to(11)
    assert_equal "abc-110de","abc-100de".region_to(11)
    
    assert_equal "abc-100-110-de","abc-100-100-de".region_to(11)
    
    assert_raise(RuntimeError) {"abc110de".region_to(0)}
    
    assert_equal "abc110de","abc110de".region_to(-1)
    assert_equal "abc-109de","abc-110de".region_to(-2)
    assert_equal "abc98","abc99".region_to(-2)
    assert_equal "abc098","abc099".region_to(-2)
    assert_equal "abc00099","abc00100".region_to(-2)
    assert_equal "abc00099","abc01000".region_to(-902)
    assert_equal "00099abc","01000abc".region_to(-902)
    
    assert_equal "abc100","abc100".region_to
    assert_equal "abc101","abc100".region_to(2)
    assert_raise(RuntimeError) {assert_equal "abc101","abc100".region_to(0)}
    assert_equal "abc100","abc100".region_to(-1)
    assert_equal "abc099","abc100".region_to(-2)
    
  end
  
  def test_start_and_end_conversion_qty
    assert_equal 0,"abc"-"abc"
    assert_equal 0,"100abc"-"abc"
    assert_equal 0,"abc"-"abc100"
    assert_equal 1,"101"-"100"
    assert_equal -1,"100"-"101"
    
    assert_equal 1,"abc100"-"abc99"
    assert_equal -1,"abc99"-"abc100"
     
    assert_equal 1,"abc100"-"abc099"
    assert_equal -1,"abc099"-"abc100"
    
    assert_equal 1,"abc00100"-"abc00099"
    assert_equal -1,"abc00099"-"abc00100"
    
    assert_equal 901,"abc01000"-"abc00099"
    assert_equal -901,"abc00099"-"abc01000"
    
    assert_equal 901,"01000abc"-"00099abc"
    assert_equal -901,"00099abc"-"01000abc"
    
    assert_equal 1,"abc0101"-"abc0100"
    
    assert_equal 1,"abc101"-"abc100"
    assert_equal 1,"101abc"-"100abc"
    
    assert_equal 1,"abc101de"-"abc100de"
    assert_equal 1,"abc-101de"-"abc-100de"
    
    assert_equal 1,"abc-101-100-de"-"abc-100-100-de"
    
    assert_equal 10,"110"-"100"
    
    assert_equal 10,"abc110"-"abc100"
    assert_equal 10,"110abc"-"100abc"
    
    assert_equal 10,"abc110de"-"abc100de"
    assert_equal 10,"abc-110de"-"abc-100de"
    
    assert_equal 10,"abc-110-100-de"-"abc-100-100-de"   
  end
  
  def test_region_sizeof
    assert_equal 11,"abc-110-100-de".region_sizeof("abc-100-100-de")
    assert_equal 11,"abc-100-100-de".region_sizeof("abc-110-100-de")
    assert_equal 1,"101".region_sizeof("101")
    assert_equal 1,"100".region_sizeof("100")
  end
end
