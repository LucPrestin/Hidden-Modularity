scenario
codeBrowserClosingWithClickEvent
	<scenario>

	| browser button hand |

	hand := HandMorph new.
	browser := SystemBrowser defaultOpenBrowser.
	button := browser containingWindow labelArea submorphs first.
	
	^ TDBCursor
		traceForBlock: [
			button handleEvent: (
				(UserInputEventTests new redMouseDownAt: button center)
					setHand: hand).
			button handleEvent: (
				(UserInputEventTests new redMouseUpAt: button center)
					setHand: hand)]