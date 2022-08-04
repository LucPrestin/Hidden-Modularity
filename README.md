# Hidden-Modularity

This project aims at helping to understand Squeak/Smalltalk by utilizing traces of run-time communication.

Objects and the messages they send to each other are the basis of any object-oriented program. As the size of a program growths, it gets less and less comprehensible. The static structure like the inheritance tree or protocol definitions can only poorly, if at all, capture the dynamic behavior of a living object-oriented system. Which objects communicate with one another is hidden. We want to make these hidden modules explicit.

For information on how we did that, have a look at the [wiki](https://github.com/LucPrestin/Hidden-Modularity/wiki). There you can also find an extended version of the background and research goal mentioned below. Our gained insights are also documented in the wiki.

For the visualizations we created, have a look at the [GitHub-Pages](https://lucprestin.github.io/Hidden-Modularity/). The traces to use with the visualization can be found in the corresponding [asset folder](https://github.com/LucPrestin/Hidden-Modularity/tree/main/visualizations/assets/traceData).

## Research Goal

This project aims at exploring and documenting the main features of Squeak/Smalltalk regarding the communication structure. These features include, but are not limited to:

- User Input
- Graphics Output
- Network Access
- Exception Handling
- Event Handling

Furthermore, we want to reveal the modular structure that cross cuts the static structure such as the inheritance tree or protocol definitions.

This information is then used to sketch out ideas for new exploratory programming tools.

## Installation

```Smalltalk
Metacello new
  baseline: 'HiddenModularity';
  repository: 'github://LucPrestin/Hidden-Modularity:main/packages';
  load: #default.
```

## Related Work

- The trace debugger is used to trace object communication within Squeak/Smalltalk to gain the data ([https://github.com/hpi-swa-lab/squeak-tracedebugger](https://github.com/hpi-swa-lab/squeak-tracedebugger))
