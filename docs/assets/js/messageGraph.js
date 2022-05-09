import * as d3 from "https://cdn.skypack.dev/d3@7";
import { forceSimulation, forceLink, forceManyBody, forceCollide } from "https://cdn.skypack.dev/d3-force@3";
import { uniqueRandomColor } from "./utils.js"

// ==================== interface ==================== //

export async function runSimulationWithDataFromFile(filePath) {
    const data = await (await fetch(filePath)).json
    runSimulationWithData(data)
}

// ==================== helpers ==================== //

function runSimulationWithData(data) {
    var svg = d3.select(container)
        .append("svg")
        .attr("width", "100%")
        .attr("height", "100%")
        .call(d3.zoom().on("zoom", function (event) {
            svg.attr("transform", event.transform)
        }))
        .append("g")

    const { nodes, nodeMap } = createNodes(data);
    const colors = createColorCategories(nodes);
    const links = createLinks(nodeMap, data);

    const simulation = forceSimulation(nodes)
        .force("link", forceLink(links))
        .force("charge", forceManyBody(-5))
        .force("collision", forceCollide().radius(function (d) {
            return d.radius;
        }))
        .on("tick", () => ticked(nodes, colors));

    setTimeout(function () {
        simulation.stop();
    }, 5000);
}

function createNodes(data) {
    const nodeMap = {};
    Object.keys(data).forEach((caller) => {
        nodeMap[caller] = newNode(caller)
        Object.keys(data[caller]).forEach(callee => {
            if (!nodeMap[callee]) {
                nodeMap[callee] = newNode(callee);
            }
        });
    });
    Object.keys(nodeMap).forEach((nodeName, index) => {
        nodeMap[nodeName].index = index;
    });

    const nodes = [];
    Object.keys(nodeMap).forEach(nodeName => {
        nodes.push(nodeMap[nodeName])
    });

    return { nodes, nodeMap }
}

function newNode(label) {
    return {
        label: label,
        index: null,
        x: 400,
        y: 400,
        vx: 0,
        vy: 0,
        radius: 20,
        category: label.match(/^.*>>/) ? label.match(/^.*>>/)[0] : 'default'
    }
}

function createColorCategories(nodes) {
    var colors = {
        default: 'white'
    }
    nodes.forEach(node => {
        if (!colors[node.category]) {
            colors[node.category] = uniqueRandomColor(node.category, colors)
        }
    })
    return colors
}

function createLinks(nodeMap, data) {
    const links = [];
    Object.keys(data).forEach(caller => {
        Object.keys(data[caller]).forEach(callee => {
            links.push({
                source: nodeMap[caller].index,
                target: nodeMap[callee].index,
                strength: data[caller][callee] * 2
            });
        });
    });
    return links
}

function ticked(nodes, colors) {
    d3.select('svg g')
        .selectAll('circle')
        .data(nodes)
        .join('circle')
        .attr('r', function (d) {
            return d.radius
        })
        .style('fill', function (d) {
            return colors[d.category] ? colors[d.category] : colors.default
        })
        .style('stroke', "black")
        .attr('cx', function (d) {
            return d.x
        })
        .attr("cy", function (d) {
            return d.y
        })
        .on('click', function (d) {
            console.log(d.target.__data__.label)
        })

    d3.select('svg g')
        .selectAll('text')
        .data(nodes)
        .join('text')
        .text(function (d) {
            return d.label
        })
        .attr('x', function (d) {
            return d.x
        })
        .attr('y', function (d) {
            return d.y
        })
}
