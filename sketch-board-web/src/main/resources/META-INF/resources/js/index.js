import * as d3 from 'd3/dist/d3';

export default function(portletNamespace, json) {
    Liferay.Loader.require('sketch-board-web@1.0.0/js/noteit.board.es',
                function (noteit) {

        function createBoard(json) {
            board = new noteit.SketchBoard(`#${portletNamespace}-mainSVG`,
                    undefined, undefined, false, gallery);
            let s = new noteit.Stack(board, board.group,
                        "Type", ["#f7ff72", "#ff6ee2", "#6ee0ff"], [14,14]);
            if (typeof json !== 'undefined' && json.length > 3 ) {
                board.fromJSON(json);
            }
        }

        var gallery = new noteit.Gallery([], false);
        var board;
        createBoard(json);

        var boardDiv = d3.select(`#${portletNamespace}-board`);
        boardDiv.style("height", "100%");
        boardDiv.style("width", "100%");
        var storeDiv = d3.select(`#${portletNamespace}-persist`);
        var store = d3.select(`#${portletNamespace}-json`);

        storeDiv.style("height", "0px");
        storeDiv.style("width", "100%");
        storeDiv.style("visibility", "hidden");

        var switchToJSONButton = d3.select(`#${portletNamespace}-svg-json-button`);
        var switchToSVGButton = d3.select(`#${portletNamespace}-json-svg-button`);

        switchToJSONButton.on("click", function() {
            storeDiv.style("visibility", "visible");
            storeDiv.style("height", "100%");
            boardDiv.style("visibility", "hidden");
            boardDiv.style("height", "0px");
            let t = board.toJSON("  ");
            board.group.remove();
            board = null;
            store.property("value", t);
            store.text(t);
        });

        switchToSVGButton.on("click", function() {
            storeDiv.style("visibility", "hidden");
            storeDiv.style("height", "0px");
            boardDiv.style("visibility", "visible");
            boardDiv.style("height", "100%");
            createBoard(store.node().value);
        });
    });
}

