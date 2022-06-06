as yet unclassified
nextSeed

	self currentSeed:  self currentSeed * self class multiplier + self class increment \\ self class modulus.
	
	^ self currentSeed / self class multiplier