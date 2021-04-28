# msf_emby

This tool will check a remote EMBY server to attempt to use an SSRF vulnerability to perform an http scan of the network internal to the EMBY server. This is based on the vulnerability CVE-2020-26948.

## Installation
Clone the repo and put the emby_version_ssrf.rb file into the `/usr/share/metasploit-framework/modules/auxiliary/scanner/http/` directory, and the emby_ssrf_scanner.rb file into the `/usr/share/metasploit-framework/modules/auxiliary/scanner/` directory. Run msfconsole, and use the modules from there.

## Help
Emby_Version:
```
Module options (auxiliary/scanner/http/emby_version):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   BASEPATH  /                yes       The base path, usually just /
   Proxies                    no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS                     yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT     8096             yes       The target port (TCP)
   SSL       false            no        Negotiate SSL/TLS for outgoing connections
   THREADS   1                yes       The number of concurrent threads (max one per host)
   TIMEOUT   30               yes       Timeout for the version checker
```

Emby_Scan:
```
Module options (auxiliary/scanner/emby_scan):

   Name         Current Setting    Required  Description
   ----         ---------------    --------  -----------
   EMBY_PORT    8096               yes       Web UI port for Emby Server (e.g. 8096)
   EMBY_SERVER                     yes       IP to scan (eg 10.10.10.18))
   PORTS        80,8080,8081,8888  yes       Ports to scan (e.g. 22-25,80,110-900)
   Proxies                         no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS                          yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   SHOW_TITLES  true               yes       Show the titles on the console as they are grabbed
   STORE_NOTES  true               yes       Store the captured information in notes. Use "notes -t http.title" to view
   THREADS      1                  yes       The number of concurrent threads (max one per host)
   TIMEOUT      500                yes       The number of seconds to wait for new data
```
