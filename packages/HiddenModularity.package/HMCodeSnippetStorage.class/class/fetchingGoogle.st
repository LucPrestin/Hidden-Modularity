scenarios
fetchingGoogle
	<scenario>

	^ TDBCursor traceForBlock: [(WebClient httpGet: 'https://google.com') content]