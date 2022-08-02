scenario
fetchingGoogleWithoutContentAccess
	<scenario>

	^ TDBCursor traceForBlock: [WebClient httpGet: 'https://google.com']