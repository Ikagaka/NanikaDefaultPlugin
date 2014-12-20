NanikaPlugin.close =
	initialize: (nanika) ->
		nanika.on 'ssp.finish.close', ->
			nanika.halt()
		nanika.on 'ssp.finish.changing', ->
			nanika.halt()
