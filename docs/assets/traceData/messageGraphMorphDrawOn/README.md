All data in this folder comes from tracing the same code:

```Smalltalk
HMTracedMorph>>drawOn: aCanvas

[self drawOn: aCanvas] traceAndDebug
```

The only difference is in the message graph extraction. The sender and receiver can be mapped using several ways. The file name represents the symbol that was used to generate the sender/receiver key for the dictionary. E.g. asString.json means: `sender perform: #asString` was used to add the sender to the message graph.
