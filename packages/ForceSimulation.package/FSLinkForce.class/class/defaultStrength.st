as yet unclassified
defaultStrength

	^ [:link :count | 1 / {count at: link source index . count at: link target index} min]