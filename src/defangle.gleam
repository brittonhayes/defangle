//// Defangle contains functions for defanging IP addresses, URLs, and email addresses.
//// Defanging is the process of replacing certain characters in links to make
//// them safe to share in contexts where they might otherwise be clicked.

import gleam/string

/// Replace the `.` in the URL with `[.]`, 
/// and the `http` with `hxxp`, 
/// and the `://` with `[://]`
pub fn defang(url: String) -> String {
  let parts = string.split(url, "@")
  case parts {
    [user, domain] -> defang_email(user, domain)
    _ -> defang_ip(url)
  }
}

pub fn defang_url(domain: String) -> String {
  let result = case string.contains(domain, "[.]") {
    True -> domain
    False ->
      domain
      |> string.replace(".", "[.]")
      |> string.replace("http", "hxxp")
      |> string.replace("://", "[://]")
  }
  result
}

/// Replace the `.` in the IP address with `[.]`
pub fn defang_ip(ip: String) -> String {
  let result = case string.contains(ip, "[.]") {
    True -> ip
    False ->
      ip
      |> string.replace(".", "[.]")
      |> string.replace(":", "[:]")
  }
  result
}

/// Replace the `@` in the email with `[at]`,
/// and the `.` with `[.]`
pub fn defang_email(user: String, domain: String) -> String {
  user
  |> string.append("[at]")
  |> string.append(
    domain
    |> defang_url,
  )
}
