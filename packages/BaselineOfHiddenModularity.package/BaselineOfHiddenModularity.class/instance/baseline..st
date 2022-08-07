baseline
baseline: spec 
	<baseline>

	spec
		for: #common
		do: [
			"dependencies"
			spec
				package: 'TraceDebugger'
				with: [spec 
						repository: 'github://hpi-swa-lab/squeak-tracedebugger:main/packages';
						loads: 'default'].
			
			"packages"
			spec				
				package: 'HiddenModularity'
				with: [spec requires: #('TraceDebugger')].
			
			"groups"
			spec group: #default with: #('HiddenModularity')]