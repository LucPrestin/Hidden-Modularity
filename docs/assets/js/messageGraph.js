import * as d3 from "https://cdn.skypack.dev/d3@7";
import { forceSimulation, forceLink, forceManyBody, forceCollide } from "https://cdn.skypack.dev/d3-force@3";
import { uniqueRandomColor } from "./utils.js"

// ==================== interface ==================== //

export async function runSimulationWithDataFromFileAndGranularity(filePath, granularity, onSimulationFinished = () => { }) {
    const data = await (await fetch(filePath)).json();
    runSimulationWithData(data, granularity, onSimulationFinished);
}

export function runSimulationWithDataAndGranularity(data, granularity, onSimulationFinished = () => { }) {
    var svg = d3.select(container)
        .append("svg")
        .attr("width", "100%")
        .attr("height", "100%")
        .call(d3.zoom().on("zoom", function (event) {
            svg.attr("transform", event.transform)
        }))
        .append("g")

    const { nodes, nodeMap } = createNodes(data, granularity);
    const links = createLinks(nodeMap, data, granularity);
    const averageLinkForce = links.reduce((sum, link) => sum + link.strength, 0) / links.length

    const simulation = forceSimulation(nodes)
        .force("link", forceLink(links))
        .force("charge", forceManyBody().strength(averageLinkForce * (-1)))
        .force("collision", forceCollide().radius(function (d) {
            return d.radius;
        }))
        .on("tick", () => ticked(nodes, links));

    setTimeout(function () {
        simulation.stop();
        onSimulationFinished();
    }, 5000);
}

// ==================== helpers ==================== //

function createNodes(data, granularity) {
    const nodeMap = {};
    Object.values(data.vertices).forEach((vertex) => {
        const id = vertex[granularity];

        if (!nodeMap[id]) {
            nodeMap[id] = newNode(id)
        }
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
        radius: 50,
    }
}

function createLinks(nodeMap, data, granularity) {
    const edgeMap = {};
    data.edges.forEach(edge => {
        const sourceId = data.vertices[edge.source][granularity]
        const targetId = data.vertices[edge.target][granularity]

        if(!edgeMap[sourceId]) edgeMap[sourceId] = {}
        if(!edgeMap[sourceId][targetId]) edgeMap[sourceId][targetId] = 0
        edgeMap[sourceId][targetId] += edge.weight
    })

    const links = [];
    Object.keys(edgeMap).forEach(sourceId => {
        Object.keys(edgeMap[sourceId]).forEach(targetId => {
            links.push({
                source: nodeMap[sourceId].index,
                target: nodeMap[targetId].index,
                strength: edgeMap[sourceId][targetId]
            })
        })
    })
    
    return links
}

function ticked(nodes, links) {
    d3.select('svg g')
        .selectAll('circle')
        .data(nodes)
        .join('circle')
        .attr('r', function (d) {
            return d.radius
        })
        .style('fill', 'white')
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

    d3.select('svg g')
        .selectAll('path')
        .data(links)
        .join("path")
        .attr("d", d3.link(d3.curveBasis)
            .source(link => [link.source.x, link.source.y])
            .target(link => [link.target.x, link.target.y]))
        .attr("fill", "none")
        .attr("stroke", "black")
}
