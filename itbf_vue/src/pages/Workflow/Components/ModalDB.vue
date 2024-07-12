<script setup lang="ts">
import { useWorkflowStore } from "@/stores/useWorkflowStore";
import type { VForm } from "vuetify/components";
const formValidation = ref<VForm>();
const workflowStore = useWorkflowStore();
const { modalDb, dbConnectionType, modalConfigConnectionDb } =
    storeToRefs(workflowStore);

const openConfigConection = (event: number) => {
    modalConfigConnectionDb.value = true;
};

const dialogModelValueUpdate = (val: boolean | null = null) => {
    modalDb.value = false;
};
</script>

<template>
    <VDialog
        :width="$vuetify.display.smAndDown ? 'auto' : 700"
        persistent
        @update:model-value="dialogModelValueUpdate"
        v-model="modalDb"
    >
        <!-- Dialog close btn -->
        <DialogCloseBtn @click="dialogModelValueUpdate(false)" />

        <VCard class="pa-sm-14 pa-5">
            <VCardItem class="text-center">
                <VCardTitle class="text-h5 mb-3"> Nueva Conexión </VCardTitle>
            </VCardItem>

            <VCardText>
                <!-- 👉 Form -->
                <VForm ref="formValidation" lazy-validation class="mt-6">
                    <VRow>
                        <!-- 👉 Fecha inicio -->
                        <VCol cols="12" md="12">
                            <VSelect
                                :items="dbConnectionType"
                                item-title="name"
                                item-value="id"
                                @update:modelValue="openConfigConection($event)"
                            />
                        </VCol>
                    </VRow>
                </VForm>
            </VCardText>
        </VCard>
    </VDialog>
</template>
