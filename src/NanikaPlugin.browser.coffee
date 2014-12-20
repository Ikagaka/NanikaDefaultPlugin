NanikaPlugin.notify_browser_info =
	initialize: (nanika) ->
		notifybrowserinfo = ->
			parser = new UAParser()
			info = parser.getResult()
			info2 = useragent_parser.parse(info.ua)
			switch info2.family
				when "ANTGalio","Demeter","Fluid","Fresco","Galeon","GranParadiso","Iris","Kazehakase","Lobo","NetNewsWire","Shiira","Sleipnir","Sunrise","Vienna","Vodafone","WebPilot","IBrowse","Orca","Space Bison","Stainless"
					browser_version = (v for v in [info2.v1, info2.v2, info2.v3] when v?).join '.'
					browser =
						name: info2.family
						version: browser_version
				else
					browser = info.browser
			null2empty = (value) -> if value? then value else ''
			args =
				useragent: null2empty info.ua
				browser_name: null2empty browser.name
				browser_version: null2empty browser.version
				engine_name: null2empty info.engine.name
				engine_version: null2empty info.engine.version
				os_name: null2empty info.os.name
				os_version: null2empty info.os.version
				device_model: null2empty info.device.name
				device_type: null2empty info.device.type
				device_vendor: null2empty info.device.vendor
				cpu_arch: null2empty info.cpu.architecture
			nanika.request 'notifybrowserinfo', args
		nanika.on 'version.set', notifybrowserinfo
