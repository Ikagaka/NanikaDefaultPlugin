NanikaPlugin.ssp =
	initialize: (nanika) ->
		nanika.on 'materialized', ->
			nanika.ssp.on 'script:raise', ([id, args...]) ->
				nanika.request 'any',
					id: id
					headers: args
			nanika.ssp.on 'script:halt', ->
				nanika.halt 'ssp.script.halt'
