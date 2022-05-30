tracing
traceNetworkAccess

	^ TDBCursor traceForBlock: [(WebClient httpGet: 'https://google.com') content]