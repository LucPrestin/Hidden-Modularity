information retrieving
uniqueColor: existingColors 
	
	| color |
	
	color := Color h: 360 atRandom s: 0.5 v: 1.
	
	existingColors size = 360
		ifFalse: [[existingColors includes: color]
				whileTrue: [color := Color h: 360 atRandom s: 0.5 v: 1]].
	
	^ color
