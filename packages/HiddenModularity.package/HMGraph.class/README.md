A HMGraph is a container for the graphs that the HMTraceParser generates. It encapsulates adding edges and vertices as well as exporting the graph to a file.

Instance Variables
	edges:		<Dictionary>
	graphType:		<String>
	scenarioName:		<String>
	vertices:		<Dictionary>

edges
	- The edges of the graph.
	- Format: {
		'sender1Id': {
			'receiver1Id': <number of messages>,
			'receiver2Id': <number of messages>
		}, 'sender2Id': {
			'receiver2Id': <number of messages>,
			'receiver4Id': <number of messages>
		}, ...
	}

graphType
	- string that marks what type of graphs this is. 
	- The current types of graphs are denoted on the class side in the message category 'constants'

scenarioName
	- string that marks the name of the scenario
	- this is used for the file name of the json export

vertices
	- The vertices of the graph.
	- The format is: {
		'vertex1Id': {
			'id': 'vertex1Id',
			'label': <label string>,
			'color': <color>
		}, ...
	}
