information retrieving
methodPackageExtractionBlock

	^ [:aMethodContext | 
		self packageExtractionBlock value: aMethodContext receiver]
