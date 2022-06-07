import * as d3 from "https://cdn.skypack.dev/d3@7";
import { forceSimulation, forceLink, forceManyBody, forceCollide } from "https://cdn.skypack.dev/d3-force@3";
import { uniqueRandomColor } from "./utils.js"

// ==================== interface ==================== //

export async function runSimulationWithDataFromFileAndGranularity(
    filePath,
    granularity = {
        vertex_granularity: "identityHash",
        color_granularity: "identityHash",
        label_granularity: "identityHash"
    },
    show_edges = false,
    onSimulationFinished = () => { }) 
{
    console.log("fetching data ...")
    const data = await (await fetch(filePath)).json();
    console.log("done")
    runSimulationWithDataAndGranularity(data, granularity, show_edges, onSimulationFinished);
}

export function runSimulationWithDataAndGranularity(
    data,
    granularity = {
        vertex_granularity: "identityHash",
        color_granularity: "identityHash",
        label_granularity: "identityHash"
    },
    show_edges = false,
    onSimulationFinished = () => { }) 
{
    console.log("preparing simulation ...")
    let svg = d3.select(container)
        .append("svg")
        .attr("width", "100%")
        .attr("height", "100%")
        .call(d3.zoom().on("zoom", function (event) {
            svg.attr("transform", event.transform)
        }))
        .append("g")

    const { nodes, nodeMap } = createNodes(data, granularity);
    const links = createLinks(nodeMap, data, granularity);
    setSizeByEdges(nodes, links)
    const colors = createColors(nodeMap, granularity);
    const averageLinkForce = links.reduce((sum, link) => sum + link.strength, 0) / links.length

    console.log("done")
    console.log("running simulation ...")

    const simulation = forceSimulation(nodes)
        .force("link", forceLink(links))
        .force("charge", forceManyBody().strength(averageLinkForce * (-1)))
        .force("collision", forceCollide().radius(function (d) {
            return d.radius;
        }))
        .on("tick", () => ticked(nodes, links, colors, granularity, show_edges));

    setTimeout(function () {
        simulation.stop();
        onSimulationFinished();
        console.log("done")
    }, 8000);
}

// ==================== helpers ==================== //

const minNodeRadius = 30;
const radiusIncrement = 5;

function createNodes(data, granularity) {
    const nodeMap = {};
    Object.values(data.vertices).forEach((vertex) => {
        const id = vertex[granularity.vertex_granularity];

        if (!nodeMap[id]) {
            nodeMap[id] = newNode(vertex, granularity)
        } else {
            nodeMap[id].data.push(vertex)
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

function newNode(vertex, granularity) {
    return {
        label: vertex[granularity.label_granularity],
        index: null,
        x: 400,
        y: 400,
        vx: 0,
        vy: 0,
        // each node has at least one edge, so it will be incremented at least one time.
        // for the minNodeRadius to be an actual min, this is taken into account
        // at node construction
        radius: minNodeRadius - radiusIncrement,
        data: [vertex]
    }
}

function createLinks(nodeMap, data, granularity) {
    const edgeMap = {};
    data.edges.forEach(edge => {
        const sourceId = data.vertices[edge.source][granularity.vertex_granularity]
        const targetId = data.vertices[edge.target][granularity.vertex_granularity]

        if (!edgeMap[sourceId]) edgeMap[sourceId] = {}
        if (!edgeMap[sourceId][targetId]) edgeMap[sourceId][targetId] = { weight: 0, data: [] }
        edgeMap[sourceId][targetId].weight += edge.weight
        edgeMap[sourceId][targetId].data.push(edge)
    })

    const links = [];
    Object.keys(edgeMap).forEach(sourceId => {
        Object.keys(edgeMap[sourceId]).forEach(targetId => {
            links.push({
                source: nodeMap[sourceId].index,
                target: nodeMap[targetId].index,
                strength: edgeMap[sourceId][targetId].weight,
                data: edgeMap[sourceId][targetId].data
            })
        })
    })

    return links
}

function setSizeByEdges(nodes, links) {
    links.forEach(link => {
        nodes[link.source].radius += radiusIncrement
        nodes[link.target].radius += radiusIncrement
    })
}

function createColors(nodeMap, granularity) {
    const colors = {};

    Object.keys(nodeMap).forEach(nodeName => {
        const node = nodeMap[nodeName];
        const id = node.data[0][granularity.color_granularity]
        colors[id] = uniqueRandomColor(id, colors)
    })

    return colors
}

function ticked(nodes, links, colors, granularity, show_edges) {
    d3.select('svg g')
        .selectAll('circle')
        .data(nodes)
        .join('circle')
        .attr('r', function (d) {
            return d.radius
        })
        .style('fill', function (d) {
            return colors[d.data[0][granularity.color_granularity]]
        })
        .style('stroke', "black")
        .attr('cx', function (d) {
            return d.x
        })
        .attr("cy", function (d) {
            return d.y
        })
        .on('click', function (d) {
            console.log(d.target.__data__)
        })

    d3.select('svg g')
        .selectAll('text')
        .data(nodes)
        .join('text')
        .text(function (d) {
            return d.radius > minNodeRadius ? d.label : ""
        })
        .attr('x', function (d) {
            return d.x
        })
        .attr('y', function (d) {
            return d.y
        })

    if (show_edges) {
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
}
