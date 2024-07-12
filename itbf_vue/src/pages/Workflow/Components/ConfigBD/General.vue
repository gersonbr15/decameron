<script setup lang="ts">
import { useWorkflowStore } from "@/stores/useWorkflowStore";
import { requiredValidator } from "@validators";
import type { VForm } from "vuetify/components";
const formValidation = ref<VForm>();
const workflowStore = useWorkflowStore();
const { formulariodb } = storeToRefs(workflowStore);

const onFormSubmit = async () => {
    const validation = await formValidation.value?.validate();
    if (validation?.valid) {
    }
};
</script>
<template>
    <div>
        <VCard>
            <!-- <VCardItem class="text-center">
                <VCardTitle class="text-h5 mb-3" color="primary">
                    <VIcon size="x-large" color="primary" icon="mdi-web" />
                    <VIcon size="x-large" color="primary" icon="mdi-minus" />
                    <VIcon size="x-large" color="primary" icon="mdi-database-outline" />
                </VCardTitle>
            </VCardItem> -->

            <VCardText>
                <!-- 👉 Form -->
                <VForm ref="formValidation" lazy-validation>
                    <VRow>
                        <VCol cols="12">
                            <VRow no-gutters>
                                <!-- 👉 First Name -->
                                <VCol
                                    cols="12"
                                    md="3"
                                    class="d-flex align-items-center"
                                >
                                    <label
                                        class="v-label text-body-2 text-high-emphasis"
                                        for="connectionName"
                                        >Connection Name:
                                    </label>
                                </VCol>

                                <VCol cols="12" md="9">
                                    <AppTextField
                                        id="connectionName"
                                        v-model="formulariodb.connectionName"
                                        :rules="[requiredValidator]"
                                    />
                                </VCol>
                            </VRow>
                        </VCol>

                        <VCol cols="12">
                            <VRow no-gutters>
                                <!-- 👉 Host -->
                                <VCol
                                    cols="12"
                                    md="3"
                                    class="d-flex align-items-center"
                                >
                                    <label
                                        class="v-label text-body-2 text-high-emphasis"
                                        for="host"
                                        >Host:
                                    </label>
                                </VCol>

                                <VCol cols="12" md="9">
                                    <AppTextField
                                        id="host"
                                        v-model="formulariodb.host"
                                        :rules="[requiredValidator]"
                                    />
                                </VCol>
                            </VRow>
                        </VCol>

                        <VCol cols="12">
                            <VRow no-gutters>
                                <!-- 👉 Port -->
                                <VCol
                                    cols="12"
                                    md="3"
                                    class="d-flex align-items-center"
                                >
                                    <label
                                        class="v-label text-body-2 text-high-emphasis"
                                        for="port"
                                        >Port:
                                    </label>
                                </VCol>

                                <VCol cols="12" md="9">
                                    <AppTextField
                                        id="port"
                                        v-model="formulariodb.port"
                                        :rules="[requiredValidator]"
                                        type="number"
                                    />
                                </VCol>
                            </VRow>
                        </VCol>

                        <VCol cols="12">
                            <VRow no-gutters>
                                <!-- 👉 User Name -->
                                <VCol
                                    cols="12"
                                    md="3"
                                    class="d-flex align-items-center"
                                >
                                    <label
                                        class="v-label text-body-2 text-high-emphasis"
                                        for="userName"
                                        >User Name</label
                                    >
                                </VCol>

                                <VCol cols="12" md="9">
                                    <AppTextField
                                        id="userName"
                                        v-model="formulariodb.userName"
                                        :rules="[requiredValidator]"
                                        type="text"
                                    />
                                </VCol>
                            </VRow>
                        </VCol>

                        <!-- 👉 Remember me -->
                        <VCol offset-md="3" cols="12" md="9">
                            <VCheckbox
                                v-model="formulariodb.checkbox"
                                :rules="[requiredValidator]"
                                label="Save password"
                            />
                        </VCol>

                        <!-- 👉 submit and reset button -->
                        <VCol
                            offset-md="3"
                            cols="12"
                            md="9"
                            class="d-flex gap-4"
                        >
                            <VBtn
                                color="primary"
                                variant="outlined"
                                @click="onFormSubmit"
                            >
                                Conexión de prueba
                                <VIcon
                                    size="large"
                                    color="success"
                                    icon="mdi-access-point"
                                />
                            </VBtn>
                            <VBtn
                                color="primary"
                                variant="outlined"
                                @click="onFormSubmit"
                            >
                                Guardar
                                <VIcon
                                    size="large"
                                    color="success"
                                    icon="mdi-content-save-outline"
                                />
                            </VBtn>
                            <VBtn variant="outlined" color="error" type="reset">
                                Cancelar
                            </VBtn>
                        </VCol>
                    </VRow>
                </VForm>
            </VCardText>
        </VCard>
    </div>
</template>
