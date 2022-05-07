# Hidden-Modularity

This repo contains code snippes that were used to work towards the research goal below. For the gained insights and further information, have a look at the [wiki](https://github.com/LucPrestin/Hidden-Modularity/wiki).

For the visualizations made with JavaScript, have a look at the [github pages entry](https://lucprestin.github.io/Hidden-Modularity/).

## Background

Objects and the messages they send to each other are the basis of any object-oriented program. As the size of a program growths, the structure gets less and less comprehensible. The static structure like the inheritance tree or protocol definitions can only poorly, if at all, capture the dynamic behavior of a living object-oriented system. Which objects communicate with one another is hidden.

## Research Goal

This project aims at exploring and documenting the main features of Squeak/Smalltalk regarding the communication structure. These features include, but are not limited to:

- User Input
- Graphics Output
- Network Access

Furthermore, we want to reveal the modular structure that cross cuts the static structure such as the inheritance tree or protocol definitions.

This information is then used to sketch new ideas for new exploratory programming tools

## Related Work

- The trace debugger is used to trace object communication within Squeak/Smalltalk to gain the data ([https://github.com/hpi-swa-lab/squeak-tracedebugger](https://github.com/hpi-swa-lab/squeak-tracedebugger))
