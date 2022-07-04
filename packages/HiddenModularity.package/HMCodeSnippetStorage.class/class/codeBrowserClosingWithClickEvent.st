scenarios
codeBrowserClosingWithClickEvent
	<scenario>
	
	| browser button |
	
	browser := SystemBrowser defaultOpenBrowser.
	button := browser containingWindow labelArea submorphs first.
	
	^ TDBCursor traceForBlock: [
		self
			handleEvent: ((UserInputEventTests new redMouseDownAt: button center)
				setHand: self currentHand).
		self
			handleEvent: ((UserInputEventTests new redMouseUpAt: button center)
				setHand: self currentHand)]
