%% -------------------------------------------------------------------
%% This is a generated file.
%% -------------------------------------------------------------------

-module(diameter_gen_base_accounting).

-moduledoc(false).

-compile({parse_transform, diameter_exprecs}).

-compile(nowarn_unused_function).

-dialyzer(no_return).

-export_records([diameter_base_accounting_ACR,
                 diameter_base_accounting_ACA,
                 'diameter_base_accounting_Proxy-Info',
                 'diameter_base_accounting_Failed-AVP',
                 'diameter_base_accounting_Experimental-Result',
                 'diameter_base_accounting_Vendor-Specific-Application-Id',
                 'diameter_base_accounting_E2E-Sequence']).

-record(diameter_base_accounting_ACR,
        {'Session-Id',
         'Origin-Host',
         'Origin-Realm',
         'Destination-Realm',
         'Accounting-Record-Type',
         'Accounting-Record-Number',
         'Acct-Application-Id' = [],
         'Vendor-Specific-Application-Id' = [],
         'User-Name' = [],
         'Accounting-Sub-Session-Id' = [],
         'Acct-Session-Id' = [],
         'Acct-Multi-Session-Id' = [],
         'Acct-Interim-Interval' = [],
         'Accounting-Realtime-Required' = [],
         'Origin-State-Id' = [],
         'Event-Timestamp' = [],
         'Proxy-Info' = [],
         'Route-Record' = [],
         'AVP' = []}).

-record(diameter_base_accounting_ACA,
        {'Session-Id',
         'Result-Code',
         'Origin-Host',
         'Origin-Realm',
         'Accounting-Record-Type',
         'Accounting-Record-Number',
         'Acct-Application-Id' = [],
         'Vendor-Specific-Application-Id' = [],
         'User-Name' = [],
         'Accounting-Sub-Session-Id' = [],
         'Acct-Session-Id' = [],
         'Acct-Multi-Session-Id' = [],
         'Error-Reporting-Host' = [],
         'Acct-Interim-Interval' = [],
         'Accounting-Realtime-Required' = [],
         'Origin-State-Id' = [],
         'Event-Timestamp' = [],
         'Proxy-Info' = [],
         'AVP' = []}).

-record('diameter_base_accounting_Proxy-Info',
        {'Proxy-Host', 'Proxy-State', 'AVP' = []}).

-record('diameter_base_accounting_Failed-AVP',
        {'AVP' = []}).

-record('diameter_base_accounting_Experimental-Result',
        {'Vendor-Id', 'Experimental-Result-Code'}).

-record('diameter_base_accounting_Vendor-Specific-Application-Id',
        {'Vendor-Id' = [],
         'Auth-Application-Id' = [],
         'Acct-Application-Id' = []}).

-record('diameter_base_accounting_E2E-Sequence',
        {'AVP' = []}).

-export([name/0,
         id/0,
         vendor_id/0,
         vendor_name/0,
         decode_avps/3,
         encode_avps/3,
         grouped_avp/4,
         msg_name/2,
         msg_header/1,
         rec2msg/1,
         msg2rec/1,
         name2rec/1,
         avp_name/2,
         avp_arity/1,
         avp_arity/2,
         avp_header/1,
         avp/4,
         enumerated_avp/3,
         empty_value/2,
         dict/0]).

-include_lib("diameter/include/diameter.hrl").

-include_lib("diameter/include/diameter_gen.hrl").

name() -> diameter_gen_base_accounting.

id() -> 3.

vendor_id() -> 0.

vendor_name() -> 'IETF'.

msg_name(271, true) -> 'ACR';
msg_name(271, false) -> 'ACA';
msg_name(_, _) -> ''.

msg_header('ACR') -> {271, 192, 3};
msg_header('ACA') -> {271, 64, 3};
msg_header(_) -> erlang:error(badarg).

rec2msg(diameter_base_accounting_ACR) -> 'ACR';
rec2msg(diameter_base_accounting_ACA) -> 'ACA';
rec2msg(_) -> erlang:error(badarg).

msg2rec('ACR') -> diameter_base_accounting_ACR;
msg2rec('ACA') -> diameter_base_accounting_ACA;
msg2rec(_) -> erlang:error(badarg).

name2rec('Proxy-Info') ->
    'diameter_base_accounting_Proxy-Info';
name2rec('Failed-AVP') ->
    'diameter_base_accounting_Failed-AVP';
name2rec('Experimental-Result') ->
    'diameter_base_accounting_Experimental-Result';
name2rec('Vendor-Specific-Application-Id') ->
    'diameter_base_accounting_Vendor-Specific-Application-Id';
name2rec('E2E-Sequence') ->
    'diameter_base_accounting_E2E-Sequence';
name2rec(T) -> msg2rec(T).

avp_name(483, undefined) ->
    {'Accounting-Realtime-Required', 'Enumerated'};
avp_name(485, undefined) ->
    {'Accounting-Record-Number', 'Unsigned32'};
avp_name(480, undefined) ->
    {'Accounting-Record-Type', 'Enumerated'};
avp_name(287, undefined) ->
    {'Accounting-Sub-Session-Id', 'Unsigned64'};
avp_name(259, undefined) ->
    {'Acct-Application-Id', 'Unsigned32'};
avp_name(85, undefined) ->
    {'Acct-Interim-Interval', 'Unsigned32'};
avp_name(50, undefined) ->
    {'Acct-Multi-Session-Id', 'UTF8String'};
avp_name(44, undefined) ->
    {'Acct-Session-Id', 'OctetString'};
avp_name(258, undefined) ->
    {'Auth-Application-Id', 'Unsigned32'};
avp_name(276, undefined) ->
    {'Auth-Grace-Period', 'Unsigned32'};
avp_name(274, undefined) ->
    {'Auth-Request-Type', 'Enumerated'};
avp_name(277, undefined) ->
    {'Auth-Session-State', 'Enumerated'};
avp_name(291, undefined) ->
    {'Authorization-Lifetime', 'Unsigned32'};
avp_name(25, undefined) -> {'Class', 'OctetString'};
avp_name(293, undefined) ->
    {'Destination-Host', 'DiameterIdentity'};
avp_name(283, undefined) ->
    {'Destination-Realm', 'DiameterIdentity'};
avp_name(273, undefined) ->
    {'Disconnect-Cause', 'Enumerated'};
avp_name(300, undefined) -> {'E2E-Sequence', 'Grouped'};
avp_name(281, undefined) ->
    {'Error-Message', 'UTF8String'};
avp_name(294, undefined) ->
    {'Error-Reporting-Host', 'DiameterIdentity'};
avp_name(55, undefined) -> {'Event-Timestamp', 'Time'};
avp_name(297, undefined) ->
    {'Experimental-Result', 'Grouped'};
avp_name(298, undefined) ->
    {'Experimental-Result-Code', 'Unsigned32'};
avp_name(279, undefined) -> {'Failed-AVP', 'Grouped'};
avp_name(267, undefined) ->
    {'Firmware-Revision', 'Unsigned32'};
avp_name(257, undefined) ->
    {'Host-IP-Address', 'Address'};
avp_name(299, undefined) ->
    {'Inband-Security-Id', 'Unsigned32'};
avp_name(272, undefined) ->
    {'Multi-Round-Time-Out', 'Unsigned32'};
avp_name(264, undefined) ->
    {'Origin-Host', 'DiameterIdentity'};
avp_name(296, undefined) ->
    {'Origin-Realm', 'DiameterIdentity'};
avp_name(278, undefined) ->
    {'Origin-State-Id', 'Unsigned32'};
avp_name(269, undefined) ->
    {'Product-Name', 'UTF8String'};
avp_name(280, undefined) ->
    {'Proxy-Host', 'DiameterIdentity'};
avp_name(284, undefined) -> {'Proxy-Info', 'Grouped'};
avp_name(33, undefined) ->
    {'Proxy-State', 'OctetString'};
avp_name(285, undefined) ->
    {'Re-Auth-Request-Type', 'Enumerated'};
avp_name(292, undefined) ->
    {'Redirect-Host', 'DiameterURI'};
avp_name(261, undefined) ->
    {'Redirect-Host-Usage', 'Enumerated'};
avp_name(262, undefined) ->
    {'Redirect-Max-Cache-Time', 'Unsigned32'};
avp_name(268, undefined) ->
    {'Result-Code', 'Unsigned32'};
avp_name(282, undefined) ->
    {'Route-Record', 'DiameterIdentity'};
avp_name(270, undefined) ->
    {'Session-Binding', 'Unsigned32'};
avp_name(263, undefined) ->
    {'Session-Id', 'UTF8String'};
avp_name(271, undefined) ->
    {'Session-Server-Failover', 'Enumerated'};
avp_name(27, undefined) ->
    {'Session-Timeout', 'Unsigned32'};
avp_name(265, undefined) ->
    {'Supported-Vendor-Id', 'Unsigned32'};
avp_name(295, undefined) ->
    {'Termination-Cause', 'Enumerated'};
avp_name(1, undefined) -> {'User-Name', 'UTF8String'};
avp_name(266, undefined) -> {'Vendor-Id', 'Unsigned32'};
avp_name(260, undefined) ->
    {'Vendor-Specific-Application-Id', 'Grouped'};
avp_name(_, _) -> 'AVP'.

avp_arity('ACR') ->
    [{'Session-Id', 1},
     {'Origin-Host', 1},
     {'Origin-Realm', 1},
     {'Destination-Realm', 1},
     {'Accounting-Record-Type', 1},
     {'Accounting-Record-Number', 1},
     {'Acct-Application-Id', {0, 1}},
     {'Vendor-Specific-Application-Id', {0, 1}},
     {'User-Name', {0, 1}},
     {'Accounting-Sub-Session-Id', {0, 1}},
     {'Acct-Session-Id', {0, 1}},
     {'Acct-Multi-Session-Id', {0, 1}},
     {'Acct-Interim-Interval', {0, 1}},
     {'Accounting-Realtime-Required', {0, 1}},
     {'Origin-State-Id', {0, 1}},
     {'Event-Timestamp', {0, 1}},
     {'Proxy-Info', {0, '*'}},
     {'Route-Record', {0, '*'}},
     {'AVP', {0, '*'}}];
avp_arity('ACA') ->
    [{'Session-Id', 1},
     {'Result-Code', 1},
     {'Origin-Host', 1},
     {'Origin-Realm', 1},
     {'Accounting-Record-Type', 1},
     {'Accounting-Record-Number', 1},
     {'Acct-Application-Id', {0, 1}},
     {'Vendor-Specific-Application-Id', {0, 1}},
     {'User-Name', {0, 1}},
     {'Accounting-Sub-Session-Id', {0, 1}},
     {'Acct-Session-Id', {0, 1}},
     {'Acct-Multi-Session-Id', {0, 1}},
     {'Error-Reporting-Host', {0, 1}},
     {'Acct-Interim-Interval', {0, 1}},
     {'Accounting-Realtime-Required', {0, 1}},
     {'Origin-State-Id', {0, 1}},
     {'Event-Timestamp', {0, 1}},
     {'Proxy-Info', {0, '*'}},
     {'AVP', {0, '*'}}];
avp_arity('Proxy-Info') ->
    [{'Proxy-Host', 1},
     {'Proxy-State', 1},
     {'AVP', {0, '*'}}];
avp_arity('Failed-AVP') -> [{'AVP', {1, '*'}}];
avp_arity('Experimental-Result') ->
    [{'Vendor-Id', 1}, {'Experimental-Result-Code', 1}];
avp_arity('Vendor-Specific-Application-Id') ->
    [{'Vendor-Id', {1, '*'}},
     {'Auth-Application-Id', {0, 1}},
     {'Acct-Application-Id', {0, 1}}];
avp_arity('E2E-Sequence') -> [{'AVP', {2, '*'}}];
avp_arity(_) -> erlang:error(badarg).

avp_arity('ACR', 'Session-Id') -> 1;
avp_arity('ACR', 'Origin-Host') -> 1;
avp_arity('ACR', 'Origin-Realm') -> 1;
avp_arity('ACR', 'Destination-Realm') -> 1;
avp_arity('ACR', 'Accounting-Record-Type') -> 1;
avp_arity('ACR', 'Accounting-Record-Number') -> 1;
avp_arity('ACR', 'Acct-Application-Id') -> {0, 1};
avp_arity('ACR', 'Vendor-Specific-Application-Id') ->
    {0, 1};
avp_arity('ACR', 'User-Name') -> {0, 1};
avp_arity('ACR', 'Accounting-Sub-Session-Id') -> {0, 1};
avp_arity('ACR', 'Acct-Session-Id') -> {0, 1};
avp_arity('ACR', 'Acct-Multi-Session-Id') -> {0, 1};
avp_arity('ACR', 'Acct-Interim-Interval') -> {0, 1};
avp_arity('ACR', 'Accounting-Realtime-Required') ->
    {0, 1};
avp_arity('ACR', 'Origin-State-Id') -> {0, 1};
avp_arity('ACR', 'Event-Timestamp') -> {0, 1};
avp_arity('ACR', 'Proxy-Info') -> {0, '*'};
avp_arity('ACR', 'Route-Record') -> {0, '*'};
avp_arity('ACR', 'AVP') -> {0, '*'};
avp_arity('ACA', 'Session-Id') -> 1;
avp_arity('ACA', 'Result-Code') -> 1;
avp_arity('ACA', 'Origin-Host') -> 1;
avp_arity('ACA', 'Origin-Realm') -> 1;
avp_arity('ACA', 'Accounting-Record-Type') -> 1;
avp_arity('ACA', 'Accounting-Record-Number') -> 1;
avp_arity('ACA', 'Acct-Application-Id') -> {0, 1};
avp_arity('ACA', 'Vendor-Specific-Application-Id') ->
    {0, 1};
avp_arity('ACA', 'User-Name') -> {0, 1};
avp_arity('ACA', 'Accounting-Sub-Session-Id') -> {0, 1};
avp_arity('ACA', 'Acct-Session-Id') -> {0, 1};
avp_arity('ACA', 'Acct-Multi-Session-Id') -> {0, 1};
avp_arity('ACA', 'Error-Reporting-Host') -> {0, 1};
avp_arity('ACA', 'Acct-Interim-Interval') -> {0, 1};
avp_arity('ACA', 'Accounting-Realtime-Required') ->
    {0, 1};
avp_arity('ACA', 'Origin-State-Id') -> {0, 1};
avp_arity('ACA', 'Event-Timestamp') -> {0, 1};
avp_arity('ACA', 'Proxy-Info') -> {0, '*'};
avp_arity('ACA', 'AVP') -> {0, '*'};
avp_arity('Proxy-Info', 'Proxy-Host') -> 1;
avp_arity('Proxy-Info', 'Proxy-State') -> 1;
avp_arity('Proxy-Info', 'AVP') -> {0, '*'};
avp_arity('Failed-AVP', 'AVP') -> {1, '*'};
avp_arity('Experimental-Result', 'Vendor-Id') -> 1;
avp_arity('Experimental-Result',
          'Experimental-Result-Code') ->
    1;
avp_arity('Vendor-Specific-Application-Id',
          'Vendor-Id') ->
    {1, '*'};
avp_arity('Vendor-Specific-Application-Id',
          'Auth-Application-Id') ->
    {0, 1};
avp_arity('Vendor-Specific-Application-Id',
          'Acct-Application-Id') ->
    {0, 1};
avp_arity('E2E-Sequence', 'AVP') -> {2, '*'};
avp_arity(_, _) -> 0.

avp_header('Accounting-Realtime-Required') ->
    diameter_gen_base_rfc3588:avp_header('Accounting-Realtime-Required');
avp_header('Accounting-Record-Number') ->
    diameter_gen_base_rfc3588:avp_header('Accounting-Record-Number');
avp_header('Accounting-Record-Type') ->
    diameter_gen_base_rfc3588:avp_header('Accounting-Record-Type');
avp_header('Accounting-Sub-Session-Id') ->
    diameter_gen_base_rfc3588:avp_header('Accounting-Sub-Session-Id');
avp_header('Acct-Application-Id') ->
    diameter_gen_base_rfc3588:avp_header('Acct-Application-Id');
avp_header('Acct-Interim-Interval') ->
    diameter_gen_base_rfc3588:avp_header('Acct-Interim-Interval');
avp_header('Acct-Multi-Session-Id') ->
    diameter_gen_base_rfc3588:avp_header('Acct-Multi-Session-Id');
avp_header('Acct-Session-Id') ->
    diameter_gen_base_rfc3588:avp_header('Acct-Session-Id');
avp_header('Auth-Application-Id') ->
    diameter_gen_base_rfc3588:avp_header('Auth-Application-Id');
avp_header('Auth-Grace-Period') ->
    diameter_gen_base_rfc3588:avp_header('Auth-Grace-Period');
avp_header('Auth-Request-Type') ->
    diameter_gen_base_rfc3588:avp_header('Auth-Request-Type');
avp_header('Auth-Session-State') ->
    diameter_gen_base_rfc3588:avp_header('Auth-Session-State');
avp_header('Authorization-Lifetime') ->
    diameter_gen_base_rfc3588:avp_header('Authorization-Lifetime');
avp_header('Class') ->
    diameter_gen_base_rfc3588:avp_header('Class');
avp_header('Destination-Host') ->
    diameter_gen_base_rfc3588:avp_header('Destination-Host');
avp_header('Destination-Realm') ->
    diameter_gen_base_rfc3588:avp_header('Destination-Realm');
avp_header('Disconnect-Cause') ->
    diameter_gen_base_rfc3588:avp_header('Disconnect-Cause');
avp_header('E2E-Sequence') ->
    diameter_gen_base_rfc3588:avp_header('E2E-Sequence');
avp_header('Error-Message') ->
    diameter_gen_base_rfc3588:avp_header('Error-Message');
avp_header('Error-Reporting-Host') ->
    diameter_gen_base_rfc3588:avp_header('Error-Reporting-Host');
avp_header('Event-Timestamp') ->
    diameter_gen_base_rfc3588:avp_header('Event-Timestamp');
avp_header('Experimental-Result') ->
    diameter_gen_base_rfc3588:avp_header('Experimental-Result');
avp_header('Experimental-Result-Code') ->
    diameter_gen_base_rfc3588:avp_header('Experimental-Result-Code');
avp_header('Failed-AVP') ->
    diameter_gen_base_rfc3588:avp_header('Failed-AVP');
avp_header('Firmware-Revision') ->
    diameter_gen_base_rfc3588:avp_header('Firmware-Revision');
avp_header('Host-IP-Address') ->
    diameter_gen_base_rfc3588:avp_header('Host-IP-Address');
avp_header('Inband-Security-Id') ->
    diameter_gen_base_rfc3588:avp_header('Inband-Security-Id');
avp_header('Multi-Round-Time-Out') ->
    diameter_gen_base_rfc3588:avp_header('Multi-Round-Time-Out');
avp_header('Origin-Host') ->
    diameter_gen_base_rfc3588:avp_header('Origin-Host');
avp_header('Origin-Realm') ->
    diameter_gen_base_rfc3588:avp_header('Origin-Realm');
avp_header('Origin-State-Id') ->
    diameter_gen_base_rfc3588:avp_header('Origin-State-Id');
avp_header('Product-Name') ->
    diameter_gen_base_rfc3588:avp_header('Product-Name');
avp_header('Proxy-Host') ->
    diameter_gen_base_rfc3588:avp_header('Proxy-Host');
avp_header('Proxy-Info') ->
    diameter_gen_base_rfc3588:avp_header('Proxy-Info');
avp_header('Proxy-State') ->
    diameter_gen_base_rfc3588:avp_header('Proxy-State');
avp_header('Re-Auth-Request-Type') ->
    diameter_gen_base_rfc3588:avp_header('Re-Auth-Request-Type');
avp_header('Redirect-Host') ->
    diameter_gen_base_rfc3588:avp_header('Redirect-Host');
avp_header('Redirect-Host-Usage') ->
    diameter_gen_base_rfc3588:avp_header('Redirect-Host-Usage');
avp_header('Redirect-Max-Cache-Time') ->
    diameter_gen_base_rfc3588:avp_header('Redirect-Max-Cache-Time');
avp_header('Result-Code') ->
    diameter_gen_base_rfc3588:avp_header('Result-Code');
avp_header('Route-Record') ->
    diameter_gen_base_rfc3588:avp_header('Route-Record');
avp_header('Session-Binding') ->
    diameter_gen_base_rfc3588:avp_header('Session-Binding');
avp_header('Session-Id') ->
    diameter_gen_base_rfc3588:avp_header('Session-Id');
avp_header('Session-Server-Failover') ->
    diameter_gen_base_rfc3588:avp_header('Session-Server-Failover');
avp_header('Session-Timeout') ->
    diameter_gen_base_rfc3588:avp_header('Session-Timeout');
avp_header('Supported-Vendor-Id') ->
    diameter_gen_base_rfc3588:avp_header('Supported-Vendor-Id');
avp_header('Termination-Cause') ->
    diameter_gen_base_rfc3588:avp_header('Termination-Cause');
avp_header('User-Name') ->
    diameter_gen_base_rfc3588:avp_header('User-Name');
avp_header('Vendor-Id') ->
    diameter_gen_base_rfc3588:avp_header('Vendor-Id');
avp_header('Vendor-Specific-Application-Id') ->
    diameter_gen_base_rfc3588:avp_header('Vendor-Specific-Application-Id');
avp_header(_) -> erlang:error(badarg).

avp(T, Data, 'Accounting-Realtime-Required', Opts) ->
    avp(T,
        Data,
        'Accounting-Realtime-Required',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Accounting-Record-Number', Opts) ->
    avp(T,
        Data,
        'Accounting-Record-Number',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Accounting-Record-Type', Opts) ->
    avp(T,
        Data,
        'Accounting-Record-Type',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Accounting-Sub-Session-Id', Opts) ->
    avp(T,
        Data,
        'Accounting-Sub-Session-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Acct-Application-Id', Opts) ->
    avp(T,
        Data,
        'Acct-Application-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Acct-Interim-Interval', Opts) ->
    avp(T,
        Data,
        'Acct-Interim-Interval',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Acct-Multi-Session-Id', Opts) ->
    avp(T,
        Data,
        'Acct-Multi-Session-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Acct-Session-Id', Opts) ->
    avp(T,
        Data,
        'Acct-Session-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Auth-Application-Id', Opts) ->
    avp(T,
        Data,
        'Auth-Application-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Auth-Grace-Period', Opts) ->
    avp(T,
        Data,
        'Auth-Grace-Period',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Auth-Request-Type', Opts) ->
    avp(T,
        Data,
        'Auth-Request-Type',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Auth-Session-State', Opts) ->
    avp(T,
        Data,
        'Auth-Session-State',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Authorization-Lifetime', Opts) ->
    avp(T,
        Data,
        'Authorization-Lifetime',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Class', Opts) ->
    avp(T, Data, 'Class', Opts, diameter_gen_base_rfc3588);
avp(T, Data, 'Destination-Host', Opts) ->
    avp(T,
        Data,
        'Destination-Host',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Destination-Realm', Opts) ->
    avp(T,
        Data,
        'Destination-Realm',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Disconnect-Cause', Opts) ->
    avp(T,
        Data,
        'Disconnect-Cause',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'E2E-Sequence', Opts) ->
    grouped_avp(T, 'E2E-Sequence', Data, Opts);
avp(T, Data, 'Error-Message', Opts) ->
    avp(T,
        Data,
        'Error-Message',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Error-Reporting-Host', Opts) ->
    avp(T,
        Data,
        'Error-Reporting-Host',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Event-Timestamp', Opts) ->
    avp(T,
        Data,
        'Event-Timestamp',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Experimental-Result', Opts) ->
    grouped_avp(T, 'Experimental-Result', Data, Opts);
avp(T, Data, 'Experimental-Result-Code', Opts) ->
    avp(T,
        Data,
        'Experimental-Result-Code',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Failed-AVP', Opts) ->
    grouped_avp(T, 'Failed-AVP', Data, Opts);
avp(T, Data, 'Firmware-Revision', Opts) ->
    avp(T,
        Data,
        'Firmware-Revision',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Host-IP-Address', Opts) ->
    avp(T,
        Data,
        'Host-IP-Address',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Inband-Security-Id', Opts) ->
    avp(T,
        Data,
        'Inband-Security-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Multi-Round-Time-Out', Opts) ->
    avp(T,
        Data,
        'Multi-Round-Time-Out',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Origin-Host', Opts) ->
    avp(T,
        Data,
        'Origin-Host',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Origin-Realm', Opts) ->
    avp(T,
        Data,
        'Origin-Realm',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Origin-State-Id', Opts) ->
    avp(T,
        Data,
        'Origin-State-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Product-Name', Opts) ->
    avp(T,
        Data,
        'Product-Name',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Proxy-Host', Opts) ->
    avp(T,
        Data,
        'Proxy-Host',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Proxy-Info', Opts) ->
    grouped_avp(T, 'Proxy-Info', Data, Opts);
avp(T, Data, 'Proxy-State', Opts) ->
    avp(T,
        Data,
        'Proxy-State',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Re-Auth-Request-Type', Opts) ->
    avp(T,
        Data,
        'Re-Auth-Request-Type',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Redirect-Host', Opts) ->
    avp(T,
        Data,
        'Redirect-Host',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Redirect-Host-Usage', Opts) ->
    avp(T,
        Data,
        'Redirect-Host-Usage',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Redirect-Max-Cache-Time', Opts) ->
    avp(T,
        Data,
        'Redirect-Max-Cache-Time',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Result-Code', Opts) ->
    avp(T,
        Data,
        'Result-Code',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Route-Record', Opts) ->
    avp(T,
        Data,
        'Route-Record',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Session-Binding', Opts) ->
    avp(T,
        Data,
        'Session-Binding',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Session-Id', Opts) ->
    avp(T,
        Data,
        'Session-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Session-Server-Failover', Opts) ->
    avp(T,
        Data,
        'Session-Server-Failover',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Session-Timeout', Opts) ->
    avp(T,
        Data,
        'Session-Timeout',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Supported-Vendor-Id', Opts) ->
    avp(T,
        Data,
        'Supported-Vendor-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Termination-Cause', Opts) ->
    avp(T,
        Data,
        'Termination-Cause',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'User-Name', Opts) ->
    avp(T,
        Data,
        'User-Name',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Vendor-Id', Opts) ->
    avp(T,
        Data,
        'Vendor-Id',
        Opts,
        diameter_gen_base_rfc3588);
avp(T, Data, 'Vendor-Specific-Application-Id', Opts) ->
    grouped_avp(T,
                'Vendor-Specific-Application-Id',
                Data,
                Opts);
avp(_, _, _, _) -> erlang:error(badarg).

enumerated_avp(_, _, _) -> erlang:error(badarg).

empty_value('Proxy-Info', Opts) ->
    empty_group('Proxy-Info', Opts);
empty_value('Failed-AVP', Opts) ->
    empty_group('Failed-AVP', Opts);
empty_value('Experimental-Result', Opts) ->
    empty_group('Experimental-Result', Opts);
empty_value('Vendor-Specific-Application-Id', Opts) ->
    empty_group('Vendor-Specific-Application-Id', Opts);
empty_value('E2E-Sequence', Opts) ->
    empty_group('E2E-Sequence', Opts);
empty_value('Disconnect-Cause', _) -> <<0, 0, 0, 0>>;
empty_value('Redirect-Host-Usage', _) -> <<0, 0, 0, 0>>;
empty_value('Auth-Request-Type', _) -> <<0, 0, 0, 0>>;
empty_value('Auth-Session-State', _) -> <<0, 0, 0, 0>>;
empty_value('Re-Auth-Request-Type', _) ->
    <<0, 0, 0, 0>>;
empty_value('Termination-Cause', _) -> <<0, 0, 0, 0>>;
empty_value('Session-Server-Failover', _) ->
    <<0, 0, 0, 0>>;
empty_value('Accounting-Record-Type', _) ->
    <<0, 0, 0, 0>>;
empty_value('Accounting-Realtime-Required', _) ->
    <<0, 0, 0, 0>>;
empty_value(Name, Opts) -> empty(Name, Opts).

dict() ->
    [1,
     {avp_types, []},
     {avp_vendor_id, []},
     {codecs, []},
     {command_codes, [{271, "ACR", "ACA"}]},
     {custom_types, []},
     {define, []},
     {enum, []},
     {grouped, []},
     {id, 3},
     {import_avps,
      [{diameter_gen_base_rfc3588,
        [{"Accounting-Realtime-Required",
          483,
          "Enumerated",
          "M"},
         {"Accounting-Record-Number", 485, "Unsigned32", "M"},
         {"Accounting-Record-Type", 480, "Enumerated", "M"},
         {"Accounting-Sub-Session-Id", 287, "Unsigned64", "M"},
         {"Acct-Application-Id", 259, "Unsigned32", "M"},
         {"Acct-Interim-Interval", 85, "Unsigned32", "M"},
         {"Acct-Multi-Session-Id", 50, "UTF8String", "M"},
         {"Acct-Session-Id", 44, "OctetString", "M"},
         {"Auth-Application-Id", 258, "Unsigned32", "M"},
         {"Auth-Grace-Period", 276, "Unsigned32", "M"},
         {"Auth-Request-Type", 274, "Enumerated", "M"},
         {"Auth-Session-State", 277, "Enumerated", "M"},
         {"Authorization-Lifetime", 291, "Unsigned32", "M"},
         {"Class", 25, "OctetString", "M"},
         {"Destination-Host", 293, "DiameterIdentity", "M"},
         {"Destination-Realm", 283, "DiameterIdentity", "M"},
         {"Disconnect-Cause", 273, "Enumerated", "M"},
         {"E2E-Sequence", 300, "Grouped", "M"},
         {"Error-Message", 281, "UTF8String", []},
         {"Error-Reporting-Host", 294, "DiameterIdentity", []},
         {"Event-Timestamp", 55, "Time", "M"},
         {"Experimental-Result", 297, "Grouped", "M"},
         {"Experimental-Result-Code", 298, "Unsigned32", "M"},
         {"Failed-AVP", 279, "Grouped", "M"},
         {"Firmware-Revision", 267, "Unsigned32", []},
         {"Host-IP-Address", 257, "Address", "M"},
         {"Inband-Security-Id", 299, "Unsigned32", "M"},
         {"Multi-Round-Time-Out", 272, "Unsigned32", "M"},
         {"Origin-Host", 264, "DiameterIdentity", "M"},
         {"Origin-Realm", 296, "DiameterIdentity", "M"},
         {"Origin-State-Id", 278, "Unsigned32", "M"},
         {"Product-Name", 269, "UTF8String", []},
         {"Proxy-Host", 280, "DiameterIdentity", "M"},
         {"Proxy-Info", 284, "Grouped", "M"},
         {"Proxy-State", 33, "OctetString", "M"},
         {"Re-Auth-Request-Type", 285, "Enumerated", "M"},
         {"Redirect-Host", 292, "DiameterURI", "M"},
         {"Redirect-Host-Usage", 261, "Enumerated", "M"},
         {"Redirect-Max-Cache-Time", 262, "Unsigned32", "M"},
         {"Result-Code", 268, "Unsigned32", "M"},
         {"Route-Record", 282, "DiameterIdentity", "M"},
         {"Session-Binding", 270, "Unsigned32", "M"},
         {"Session-Id", 263, "UTF8String", "M"},
         {"Session-Server-Failover", 271, "Enumerated", "M"},
         {"Session-Timeout", 27, "Unsigned32", "M"},
         {"Supported-Vendor-Id", 265, "Unsigned32", "M"},
         {"Termination-Cause", 295, "Enumerated", "M"},
         {"User-Name", 1, "UTF8String", "M"},
         {"Vendor-Id", 266, "Unsigned32", "M"},
         {"Vendor-Specific-Application-Id",
          260,
          "Grouped",
          "M"}]}]},
     {import_enums,
      [{diameter_gen_base_rfc3588,
        [{"Disconnect-Cause",
          [{"REBOOTING", 0},
           {"BUSY", 1},
           {"DO_NOT_WANT_TO_TALK_TO_YOU", 2}]},
         {"Redirect-Host-Usage",
          [{"DONT_CACHE", 0},
           {"ALL_SESSION", 1},
           {"ALL_REALM", 2},
           {"REALM_AND_APPLICATION", 3},
           {"ALL_APPLICATION", 4},
           {"ALL_HOST", 5},
           {"ALL_USER", 6}]},
         {"Auth-Request-Type",
          [{"AUTHENTICATE_ONLY", 1},
           {"AUTHORIZE_ONLY", 2},
           {"AUTHORIZE_AUTHENTICATE", 3}]},
         {"Auth-Session-State",
          [{"STATE_MAINTAINED", 0}, {"NO_STATE_MAINTAINED", 1}]},
         {"Re-Auth-Request-Type",
          [{"AUTHORIZE_ONLY", 0}, {"AUTHORIZE_AUTHENTICATE", 1}]},
         {"Termination-Cause",
          [{"LOGOUT", 1},
           {"SERVICE_NOT_PROVIDED", 2},
           {"BAD_ANSWER", 3},
           {"ADMINISTRATIVE", 4},
           {"LINK_BROKEN", 5},
           {"AUTH_EXPIRED", 6},
           {"USER_MOVED", 7},
           {"SESSION_TIMEOUT", 8}]},
         {"Session-Server-Failover",
          [{"REFUSE_SERVICE", 0},
           {"TRY_AGAIN", 1},
           {"ALLOW_SERVICE", 2},
           {"TRY_AGAIN_ALLOW_SERVICE", 3}]},
         {"Accounting-Record-Type",
          [{"EVENT_RECORD", 1},
           {"START_RECORD", 2},
           {"INTERIM_RECORD", 3},
           {"STOP_RECORD", 4}]},
         {"Accounting-Realtime-Required",
          [{"DELIVER_AND_GRANT", 1},
           {"GRANT_AND_STORE", 2},
           {"GRANT_AND_LOSE", 3}]}]}]},
     {import_groups,
      [{diameter_gen_base_rfc3588,
        [{"Proxy-Info",
          284,
          [],
          [{"Proxy-Host"}, {"Proxy-State"}, {'*', ["AVP"]}]},
         {"Failed-AVP", 279, [], [{'*', {"AVP"}}]},
         {"Experimental-Result",
          297,
          [],
          [{"Vendor-Id"}, {"Experimental-Result-Code"}]},
         {"Vendor-Specific-Application-Id",
          260,
          [],
          [{'*', {"Vendor-Id"}},
           ["Auth-Application-Id"],
           ["Acct-Application-Id"]]},
         {"E2E-Sequence", 300, [], [{{2, '*'}, {"AVP"}}]}]}]},
     {inherits, [{"diameter_gen_base_rfc3588", []}]},
     {messages,
      [{"ACR",
        271,
        ['REQ', 'PXY'],
        [],
        [{{"Session-Id"}},
         {"Origin-Host"},
         {"Origin-Realm"},
         {"Destination-Realm"},
         {"Accounting-Record-Type"},
         {"Accounting-Record-Number"},
         ["Acct-Application-Id"],
         ["Vendor-Specific-Application-Id"],
         ["User-Name"],
         ["Accounting-Sub-Session-Id"],
         ["Acct-Session-Id"],
         ["Acct-Multi-Session-Id"],
         ["Acct-Interim-Interval"],
         ["Accounting-Realtime-Required"],
         ["Origin-State-Id"],
         ["Event-Timestamp"],
         {'*', ["Proxy-Info"]},
         {'*', ["Route-Record"]},
         {'*', ["AVP"]}]},
       {"ACA",
        271,
        ['PXY'],
        [],
        [{{"Session-Id"}},
         {"Result-Code"},
         {"Origin-Host"},
         {"Origin-Realm"},
         {"Accounting-Record-Type"},
         {"Accounting-Record-Number"},
         ["Acct-Application-Id"],
         ["Vendor-Specific-Application-Id"],
         ["User-Name"],
         ["Accounting-Sub-Session-Id"],
         ["Acct-Session-Id"],
         ["Acct-Multi-Session-Id"],
         ["Error-Reporting-Host"],
         ["Acct-Interim-Interval"],
         ["Accounting-Realtime-Required"],
         ["Origin-State-Id"],
         ["Event-Timestamp"],
         {'*', ["Proxy-Info"]},
         {'*', ["AVP"]}]}]},
     {name, "diameter_gen_base_accounting"},
     {prefix, "diameter_base_accounting"},
     {vendor, {0, "IETF"}}].


