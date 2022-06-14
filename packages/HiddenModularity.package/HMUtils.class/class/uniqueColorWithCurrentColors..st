as yet unclassified
uniqueColorWithCurrentColors: existingColors

	| color |
	
	color := Color random.
	
	[existingColors includes: color] whileTrue: [color := Color random].

	^ color