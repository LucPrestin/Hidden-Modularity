scenarios
windowFullBounds
	<scenario>
	
	| browser window cursor |
	
	browser := SystemBrowser defaultOpenBrowser.
	window := browser containingWindow.
	
	cursor := TDBCursor traceForBlock: [window fullBounds].
	
	window delete.
	
	^ cursor