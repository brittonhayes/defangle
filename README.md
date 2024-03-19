# 🦇 defangle

[![Package Version](https://img.shields.io/hexpm/v/defangle)](https://hex.pm/packages/defangle)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/defangle/)

Defangle is a Gleam library for defanging URLs, Emails, and IP addresses making them safe to share.

<img src="https://github.com/brittonhayes/defangle/blob/main/.github/assets/defangle-logo.png" width="120">

## 📥 Install defangle

```sh
gleam add defangle
```

## ⚡ Usage

```gleam
import defangle

pub fn main() {

  // Defang a URL, email, or IP address to make it safe to share
  "https://www.suspicious-url.com"
  |> defangle.defang
  // "hxxps[://]www[.]suspicious-url[.]com"
  
  // Defang a URL to make it safe to share
  "https://www.suspicious-url.com"
  |> defangle.defang_url
  // "hxxps[://]www[.]suspicious-url[.]com"

  // Defang an email address to make it safe to share
  "lucy@malicious.gleam"
  |> defangle.defang_email
  // "lucy[at]suspicious-url[.]com"

  // Defang an IPv4 address to make it safe to share. Doesn't support IPv6 yet.
  "103.253.144.32"
  |> defangle.defang_ip
  // "103[.]253[.]144[.]32"
}
```

Further documentation can be found at <https://hexdocs.pm/defangle>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
