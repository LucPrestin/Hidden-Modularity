information retrieving
uniqueColor: existingColors

	| color |
	
	"fix that we can only have 360 colors with this and don't account for all colors being already used"
	self flag: #todo.
	
	color := Color h: 360 atRandom s: 0.5 v: 1.
	
	[existingColors includes: color] whileTrue: [color := Color h: 360 atRandom s: 0.5 v: 1].

	^ color
