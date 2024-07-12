<script setup lang="ts">
import ModalApi from "@/pages/Workflow/Components/ModalApi.vue";
import ModalConfigConectionDB from "@/pages/Workflow/Components/ModalConfigConectionDB.vue";
import ModalDB from "@/pages/Workflow/Components/ModalDB.vue";
import { useWorkflowStore } from "@/stores/useWorkflowStore";

// import { AuthenticationStore } from "@/stores/Authentication";
// const authentication = AuthenticationStore();
import * as go from "gojs";

const workflowStore = useWorkflowStore();
const { modalDb, modalApi } = storeToRefs(workflowStore);

let myDiagram: any = null;
let myPalette: any = null;
const myDiagramDiv: any = ref(null);
const myPaletteDiv: any = ref(null);
const $ = go.GraphObject.make;

const makePort = (name: any, spot: any, output: any, input: any) => {
    return $(go.Shape, "Circle", {
        fill: null,
        stroke: null,
        desiredSize: new go.Size(7, 7),
        alignment: spot,
        alignmentFocus: spot,
        portId: name,
        fromSpot: spot,
        toSpot: spot,
        fromLinkable: output,
        toLinkable: input,
        cursor: "pointer",
    });
};

const showSmallPorts = (node: any, show: any) => {
    node.ports.each((port: any) => {
        if (port.portId !== "") {
            port.fill = show ? "rgba(0,0,0,.3)" : null;
        }
    });
};

const nodeSelectionAdornmentTemplate = $(
    go.Adornment,
    "Auto",
    $(go.Shape, {
        fill: null,
        stroke: "deepskyblue",
        strokeWidth: 1.5,
        strokeDashArray: [4, 2],
    }),
    $(go.Placeholder)
);

const nodeResizeAdornmentTemplate = $(
    go.Adornment,
    "Spot",
    { locationSpot: go.Spot.Right },
    $(go.Placeholder),
    $(go.Shape, {
        alignment: go.Spot.TopLeft,
        cursor: "nw-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        alignment: go.Spot.Top,
        cursor: "n-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        alignment: go.Spot.TopRight,
        cursor: "ne-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        alignment: go.Spot.Left,
        cursor: "w-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        alignment: go.Spot.Right,
        cursor: "e-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        alignment: go.Spot.BottomLeft,
        cursor: "se-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        alignment: go.Spot.Bottom,
        cursor: "s-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        alignment: go.Spot.BottomRight,
        cursor: "sw-resize",
        desiredSize: new go.Size(6, 6),
        fill: "lightblue",
        stroke: "deepskyblue",
    })
);

const nodeRotateAdornmentTemplate = $(
    go.Adornment,
    { locationSpot: go.Spot.Center, locationObjectName: "ELLIPSE" },
    $(go.Shape, "Ellipse", {
        name: "ELLIPSE",
        cursor: "pointer",
        desiredSize: new go.Size(7, 7),
        fill: "lightblue",
        stroke: "deepskyblue",
    }),
    $(go.Shape, {
        geometryString: "M3.5 7 L3.5 30",
        isGeometryPositioned: true,
        stroke: "deepskyblue",
        strokeWidth: 1.5,
        strokeDashArray: [4, 2],
    })
);

const nodeTemplate = $(
    go.Node,
    "Spot",
    {
        locationSpot: go.Spot.Center,
        click: (e, node: any) => showNodeData(node.data),
    },
    new go.Binding("location", "loc", go.Point.parse).makeTwoWay(
        go.Point.stringify
    ),
    {
        selectable: true,
        selectionAdornmentTemplate: nodeSelectionAdornmentTemplate,
    },
    {
        resizable: true,
        resizeObjectName: "PANEL",
        resizeAdornmentTemplate: nodeResizeAdornmentTemplate,
    },
    {
        rotatable: true,
        rotateAdornmentTemplate: nodeRotateAdornmentTemplate,
    },
    new go.Binding("angle").makeTwoWay(),
    $(
        go.Panel,
        "Auto",
        { name: "PANEL" },
        new go.Binding("desiredSize", "size", go.Size.parse).makeTwoWay(
            go.Size.stringify
        ),
        $(
            go.Shape,
            "Rectangle",
            {
                portId: "",
                fromLinkable: true,
                toLinkable: true,
                cursor: "pointer",
                fill: "white",
                strokeWidth: 2,
            },
            new go.Binding("figure"),
            new go.Binding("fill")
        ),
        $(
            go.TextBlock,
            {
                font: "bold 10pt Helvetica, Arial, sans-serif",
                margin: 8,
                maxSize: new go.Size(160, NaN),
                wrap: go.TextBlock.WrapFit,
                editable: true,
            },
            new go.Binding("text").makeTwoWay()
        )
    ),
    makePort("T", go.Spot.Top, false, true),
    makePort("L", go.Spot.Left, true, true),
    makePort("R", go.Spot.Right, true, true),
    makePort("B", go.Spot.Bottom, true, false),
    {
        mouseEnter: (e, node) => showSmallPorts(node, true),
        mouseLeave: (e, node) => showSmallPorts(node, false),
    }
);

const linkSelectionAdornmentTemplate = $(
    go.Adornment,
    "Link",
    $(go.Shape, {
        isPanelMain: true,
        fill: null,
        stroke: "deepskyblue",
        strokeWidth: 0,
    })
);

const linkTemplate = $(
    go.Link,
    {
        selectable: true,
        selectionAdornmentTemplate: linkSelectionAdornmentTemplate,
    },
    {
        relinkableFrom: true,
        relinkableTo: true,
        reshapable: true,
    },
    {
        routing: go.Link.AvoidsNodes,
        curve: go.Link.JumpOver,
        corner: 5,
        toShortLength: 4,
    },
    new go.Binding("points").makeTwoWay(),
    $(
        go.Shape, // La forma de la ruta del enlace
        {
            isPanelMain: true,
            strokeWidth: 2,
        }
    ),
    $(
        go.Shape, // La punta de flecha
        { toArrow: "Standard", stroke: null }
    ),
    $(
        go.Panel,
        "Auto",
        new go.Binding("visible", "isSelected").ofObject(),
        //{ visible: true },
        $(
            go.Shape,
            "RoundedRectangle", // La forma del enlace
            {
                fill: "#F8F8F8",
                stroke: null,
            }
        ),
        $(
            go.TextBlock,
            {
                textAlign: "center",
                font: "10pt helvetica, arial, sans-serif",
                stroke: "#919191",
                margin: 2,
                minSize: new go.Size(10, NaN),
                editable: true,
            },
            new go.Binding("text").makeTwoWay()
        )
    )
);

//Paleta de GOJS
const paletteModel = new go.GraphLinksModel(
    [
        {
            text: "Inicio",
            figure: "Ellipse",
            size: "75 75",
            fill: "#00AD5F",
            code: "1",
        },
        { text: "Paso", code: "2" },
        { text: "DB", figure: "Database", fill: "lightgray", code: "3" },
        { text: "???", figure: "Diamond", fill: "lightskyblue", code: "4" },
        {
            text: "Fin",
            figure: "Ellipse",
            size: "75 75",
            fill: "#CE0620",
            code: "5",
        },
        {
            text: "Comentario",
            figure: "RoundedRectangle",
            fill: "lightyellow",
            code: "6",
        },
        {
            text: "Formulario",
            figure: "RoundedRectangle",
            fill: "lightyellow",
            code: "7",
        },
        {
            text: "API",
            figure: "RoundedRectangle",
            fill: "lightyellow",
            code: "8",
        },
    ],
    // authentication.workFlows,
    [
        {
            points: new go.List().addAll([
                new go.Point(0, 0),
                new go.Point(30, 0),
                new go.Point(30, 40),
                new go.Point(60, 40),
            ]),
        },
    ]
);

const initGoJs = () => {
    const $ = go.GraphObject.make;
    myDiagram = $(go.Diagram, myDiagramDiv.value, {
        grid: $(
            go.Panel,
            "Grid",
            $(go.Shape, "LineH", { stroke: "lightgray", strokeWidth: 0.5 }),
            $(go.Shape, "LineH", {
                stroke: "gray",
                strokeWidth: 0.5,
                interval: 10,
            }),
            $(go.Shape, "LineV", { stroke: "lightgray", strokeWidth: 0.5 }),
            $(go.Shape, "LineV", {
                stroke: "gray",
                strokeWidth: 0.5,
                interval: 10,
            })
        ),
        "draggingTool.dragsLink": true,
        "draggingTool.isGridSnapEnabled": true,
        "linkingTool.isUnconnectedLinkValid": true,
        "linkingTool.portGravity": 20,
        "relinkingTool.isUnconnectedLinkValid": true,
        "relinkingTool.portGravity": 20,
        "relinkingTool.fromHandleArchetype": $(go.Shape, "Diamond", {
            segmentIndex: 0,
            cursor: "pointer",
            desiredSize: new go.Size(8, 8),
            fill: "tomato",
        }),
        "relinkingTool.toHandleArchetype": $(go.Shape, "Diamond", {
            segmentIndex: -1,
            cursor: "pointer",
            desiredSize: new go.Size(8, 8),
            fill: "darkred",
        }),
        "linkReshapingTool.handleArchetype": $(go.Shape, "Diamond", {
            desiredSize: new go.Size(7, 7),
            fill: "lightblue",
            stroke: "deepskyblue",
        }),
        "rotatingTool.handleAngle": 270,
        "rotatingTool.handleDistance": 30,
        "rotatingTool.snapAngleMultiple": 15,
        "rotatingTool.snapAngleEpsilon": 15,
        "undoManager.isEnabled": true,
        nodeTemplate,
        linkTemplate,
    });

    myPalette = $(go.Palette, myPaletteDiv.value, {
        maxSelectionCount: 1,
        nodeTemplateMap: myDiagram.nodeTemplateMap,
        linkTemplate,
        model: paletteModel,
    });

    myDiagram.addDiagramListener("Modified", (e) => {
        const saveButton: any = document.getElementById("SaveButton");
        if (saveButton) saveButton.disabled = !myDiagram.isModified;
        const idx = document.title.indexOf("*");
        if (myDiagram.isModified) {
            if (idx < 0) document.title += "*";
        } else {
            if (idx >= 0) document.title = document.title.slice(0, idx);
        }
    });
};

//funcion guardar el diagrama creado
const save = () => {
    saveDiagramProperties(); //@ts-ignore
    document.getElementById("mySavedModel").value = myDiagram.model.toJson();
    myDiagram.isModified = false;
    console.log(
        'document.getElementById("mySavedModel").value', //@ts-ignore
        document.getElementById("mySavedModel").value
    );
};

//Obtiene los rangos del diagrama que se esta creando
const saveDiagramProperties = () => {
    myDiagram.model.modelData.position = go.Point.stringify(myDiagram.position);
};

//Función para abrir modals
const showNodeData = (nodeData: any) => {
    switch (nodeData.code) {
        case 3:
            modalDb.value = true;
            break;
        case "8":
            modalApi.value = true;
            break;

        default:
            break;
    }
};

onMounted(async () => {
    // await workflowStore.fetchDataForm({});
    await initGoJs();
});
</script>

<template>
    <div>
        <VRow>
            <VCol cols="12">
                <div class="container">
                    <div ref="myDiagramDiv" class="myDiagramDivClass"></div>
                    <div ref="myPaletteDiv" class="myPaletteDivClass"></div>
                </div>
            </VCol>
        </VRow>

        <VRow>
            <VCol cols="12" md="8">
                <AppTextField label="Nombre del diagrama" />
            </VCol>
            <VCol cols="12" md="4">
                <textarea id="mySavedModel" style="display: none"></textarea>
                <VBtn
                    class="ms-1 mt-6"
                    color="light"
                    rounded="lg"
                    id="SaveButton"
                    @click="save"
                >
                    <b class="text-vblack fs-6">Guardar</b>&nbsp;<VIcon
                        size="large"
                        color="success"
                        icon="mdi-content-save"
                    />
                </VBtn>
            </VCol>
        </VRow>

        <VRow>
            <ModalDB />
            <ModalConfigConectionDB />
            <ModalApi />
        </VRow>
    </div>
</template>

<style>
.container {
    display: flex;
}

.myDiagramDivClass {
    order: 2;
    border: 1px solid black;
    block-size: 600px;
    inline-size: 100%;
}

.myPaletteDivClass {
    order: 1;
    border: 1px solid black;
    block-size: 600px;
    inline-size: 250px;
}
</style>
