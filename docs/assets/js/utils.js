export function randomColor() {
    const maxColorVal = 0xFFFFFF
    const randomColor = Math.random() * maxColorVal
    return "#" + Math.floor(randomColor).toString(16);
}

export function uniqueRandomColor(id, dict) {
    let color = randomColor();
    while (Object.values(dict).includes(color)) {
        color = randomColor();
    }
    return color
}

export function removeChildren(widget) {
    while (widget.firstChild) {
        widget.removeChild(widget.lastChild);
    }
}

export function granularityOptions() {
    return {
        None: {
            text: "None",
            value: "None",
            default_selected: true,
            selected: true,
            index: 0,
            disabled: true
        }, identityHash: {
            text: "Object identity",
            value: "identityHash",
            default_selected: false,
            selected: false,
            index: 1,
            disabled: false
        }, name: {
            text: "Object name",
            value: "name",
            default_selected: false,
            selected: false,
            index: 2,
            disabled: false
        }, methodReference: {
            text: "Method reference (only for compiled methods)",
            value: "methodReference",
            default_selected: false,
            selected: false,
            index: 3,
            disabled: false
        }, methodCategory: {
            text: "Method category (only for compiled methods)",
            value: "methodCategory",
            default_selected: false,
            selected: false,
            index: 4,
            disabled: false
        }, class: {
            text: "Object class",
            value: "class",
            default_selected: false,
            selected: false,
            index: 5,
            disabled: false
        }, category: {
            text: "Object class category",
            value: "category",
            default_selected: false,
            selected: false,
            index: 6,
            disabled: false
        }, package: {
            text: "Object class package",
            value: "package",
            default_selected: false,
            selected: false,
            index: 7,
            disabled: false
        }
    }
}

export function disableOptionsByIndex(threshold, number_of_options, selects = [], smallerThreshold = true) {
    for (let option_index = 1; option_index < number_of_options; option_index++) {
        if ((option_index < threshold) === smallerThreshold) {
            selects.forEach(select => select.options[option_index].disabled = true);
        } else {
            selects.forEach(select => select.options[option_index].disabled = false);
        }
    }
    selects.forEach(select => select.options[threshold].disabled = false);
}
