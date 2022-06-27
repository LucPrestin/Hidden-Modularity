information retrieving
packageExtractionBlock

	^ [:anObject | (PackageOrganizer default packageOfSystemCategory: anObject class category) packageName]
