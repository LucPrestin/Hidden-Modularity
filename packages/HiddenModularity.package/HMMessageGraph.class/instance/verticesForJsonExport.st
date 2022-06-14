accessing
verticesForJsonExport

	| result |
	
	result := self vertices veryDeepCopy.
	result valuesDo: [:vertex | 
		vertex at: 'color' put: ((vertex at: 'color') asHTMLColor)].
	
	^ result
