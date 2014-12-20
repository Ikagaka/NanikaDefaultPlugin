NanikaPlugin.time =
	initialize: (nanika) ->
		id_secondchange = null
		init_secondchange = ->
			if id_secondchange? then return
			id_secondchange = setInterval =>
				uptime = 0 # temporary
				nanika.request 'secondchange',
					os_uptime: Math.floor(uptime / 3600)
					mikire: false # temporary
					overlapped: false # temporary
					cantalk: true # temporary
			, 1000
			nanika.on 'halt', -> clearInterval id_secondchange
		nanika.on 'response.boot', init_secondchange
		nanika.on 'response.changed', init_secondchange
		nanika.on 'response.called', init_secondchange
		id_minutechange = null
		init_minutechange = ->
			if id_minutechange? then return
			if (new Date).getSeconds() == 0
				nanika.off 'response.secondchange', init_minutechange
			else
				return
			id_minutechange = setInterval =>
				uptime = 0 # temporary
				nanika.request 'minutechange',
					os_uptime: Math.floor(uptime / 3600)
					mikire: false # temporary
					overlapped: false # temporary
					cantalk: true # temporary
			, 60000
			nanika.on 'halt', -> clearInterval id_minutechange
		nanika.on 'request.secondchange', init_minutechange
