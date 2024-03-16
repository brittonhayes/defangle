/// Defangle contains functions for defanging IP addresses, URLs, and email addresses.
/// Defanging is the process of replacing certain characters with other characters to make
/// them safe to share in contexts where they might be clicked.

import gleam/string

/// Replace the `.` in the IP address with `[.]`
pub fn ip(ip: String) -> String {
  ip
  |> string.replace(".", "[.]")
  |> string.replace(":", "[:]")
}

/// Replace the `.` in the URL with `[.]`, 
/// and the `http` with `hxxp`, 
/// and the `://` with `[://]`
pub fn url(url: String) -> String {
  url
  |> string.replace(".", "[.]")
  |> string.replace("http", "hxxp")
  |> string.replace("://", "[://]")
}

/// Replace the `@` in the email with `[at]`,
/// and the `.` with `[.]`
pub fn email(email: String) -> String {
  email
  |> string.replace("@", "[at]")
  |> string.replace(".", "[.]")
}

