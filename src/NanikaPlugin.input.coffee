NanikaPlugin.input =
	initialize: (nanika) ->
		nanika.on 'materialized', ->
			nanika.named.on 'userinput', (event) ->
				if event.content?
					nanika.request 'userinput',
						id: event.id
						content: event.content
				else
					nanika.request 'userinputcancel',
						id: event.id
						reason: 'close'
			nanika.named.on 'communicateinput', (event) ->
				if event.content?
					nanika.request 'communicate',
						sender: 'user'
						content: event.content
				else
					nanika.request 'communicateinputcancel',
						reason: 'cancel'
