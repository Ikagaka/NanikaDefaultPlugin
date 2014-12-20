NanikaPlugin.version =
	initialize: (nanika) ->
		nanika.on 'materialized', ->
			nanika.request 'version', null, (response_args, response) ->
				# support 2.6 or 3.0 not 1.x
				if response.status_line.code == 200 && response.status_line.version != '3.0'
					nanika.protocol_version = '2.6'
					nanika.resource.version = response.headers.header.Version
					nanika.resource.name = response.headers.header.ID
					nanika.resource.craftman = response.headers.header.Craftman
					nanika.resource.craftmanw = response.headers.header.Craftman
				else
					nanika.protocol_version = '3.0'
					nanika.request 'version', null, (response_args) -> nanika.resource.version = response_args.value
					nanika.request 'name', null, (response_args) -> nanika.resource.name = response_args.value
					nanika.request 'craftman', null, (response_args) -> nanika.resource.craftman = response_args.value
					nanika.request 'craftmanw', null, (response_args) -> nanika.resource.craftmanw = response_args.value
				nanika.emit 'version.set'
