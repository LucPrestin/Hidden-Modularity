as yet unclassified
uniqueColorWithCurrentColors: existingColors

	| color |
	
	color := self colorCalculationBlock value.
	
	[existingColors includes: color] whileTrue: [color := self colorCalculationBlock value].

	^ color