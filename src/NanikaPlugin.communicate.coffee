NanikaPlugin.communicate =
	initialize: (nanika) ->
		nanika.on 'materialized', ->
			nanika.on 'ssp.finish', (response_args, response) ->
				if response_args.Reference0?
					args = []
					for name, value of response_args
						if result = name.match /^Reference(\d+)$/
							index = result[1] - 1
							if index
								args[index] = value
					nanika.nanikamanager.communicate nanika.ghost.descript.sakuraname, response_args.Reference0, response_args.value, args, response_args.Age, response_args.Surface
