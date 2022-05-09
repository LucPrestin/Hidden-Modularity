export function randomColor() {
    const maxColorVal = 0xFFFFFF
    const randomColor = Math.random() * maxColorVal
    return "#" + Math.floor(randomColor).toString(16);
}

export function uniqueRandomColor(id, dict) {
    var color = randomColor();
    while (Object.values(dict).includes(color)) {
        color = randomColor();
    }
    return color
}