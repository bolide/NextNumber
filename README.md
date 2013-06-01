# NextNumber

你可以使用它生成订单号，或者生成带有字符形式的编码。

它来至2008年的Safore。

## Installation

Add this line to your application's Gemfile:

    gem 'NextNumber'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install NextNumber

## Usage

class NilClass <br/>
  def next_number(qty=1) <br/>
  end <br/>
  
  def -(number)<br/>
  end<br/>
  
  def region_to(qty=1)    <br/>
  end <br/>
  
  def region_sizeof(number) <br/>
  end <br/>
end <br/>

class String <br/>
  #得到字符串的下一个编号，是对字符串中数值区域的值的增加， <br/>
  #如果该字符串没有数值区域，那么返回原字符串 <br/>
  #例如 <br/>
  # 'abc'.next_number         -> abc <br/>
  # 'abc100'.next_number      ->abc101 <br/>
  # '100'.next_number         ->101 <br/>
  # '100abc'.next_number      ->101abc <br/>
  # '0100abc'.next_number     ->0101abc <br/>
  # '0099abc'.next_number     ->0100abc <br/>
  # "abc100".next_number(10)  ->"abc110" <br/>
  # "100abc".next_number(10)  ->"110abc" <br/>
  # "100abc100".next_number(10)  ->"100abc110" <br/>
  def next_number(qty=1) <br/>
    self.reverse.sub(/(0*)\d+/) { |match| (match.reverse.to_i+qty.to_i).to_s.rjust(match.length,"0").reverse }.reverse    	<br/>
  end <br/>
  
  #两个字符串相减，得到两个字符串之间相减的数量 <br/>
  #例如： <br/>
  #  "abc"-"abc"           ->0 <br/>
  #  "abc110"-"abc100"     ->10 <br/>
  #  "110abc"-"100abc"     ->10 <br/>
  def -(number) <br/>
    match1 = /\d+/.match(self) <br/>
    match2 = /\d+/.match(number) <br/>
    (match1 && match2) ? match1[0].to_i - match2[0].to_i : 0 <br/>
  end <br/>
  
  #从当前区段得到下一区段，区段的间隔由qty指定，区段包括首尾部分 <br/>
  #例如： <br/>
  # "a100".region_to(1)      ->"a100" <br/>
  # "a100".region_to(2)   ->"a101" <br/>
  def region_to(qty=1)    <br/>
    raise "参数不允许为0" if qty==0 <br/>
    next_number(qty<0? qty+1:  qty-1) <br/>
  end <br/>
  #计算两个区段之间的大小，区段是包含首尾部分 <br/>
  #例如： <br/>
  # "a100".region_sizeof("a100")    ->1 <br/>
  # "a100".region_sizeof("a101")    ->2 <br/>
  def region_sizeof(number) <br/>
    (self-number).abs+1 <br/>
  end <br/>
end <br/>


## Contributing

past Safore.

