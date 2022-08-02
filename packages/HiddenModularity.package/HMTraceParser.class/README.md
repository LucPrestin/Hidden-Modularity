An HMTraceParser extracts different types of communication based graphs off of TDBTrace objects.

Instance Variables
	blacklist:		<Array>
	colorLabelExtractionBlock:		<BlockClosure>
	graphType:		<Object>
	idExtractionBlock:		<Object>
	labelExtractionBlock:		<Object>

Class Variables
	Colors:		<Dictionary>

blacklist
	- Blacklisted strings that no node will be created for

colorLabelExtractionBlock
	- Returns a string for a Context object. 
	- For each string a color for a vertex is calculated

graphType
	- a string that denotes the type of graphs.
	- should be one of the types denoted in HMGraph

idExtractionBlock
	- Returns a string for a Context object
	- For each distinct string a vertex is created.
	- Aggregation happens through creating the same ID for multiple contexts

labelExtractionBlock
	- Returns a string for a Context object
	- Results in the label of a vertex in the graph
	- This should be of the same granularity as the idExtractionBlock as it is the one way to denote what elements were aggregated
