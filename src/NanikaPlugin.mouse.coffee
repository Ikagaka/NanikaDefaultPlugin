NanikaPlugin.mouse =
	initialize: (nanika) ->
		nanika.on 'named.initialized', ->
			mouseevents = ['mousedown', 'mousemove', 'mouseup', 'mouseclick', 'mousedblclick']
			for event_id in mouseevents
				nanika.named.on event_id, ((event_id) ->
					(event) ->
						nanika.request event_id, event
				)(event_id)
