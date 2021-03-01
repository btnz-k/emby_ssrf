## Description

Generates an API request to the provided ip addresses in order to ascertain the Emby server version, if possible. Returns the server version, URI, and internal IP address (if provided). This is useful for rapidly identifying  vulnerable Emby servers that may be susceptible to CVE-2020-26948.

## Verification Steps

  1. Do: `use auxiliary/scanner/http/emby_version`
  2. Do: `set rhosts [ips]`
  3. Do: `run`

## Options


**RPORT**

Select which ports to check for Emby server API access. Defaults to 8096.

## Scenarios

### Scan network for Emby Servers

  ```
msf6 > use auxiliary/scanner/http/emby_version
msf6 auxiliary(scanner/http/emby_version) > set rhosts 10.10.200.0/24
rhosts => 10.10.200.0/24
msf6 auxiliary(scanner/http/emby_version) > set threads 10
threads => 10
msf6 auxiliary(scanner/http/emby_version) > run

[*] Scanned  26 of 256 hosts (10% complete)
  ```
