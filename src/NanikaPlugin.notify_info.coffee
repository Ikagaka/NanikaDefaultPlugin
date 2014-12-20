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
			nanika.request 'installedghostname',
				names: Object.keys(nanika.storage.ghosts).map (dirpath) -> nanika.storage.ghosts[dirpath].install.name
		installedballoonname = ->
			nanika.request 'installedballoonname',
				names: Object.keys(nanika.storage.balloons).map (dirpath) -> nanika.storage.balloons[dirpath].install.name
		installedshellname = ->
			shell = nanika.storage.ghost(nanika.ghostpath).getDirectory('shell')
			shelldirs = shell.listChildren()
			shellnames = []
			for dir in shelldirs
				name = shell.getDirectory(dir).descript?.name
				if name?
					shellnames.push name
			nanika.request 'installedshellname',
				names: shellnames
		rateofusegraph = -> # rateofusegraph
		uniqueid = -> # uniqueid
		nanika.on 'version.set', ownerghostname
		nanika.on 'version.set', otherghostname
		nanika.on 'version.set', basewareversion
		nanika.on 'version.set', notifyosinfo
		nanika.on 'version.set', notifyfontinfo
		nanika.on 'version.set', notifyselfinfo
		nanika.on 'version.set', notifyballooninfo
		nanika.on 'version.set', notifyshellinfo
		nanika.on 'version.set', notifyuserinfo
		nanika.on 'version.set', notifydressupinfo
		nanika.on 'version.set', ghostpathlist
		nanika.on 'version.set', balloonpathlist
		nanika.on 'version.set', installedghostname
		nanika.on 'version.set', installedballoonname
		nanika.on 'version.set', installedshellname
		nanika.on 'version.set', rateofusegraph
		nanika.on 'version.set', uniqueid
