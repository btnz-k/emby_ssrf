##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/btnz-k/emby_ssrf
##

class MetasploitModule < Msf::Auxiliary
    include Msf::Exploit::Remote::HttpClient
    include Msf::Auxiliary::Scanner
    include Msf::Auxiliary::Report
  
    def initialize
      super(
        'Name'           => 'Emby Version Checker',
        'Description'    => %q{
            This module attempts to identify the version of an Emby Server running on a
            host. If you wish to see all the information available, set VERBOSE to true.
          },
        'Author'         => 'Btnz',
        'Version'        => '0.0.2020.07.22',
        'License'        => MSF_LICENSE
      )
  
      register_options(
        [
          Opt::RPORT(8096),
          OptInt.new('TIMEOUT', [true, 'Timeout for the version checker', 30])
        ])      
    end

    def to
        return 30 if datastore['TIMEOUT'].to_i.zero?
        datastore['TIMEOUT'].to_i
    end

    def run_host(ip)
        res = send_request_cgi({
            'uri' => '/System/Info/Public',
            'method' => 'GET'})
          if res.nil? || res.code != 200
            print_error("[Emby Version] failed to identify version")
            return
          end
      
          result = res.get_json_document
          print_status("Identifying Emby Server Version on #{peer}")
          print_good("[Emby Server] Version: #{result['Version']}")
          report_service(:host => rhost, :port => rport, :name => "emby", :info => "Emby Server v.#{result['Version']} (LAN:#{result['LocalAddress']})" )
          print_status ("All info: #{result.to_s}") if datastore['VERBOSE']
          report_note(
              :host  => ip,
              :port  => rport,
              :proto => 'tcp',
              :ntype => 'emby_version',
              :data  => result['Version'],
              :info  => "Emby Server v.#{result['Version']}"
          )
          print_status("Saving host information.")
          report_host(
              :host           => ip,
              :info           =>  "Emby Server v.#{result['Version']} (LAN:#{result['LocalAddress']})"
          )
        end
  end
  
