import gleeunit
import gleeunit/should
import defangle
import gleam/uri

pub fn main() {
  gleeunit.main()
}

pub fn defang_ip_test() {
  "192.168.1.0"
  |> defangle.defang_ip
  |> should.equal("192[.]168[.]1[.]0")

  "192[.]168[.]1[.]0"
  |> defangle.defang_ip
  |> should.equal("192[.]168[.]1[.]0")

  "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
  |> defangle.defang_ip
  |> should.equal("2001[:]0db8[:]85a3[:]0000[:]0000[:]8a2e[:]0370[:]7334")
}

pub fn defang_url_test() {
  "http://www.google.com"
  |> defangle.defang_url
  |> should.equal("hxxp[://]www[.]google[.]com")

  "https://www.google.com"
  |> defangle.defang_url
  |> uri.parse
  |> should.be_error

  "https://www.google.com"
  |> defangle.defang_url
  |> should.equal("hxxps[://]www[.]google[.]com")

  "http://www.google.com/search?q=cat"
  |> defangle.defang_url
  |> should.equal("hxxp[://]www[.]google[.]com/search?q=cat")
}
