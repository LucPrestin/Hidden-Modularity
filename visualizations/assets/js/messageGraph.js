import * as d3 from '../../node_modules/d3/dist/d3.min.js'
import {
    forceSimulation,
    forceLink,
    forceManyBody,
    forceCollide
} from '../../node_modules/d3-force/dist/d3-force-min.js'

// begin utils //

function deepCopy(obj) {
    return JSON.parse(JSON.stringify(obj))
}

function removeChildren(widget) {
    while (widget.firstChild) {
        widget.removeChild(widget.lastChild)
    }
}

// end utils //

// begin message graph code //

function runSimulationWithData(
    data,
    count_self_sends = false,
    show_edges = false,
    node_size_calculation_method,
    onSimulationFinished = () => {}
) {
    console.log('Simulation started.')

    const svg = d3
        .select(container)
        .append('svg')
        .attr('width', '100%')
        .attr('height', '100%')
        .call(
            d3.zoom().on('zoom', (event) => {
                svg.attr('transform', event.transform)
            })
        )
        .append('g')

    const { nodes, nodeMap } = createNodes(data)
    const links = createLinks(nodeMap, data, count_self_sends)

    setSizeByEdges(nodes, links, node_size_calculation_method)

    const averageLinkForce = links.reduce((sum, link) => sum + link.strength, 0) / links.length

    const simulation = forceSimulation(nodes)
        .force('link', forceLink(links))
        .force('charge', forceManyBody().strength(averageLinkForce * -1))
        .force(
            'collision',
            forceCollide().radius((d) => d.radius)
        )
        .on('tick', () => ticked(nodes, links, show_edges))

    setTimeout(() => {
        simulation.stop()
        onSimulationFinished()
        console.log('Simulation finished')
    }, 8000)
}

const minNodeRadius = 30
const radiusIncrement = 5

function createNodes(data) {
    const nodeMap = deepCopy(data.vertices)
    Object.keys(nodeMap).forEach((vertexKey) => {
        const id = vertexKey
        nodeMap[id] = newNode(nodeMap[id])
    })

    Object.keys(nodeMap).forEach((nodeName, index) => {
        nodeMap[nodeName].index = index
    })

    const nodes = []
    Object.keys(nodeMap).forEach((nodeName) => {
        nodes.push(nodeMap[nodeName])
    })

    return { nodes, nodeMap }
}

function newNode(vertex) {
    return {
        label: vertex.label,
        id: vertex.id,
        color: vertex.color ? vertex.color : 'white',
        index: null,
        x: 400,
        y: 400,
        vx: 0,
        vy: 0,
        // each node has at least one edge, so it will be incremented at least one time.
        // for the minNodeRadius to be an actual min, this is taken into account
        // at node construction
        radius: minNodeRadius - radiusIncrement
    }
}

function createLinks(nodeMap, data, count_self_sends) {
    const links = []

    data.edges.forEach((edge) => {
        if (count_self_sends || edge.sender !== edge.receiver) {
            links.push({
                source: nodeMap[edge.sender].index,
                target: nodeMap[edge.receiver].index,
                strength: edge.weight
            })
        }
    })

    return links
}

function setSizeByEdges(nodes, links, node_size_calculation_method) {
    if (
        node_size_calculation_method === 'incoming edges' ||
        node_size_calculation_method === 'all edges'
    ) {
        links.forEach((link) => {
            nodes[link.target].radius += radiusIncrement
        })
    }
    if (
        node_size_calculation_method === 'outgoing edges' ||
        node_size_calculation_method === 'all edges'
    ) {
        links.forEach((link) => {
            nodes[link.target].radius += radiusIncrement
        })
    }
}

function setSizeByAggregatedData(nodes) {
    nodes.forEach((node) => {
        node.radius += radiusIncrement * node.data.length
    })
}

function ticked(nodes, links, show_edges) {
    d3.select('svg g')
        .selectAll('circle')
        .data(nodes)
        .join('circle')
        .attr('r', (d) => d.radius)
        .style('fill', (d) => d.color)
        .style('stroke', 'black')
        .attr('cx', (d) => d.x)
        .attr('cy', (d) => d.y)
        .on('click', (d) => {
            console.log(d.target.__data__)
        })

    d3.select('svg g')
        .selectAll('text')
        .data(nodes)
        .join('text')
        .text((d) => d.label)
        .attr('x', (d) => d.x)
        .attr('y', (d) => d.y)

    if (show_edges) {
        d3.select('svg g')
            .selectAll('path')
            .data(links)
            .join('path')
            .attr(
                'd',
                d3
                    .link(d3.curveBasis)
                    .source((link) => [link.source.x, link.source.y])
                    .target((link) => [link.target.x, link.target.y])
            )
            .attr('fill', 'none')
            .attr('stroke', 'black')
    }
}

// end message graph code //

function load_json(file) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader()
        reader.onload = () => {
            resolve(JSON.parse(reader.result))
        }
        reader.onerror = (error) => reject(error)
        reader.readAsText(file)
    })
}

// begin UI/UX code //

const container = document.getElementById('container')

const dataset_file_input = document.getElementById('input-file-dataset')
const count_self_sends_checkbox = document.getElementById('checkbox_count_self_sends')
const edge_checkbox = document.getElementById('checkbox_show_edges')
const select_node_size_calculation = document.getElementById('select_node_size_calculation')
const button = document.getElementById('button-confirm')

const ui_elements = [
    dataset_file_input,
    count_self_sends_checkbox,
    edge_checkbox,
    select_node_size_calculation,
    button
]

button.addEventListener('click', async () => {
    let errorMessage = ''
    const node_size_calculation_method =
        select_node_size_calculation.options[select_node_size_calculation.selectedIndex].value

    if (!dataset_file_input.files.length > 0) {
        errorMessage += 'Please select a dataset\n'
    }
    if (!node_size_calculation_method) {
        errorMessage += 'Please choose a node size calculation method\n'
    }

    if (errorMessage === '') {
        removeChildren(container)
        ui_elements.forEach((element) => (element.disabled = true))
        runSimulationWithData(
            await load_json(dataset_file_input.files[0]),
            count_self_sends_checkbox.checked,
            edge_checkbox.checked,
            node_size_calculation_method,
            () => {
                ui_elements.forEach((element) => (element.disabled = false))
            }
        )
    } else {
        alert(errorMessage)
    }
})

// end UI/UX code //
