scenario
fetchingGoogleWithContentAccess
	<scenario>

	^ TDBCursor traceForBlock: [(WebClient httpGet: 'https://google.com') content]