as yet unclassified
traceNetworkAccess

	^ TDBCursor traceForBlock: [(WebClient httpGet: 'https://google.com') content]