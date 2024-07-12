<script setup lang="ts">
import { useWorkflowStore } from "@/stores/useWorkflowStore";
import { requiredValidator } from "@validators";
import type { VForm } from "vuetify/components";
const formValidation = ref<VForm>();
const workflowStore = useWorkflowStore();
const { modalApi, methodsApi, formularioApi, screenApi, arrayDataApi } =
    storeToRefs(workflowStore);

const changeScreen = (event: string) => {
    screenApi.value = event;
};

const save = () => {
    //@ts-ignore
    arrayDataApi.value.push(formularioApi.value);
    screenApi.value = "list";
};

const dialogModelValueUpdate = (val: boolean | null = null) => {
    modalApi.value = false;
};
</script>

<template>
    <VDialog
        :width="$vuetify.display.smAndDown ? 'auto' : 700"
        persistent
        @update:model-value="dialogModelValueUpdate"
        v-model="modalApi"
    >
        <!-- Dialog close btn -->
        <DialogCloseBtn @click="dialogModelValueUpdate(false)" />

        <VCard>
            <VCardItem class="text-center">
                <VCardTitle class="text-h5 mb-3"> Api Rest </VCardTitle>
            </VCardItem>

            <VCardText v-if="screenApi === 'list'">
                <VRow>
                    <VCol cols="12" md="12">
                        <VBtn color="success" @click="changeScreen('form')">
                            Agregar
                        </VBtn>
                    </VCol>
                    <VCol cols="12" md="12">
                        <VTable>
                            <thead class="bg-cprimary">
                                <tr>
                                    <th>Orden</th>
                                    <th>Nombre</th>
                                    <th>Método</th>
                                    <th>URL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(item, index) in arrayDataApi"
                                    :key="index"
                                    style="height: 3.75rem"
                                >
                                    <td>{{ item.order }}</td>
                                    <td>{{ item.name }}</td>
                                    <td>{{ item.method }}</td>
                                    <td>{{ item.url }}</td>
                                </tr>
                            </tbody>
                            <!-- <tfoot v-show="!voucherDeletionAudits.length">
                                <tr>
                                    <td colspan="7" class="text-center">
                                        No se encuentran resultados
                                    </td>
                                </tr>
                            </tfoot> -->
                        </VTable>
                    </VCol>
                </VRow>
            </VCardText>
            <VCardText v-if="screenApi === 'form'">
                <VForm ref="formValidation" lazy-validation class="mt-6">
                    <VRow>
                        <VCol cols="12" md="12">
                            <VTextField
                                label="Nombre"
                                v-model="formularioApi.name"
                                :rules="[requiredValidator]"
                            />
                        </VCol>
                        <VCol cols="12" md="4">
                            <VSelect
                                label="Método"
                                v-model="formularioApi.method"
                                :items="methodsApi"
                                item-title="value"
                                item-value="id"
                            />
                        </VCol>
                        <VCol cols="12" md="8">
                            <VTextField
                                label="URL"
                                v-model="formularioApi.url"
                                :rules="[requiredValidator]"
                            />
                        </VCol>

                        <VCol cols="12" md="12">
                            <VTextarea
                                :rules="[requiredValidator]"
                                v-model="formularioApi.data"
                                label="JSON"
                            >
                            </VTextarea>
                        </VCol>
                        <VCol cols="12" md="2">
                            <VBtn color="success" @click="save()">
                                Guardar
                            </VBtn>
                        </VCol>
                    </VRow>
                </VForm>
            </VCardText>
        </VCard>
    </VDialog>
</template>
