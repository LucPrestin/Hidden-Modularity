scenarios
fetchingGoogle

	^ TDBCursor traceForBlock: [(WebClient httpGet: 'https://google.com') content]