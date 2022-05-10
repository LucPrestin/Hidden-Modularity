The subfolders of this represent a different traced part of Squeak/Smalltalk. Within each folder, there are different json files, each representing different granularities of the trace.

The trace was then molded into a message graph by looking at each method call and executing `sender perform: <selection symbol>` and `receiver perform: <selection symbol>` respectively to get a representation for the method. This allows for different granularities, as `Object>>perform:` takes a symbol and executes it on itself. This way, grouping is made easier. We could look at classes for example by executing `sender perform: #class`.

Example: in morphDrawOn/asString.json the following code was traced:

```Smalltalk
HMTracedMorph>>drawOn: aCanvas

[self drawOn: aCanvas] traceAndDebug
```

And them extracted into the graph by using `sender perform: #asString` and `receiver perform: #asString`.
