tracing
exportMethodCategoryGraphs
	
	| traceMethods |
	
	traceMethods := self class methodDict values
				select: [:method | method hasPragma: #scenario].
	
	traceMethods do: [:traceMethod | self exportMethodCategoryGraphForMethod: traceMethod]
