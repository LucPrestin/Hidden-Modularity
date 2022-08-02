as yet unclassified
windowLayouting
	<scenario>
	
	| browser window cursor |
	
	browser := SystemBrowser defaultOpenBrowser.
	window := browser containingWindow.
	
	window submorphsDo: [:submorph | submorph layoutChanged].
	
	cursor := TDBCursor traceForBlock: [window fullBounds].
	
	window delete.
	
	^ cursor