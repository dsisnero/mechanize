# This error is raised when Mechanize encounters a response code it does not
# know how to handle.  Currently, this exception will be thrown if Mechanize
# encounters response codes other than 200, 301, or 302.  Any other response
# code is up to the user to handle.

class Mechanize::ResponseCodeError < Mechanize::Error
  attr_reader :response_code
  attr_reader :page

  def initialize(page)
    @page          = page
    @response_code = page.code.to_s
  end

  def to_s
    "#{@response_code} => #{Net::HTTPResponse::CODE_TO_OBJ[@response_code]}"
  end

  alias inspect to_s
end

