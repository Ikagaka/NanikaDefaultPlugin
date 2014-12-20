NanikaPlugin.choice_anchor =
	initialize: (nanika) ->
		nanika.on 'materialized', ->
			nanika.named.on 'choiceselect', (event) ->
				if /^On/.test event.id # On
					nanika.request 'any',
						id: event.id
						headers: event.args
				else if /^script:/.test event.id # script:
					nanika.ssp.play(event.id.replace /^script:/, '')
				else if event.args.length # Ex
					nanika.request 'choiceselectex',
						id: event.id
						label: event.text
						args: event.args
				else # normal
					nanika.request 'choiceselectex',
						id: event.id
						label: event.text
					, (response_args, response) ->
						if not response_args.value? or not response_args.value.length
							nanika.request 'choiceselect',
								id: event.id
			nanika.named.on 'anchorselect', (event) =>
				if /^On/.test event.id # On
					nanika.request 'any',
						id: event.id
						headers: event.args
				else if event.args.length # Ex
					nanika.request 'anchorselectex',
						id: event.id
						label: event.text
						args: event.args
				else # normal
					nanika.request 'anchorselectex',
						id: event.id
						label: event.text
					, (response_args, response) ->
						if not response_args.value? or not response_args.value.length
							nanika.request 'anchorselect',
								id: event.id
