baseline
baseline: spec 
	<baseline>

	spec
		for: #common
		do: [
			"dependencies"
			spec
				baseline: 'TraceDebugger'
				with: [spec repository: 'github://hpi-swa-lab/squeak-tracedebugger:main/packages'].
			
			"packages"
			spec				
				package: 'HiddenModularity'
				with: [spec requires: #('TraceDebugger')].
			
			"groups"
			spec group: #default with: #('HiddenModularity')]