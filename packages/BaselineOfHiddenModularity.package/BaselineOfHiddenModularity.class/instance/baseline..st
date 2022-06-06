baseline
baseline: spec 
	<baseline>

	spec
		for: #common
		do: [spec
				package: 'TraceDebugger'
				with: [spec repository: 'github://hpi-swa-lab/squeak-tracedebugger:master/packages'];
				
				package: 'HiddenModularity'
				with: [spec requires: #('TraceDebugger')].
			spec group: 'default' with: #('HiddenModularity')]