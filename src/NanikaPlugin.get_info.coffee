string_header = (version) -> if version == '3.0' then 'Value' else 'String'
NanikaPlugin.get_info =
	initialize: (nanika) ->
		nanika.on 'version.set', ->
			nanika.request 'username', null, (args) ->
				nanika.resource.username = args.value
		nanika.on 'version.set', ->
			nanika.request 'sakura.recommendsites', null, (args, response) ->
				nanika.resource["sakura.recommendsites"] = response.headers.get_separated2(string_header(nanika.protocol_version))
		nanika.on 'version.set', ->
			nanika.request 'sakura.portalsites', null, (args, response) ->
				nanika.resource["sakura.portalsites"] = response.headers.get_separated2(string_header(nanika.protocol_version))
		nanika.on 'version.set', ->
			nanika.request 'kero.recommendsites', null, (args, response) ->
				nanika.resource["kero.recommendsites"] = response.headers.get_separated2(string_header(nanika.protocol_version))
