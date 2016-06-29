admins = { }

modules_enabled = {

	-- Generally required
		"roster"; -- Allow users to have a roster. Recommended ;)
		"saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
		"tls"; -- Add support for secure TLS on c2s/s2s connections
		"dialback"; -- s2s dialback support
		"disco"; -- Service discovery

	-- Not essential, but recommended
		"private"; -- Private XML storage (for room bookmarks, etc.)
		"vcard"; -- Allow users to set vCards

	-- These are commented by default as they have a performance impact
		--"privacy"; -- Support privacy lists
		--"compression"; -- Stream compression (Debian: requires lua-zlib module to work)

	-- Nice to have
		"version"; -- Replies to server version requests
		"uptime"; -- Report how long server has been running
		"time"; -- Let others know the time here on this server
		"ping"; -- Replies to XMPP pings with pongs
		"pep"; -- Enables users to publish their mood, activity, playing music and more
		"register"; -- Allow users to register on this server using a client and change passwords

	-- Admin interfaces
		"admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
		"admin_telnet"; -- Opens telnet console interface on localhost port 5582

	-- HTTP modules
		"bosh"; -- Enable BOSH clients, aka "Jabber over HTTP"
		--"http_files"; -- Serve static files from a directory over HTTP

	-- Other specific functionality
		"posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
		--"groups"; -- Shared roster support
		--"announce"; -- Send announcement to all online users
		--"welcome"; -- Welcome users who register accounts
		--"watchregistrations"; -- Alert admins of registrations
		--"motd"; -- Send a message to users when they log in
		--"legacyauth"; -- Legacy authentication. Only used by some old clients and bots.
};


modules_disabled = {
	-- "offline"; -- Store offline messages
	-- "c2s"; -- Handle client connections
	-- "s2s"; -- Handle server-to-server connections
};

-- Disable account creation by default, for security
-- For more information see http://prosody.im/doc/creating_accounts
allow_registration = true;

daemonize = false;
pidfile = "/var/run/prosody/prosody.pid";

ssl = {
	key = "/etc/prosody/certs/cert1.pem";
	certificate = "/etc/prosody/certs/cert1.pem";
}

c2s_require_encryption = false

s2s_secure_auth = false

authentication = "internal_plain"

log = {
	-- Log files (change 'info' to 'debug' for debug logs):
	info = "/var/log/prosody/prosody.log";
	error = "/var/log/prosody/prosody.err";
    warn = "/var/log/prosody/prosody.warn";
	-- Syslog:
	{ levels = { "error" }; to = "syslog";  };
}

bosh_ports = {
     {
        port = 5280;
        path = "http-bind";
     },
     {
        port = 5281;
        path = "http-bind";
        ssl = ssl
     }
}

bosh_max_inactivity = 60
cross_domain_bosh = true

consider_bosh_secure = true

VirtualHost "localhost"
	enabled = true -- Remove this line to enable this host
    ssl = ssl
-- lire doc
Component "conference.prosody.claroline.loc" "muc"
	name = "The chat claroline chatrooms server"
        restrict_room_creation = false

Include "conf.d/*.cfg.lua"
