<script setup lang="ts">
import { useWorkflowStore } from "@/stores/useWorkflowStore";
import { requiredValidator } from "@validators";
import type { VForm } from "vuetify/components";
const formValidationShh = ref<VForm>();
const workflowStore = useWorkflowStore();
const { formularioSh } = storeToRefs(workflowStore);
const onFormSubmitShh = async () => {
    const validationShh = await formValidationShh.value?.validate();
    if (validationShh?.valid) {
    }
};
</script>
<template>
    <VCard>
        <VCardText>
            <!-- 👉 Form -->
            <VForm ref="formValidationShh" lazy-validation>
                <VRow>
                    <VCol cols="12">
                        <VRow>
                            <VCol
                                cols="12"
                                md="3"
                                class="d-flex align-items-center"
                            >
                                <label
                                    class="v-label text-body-2 text-high-emphasis"
                                    >Host:
                                </label>
                            </VCol>

                            <VCol cols="12" md="9">
                                <AppTextField
                                    type="text"
                                    v-model="formularioSh.host"
                                    :rules="[requiredValidator]"
                                />
                            </VCol>
                        </VRow>
                    </VCol>

                    <VCol cols="12">
                        <VRow>
                            <VCol
                                cols="12"
                                md="3"
                                class="d-flex align-items-center"
                            >
                                <label
                                    class="v-label text-body-2 text-high-emphasis"
                                    >Port:
                                </label>
                            </VCol>

                            <VCol cols="12" md="9">
                                <AppTextField
                                    v-model="formularioSh.port"
                                    :rules="[requiredValidator]"
                                    type="number"
                                />
                            </VCol>
                        </VRow>
                    </VCol>

                    <VCol cols="12">
                        <VRow>
                            <VCol
                                cols="12"
                                md="3"
                                class="d-flex align-items-center"
                            >
                                <label
                                    class="v-label text-body-2 text-high-emphasis"
                                    >User Name</label
                                >
                            </VCol>

                            <VCol cols="12" md="9">
                                <AppTextField
                                    v-model="formularioSh.userName"
                                    :rules="[requiredValidator]"
                                    type="text"
                                />
                            </VCol>
                        </VRow>
                    </VCol>

                    <VCol cols="12">
                        <VRow>
                            <VCol
                                cols="12"
                                md="3"
                                class="d-flex align-items-center"
                            >
                                <label
                                    class="v-label text-body-2 text-high-emphasis"
                                    >Authentication Method:
                                </label>
                            </VCol>

                            <VCol cols="12" md="9">
                                <AppTextField
                                    v-model="formularioSh.authenticationName"
                                    :rules="[requiredValidator]"
                                />
                            </VCol>
                        </VRow>
                    </VCol>

                    <VCol cols="12">
                        <VRow>
                            <VCol
                                cols="12"
                                md="3"
                                class="d-flex align-items-center"
                            >
                                <label
                                    class="v-label text-body-2 text-high-emphasis"
                                    >Password:
                                </label>
                            </VCol>

                            <VCol cols="12" md="9">
                                <AppTextField
                                    type="password"
                                    v-model="formularioSh.password"
                                    :rules="[requiredValidator]"
                                />
                            </VCol>
                        </VRow>
                    </VCol>

                    <!-- 👉 Remember me -->
                    <VCol offset-md="3" cols="12" md="9">
                        <VCheckbox
                            v-model="formularioSh.checkbox"
                            :rules="[requiredValidator]"
                            label="Save password"
                        />
                    </VCol>

                    <!-- 👉 submit and reset button -->
                    <VCol offset-md="3" cols="12" md="9" class="d-flex gap-4">
                        <VBtn
                            color="primary"
                            variant="outlined"
                            @click="onFormSubmitShh"
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
                            @click="onFormSubmitShh"
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
</template>
