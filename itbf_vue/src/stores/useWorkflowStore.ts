import { defineStore } from "pinia";
// import { usePreloadStore } from "@/stores/usePreloadStore";
export const useWorkflowStore = defineStore("useWorkflowStore", {
    state: () => ({
        keyList: 0 as number,
        typeAction: "list" as string,
        modalDb: false,
        modalApi: false,
        modalConfigConnectionDb: false,
        loading: {
            diagram: false,
        },
        errors: {} as object,
        formulario: {
            id: null,
            procedure_id: null,
        },
        formulariodb: {
            id: null,
            procedure_id: null,
        },
        formularioSh: {
            id: null,
            host: null,
            port: null,
            userName: null,
            authenticationName: null,
            password: null,
            checkbox: null,
        },
        formularioApi: {
            id: null,
            method: 'GET',
            url: 'https://fakestoreapi.com/products',
            data: '{}',
            name: 'fakestoreapi',
            order: 1
        },
        dbConnectionType: [] as Array<object>,
        screenApi: 'list',
        arrayDataApi: [],
        methodsApi: [
            {
                id: "GET",
                value: "GET",
            },
            {
                id: "POST",
                value: "POST",
            },
            {
                id: "PUT",
                value: "PUT",
            },
            {
                id: "DELETE",
                value: "DELETE",
            },
        ],

        // "GET", "POST", "PUT", "DELETE"
    }),
    getters: {},
    actions: {
        // clearFormulario() {
        //     this.formulario = {
        //         id: null,
        //         procedure_id: null,
        //     };
        // },
        // async fetchAll(params: object): Promise<void> {
        //     this.loading.diagram = true;
        //     await axiosIns
        //         .post("/paletteGo-list", params)
        //         .then((result) => {
        //             this.loading.diagram = false;
        //         })
        //         .catch(async (error) => {
        //             this.loading.diagram = false;
        //             console.log(await error);
        //         });
        // },
        // async fetchDataForm(params: object): Promise<void> {
        //     // const preload = usePreloadStore();
        //     // preload.isLoading = true;
        //     await axiosIns
        //         .post("/paletteGo-dataForm", params)
        //         .then((result) => {
        //             // preload.isLoading = false;
        //             this.dbConnectionType = result.data.dbConnectionType;
        //         })
        //         .catch(async (error) => {
        //             // preload.isLoading = false;
        //             console.log(await error);
        //         });
        // },
    },
});
