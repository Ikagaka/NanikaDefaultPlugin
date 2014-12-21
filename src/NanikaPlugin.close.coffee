NanikaPlugin.close =
	initialize: (nanika) ->
		nanika.on 'response.close', (args) ->
			unless args.value then nanika.halt()
		nanika.on 'ssp.finish.close', ->
			nanika.halt()
		nanika.on 'response.closeall', (args) ->
			unless args.value then nanika.halt()
		nanika.on 'ssp.finish.closeall', ->
			nanika.halt()
		nanika.on 'response.changing', (args) ->
			unless args.value then nanika.halt()
		nanika.on 'ssp.finish.changing', ->
			nanika.halt()
