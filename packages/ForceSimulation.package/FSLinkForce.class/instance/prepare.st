initialization
prepare

	self nodes size > 0
		ifTrue: [self prepareCount; prepareBias; prepareStrenghts; prepareDistances]