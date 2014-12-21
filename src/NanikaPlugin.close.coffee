NanikaPlugin.close =
	initialize: (nanika) ->
		nanika.on 'response.close', (args, optionals) ->
			unless args.value?.length then nanika.halt 'close', args, optionals
		nanika.on 'ssp.finish.close', (args, optionals) ->
			nanika.halt 'close', args, optionals
		nanika.on 'response.closeall', (args, optionals) ->
			unless args.value?.length then nanika.halt 'close', args, optionals
		nanika.on 'ssp.finish.closeall', (args, optionals) ->
			nanika.halt 'closeall', args, optionals
		nanika.on 'response.changing', (args, optionals) ->
			unless args.value?.length then nanika.halt 'changing', args, optionals
		nanika.on 'ssp.finish.changing', (args, optionals) ->
			nanika.halt 'changing', args, optionals
