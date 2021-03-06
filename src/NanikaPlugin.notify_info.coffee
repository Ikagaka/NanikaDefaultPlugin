NanikaPlugin.notify_info =
	initialize: (nanika) ->
		ownerghostname = -> nanika.request 'ownerghostname', name: nanika.ghost.descript.name
		otherghostname = ->
			names = Object.keys(nanika.nanikamanager.nanikas)
			.map (dirpath) -> nanika.nanikamanager.nanikas[dirpath].ghost.descript.name
			.filter (name) -> name != nanika.ghost.descript.name
			nanika.request 'otherghostname',
				names: names
		basewareversion = ->
			version = '0.0.0'
			id = 'Ikagaka'
			nanika.request 'basewareversion',
				version: version
				id: id
		notifyosinfo = -> # OnNotifyOSInfo
		notifyfontinfo = -> # OnNotifyFontInfo : https://github.com/Pomax/Font.js or http://www.lalit.org/lab/javascript-css-font-detect/
		notifyselfinfo = ->
			nanika.request 'notifyselfinfo',
				name: nanika.ghost.descript.name
				sakura_name: nanika.ghost.descript['sakura.name']
				kero_name: nanika.ghost.descript['kero.name']
				shell_name: nanika.named.shell.descript['name']
				shell_path: null
				balloon_name: nanika.named.balloon.descript['name']
				balloon_path: null
		notifyballooninfo = ->
			nanika.request 'notifyballooninfo',
				balloon_name: nanika.named.balloon.descript['name']
				balloon_path: null
				surfaces: null
		notifyshellinfo = ->
			nanika.request 'notifyshellinfo',
				shell_name: nanika.named.shell.descript['name']
				shell_path: null
				surfaces: null
		notifyuserinfo = -> # OnNotifyUserInfo
		notifydressupinfo = -> # OnNotifyDressupInfo
		ghostpathlist = -> # ghostpathlist
		balloonpathlist = -> # balloonpathlist
		installedghostname = ->
			nanika.storage.ghost_names()
			.then (names) ->
				nanika.request 'installedghostname',
					names: names
		installedballoonname = ->
			nanika.storage.balloon_names()
			.then (names) ->
				nanika.request 'installedballoonname',
					names: names
		installedshellname = ->
			nanika.storage.shell_names(nanika.ghostpath)
			.then (names) ->
				nanika.request 'installedshellname',
					names: names
		rateofusegraph = -> # rateofusegraph
		uniqueid = -> # uniqueid
		nanika.on 'version.set', ownerghostname
		nanika.on 'version.set', otherghostname
		nanika.on 'version.set', basewareversion
		nanika.on 'version.set', notifyosinfo
		nanika.on 'version.set', notifyfontinfo
		nanika.on 'named.initialized', notifyselfinfo
		nanika.on 'named.initialized', notifyballooninfo
		nanika.on 'named.initialized', notifyshellinfo
		nanika.on 'version.set', notifyuserinfo
		nanika.on 'version.set', notifydressupinfo
		nanika.on 'version.set', ghostpathlist
		nanika.on 'version.set', balloonpathlist
		nanika.on 'version.set', installedghostname
		nanika.on 'version.set', installedballoonname
		nanika.on 'version.set', installedshellname
		nanika.on 'version.set', rateofusegraph
		nanika.on 'version.set', uniqueid
