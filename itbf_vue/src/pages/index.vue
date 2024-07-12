<script setup lang="ts">
import { requiredValidator } from "@/@core/utils/validators";
import { alertConfirm, alertToast } from "@/utils/alerts";
import { VForm } from 'vuetify/components/VForm';
import axiosIns from "../utils/axiosIns";

const formHotels = ref<VForm>();
const roomTypesList = ref([]);
const accommodationsList = ref([]);
const forms: any = ref({
    name: null,
    address: null,
    city: null,
    tax_id: null,
    number_of_rooms: null,
    rooms: []
});
const errors: any = ref({});

const getDataSelect = async () => {
    await axiosIns.get("get-data").then((res: any) => {
        const { roomTypes, accommodations } = res.data;

        roomTypesList.value = roomTypes;
        accommodationsList.value = accommodations;
    });
};

const addRooms = () => {
    forms.value.rooms.push({ "quantity": null, "room_type_id": null, "accommodation_id": null });
    errors.value.rooms = "";
};
const deleteRooms = (index: number) => {
    alertConfirm({
        text: "¿Estás seguro de eliminar esta habitación?",
        showDenyButton: true,
    }).then((res: any) => {
        if (res.isConfirmed)
            forms.value.rooms.splice(index, 1);
    });
};

const save = async () => {
    const formValidation = await formHotels.value?.validate();
    if (!formValidation.valid) {
        return;
    }

    const uniqueRooms = new Set();
    for (const room of forms.value.rooms) {
        const key = `${room.room_type_id}-${room.accommodation_id}`;
        if (uniqueRooms.has(key)) {
            alertToast({ text: `Duplicado de tipo de habitación y alojamiento`, icon: "error" });
            return;
        }
        uniqueRooms.add(key);
    }


    await axiosIns.post("hotels", forms.value).then((res: any) => {
        if (res.status === 200) {
            alertToast({ text: 'La información del hotel se guardó exitosamente', icon: "success" });
            // forms.value = {
            //     name: null,
            //     address: null,
            //     city: null,
            //     tax_id: null,
            //     number_of_rooms: null,
            //     rooms: []
            // };
        }
    }).catch((err: any) => {
        const { data, status } = err;

        if (status === 422) {
            if (('errors' in data))
                errors.value = data.errors;
            else if (('message' in data))
                alertToast({ text: data.message, icon: "error" });
        }
    });
}

onMounted(() => {
    getDataSelect();
});
</script>
<template>
    <div>
        <VCard class="mb-6">
            <VCardText>
                <VForm ref="formHotels" lazy-validation>
                    <VRow>
                        <VCol cols="12" md="12" class="d-flex justify-end align-center">
                            <VDivider />
                            <VCardTitle>Información Básica</VCardTitle>
                            <VDivider />
                        </VCol>
                        <VCol cols="12" md="4">
                            <VTextField v-model="forms.name" :error-messages="errors?.name" @input="errors.name = ''"
                                label="Nombre" type="text" :rules="[requiredValidator]" />
                        </VCol>
                        <VCol cols="12" md="4">
                            <VTextField v-model="forms.number_of_rooms" :error-messages="errors?.number_of_rooms"
                                @input="errors.number_of_rooms = ''" label="Número de habitaciones" type="number"
                                :rules="[requiredValidator]" />
                        </VCol>
                        <VCol cols="12" md="4">
                            <VTextField v-model="forms.tax_id" :error-messages="errors?.tax_id"
                                @input="errors.tax_id = ''" label="Identificación del impuesto" type="text"
                                :rules="[requiredValidator]" />
                        </VCol>
                        <VCol cols="12" md="4">
                            <VTextField v-model="forms.address" :error-messages="errors?.address"
                                @input="errors.address = ''" label="Dirección" type="text"
                                :rules="[requiredValidator]" />
                        </VCol>
                        <VCol cols="12" md="4">
                            <VTextField v-model="forms.city" :error-messages="errors?.city" @input="errors.city = ''"
                                label="Ciudad" type="text" :rules="[requiredValidator]" />
                        </VCol>
                        <VCol cols="12" md="12" class="d-flex justify-end">
                            <VBtn color="success" prepend-icon="tabler-plus" @click="addRooms()">Agregar</VBtn>
                        </VCol>
                        <VCol cols="12" md="12">
                            <div class="d-flex justify-end align-center">
                                <VDivider />
                                <VCardTitle>Habitaciones</VCardTitle>
                                <VDivider />
                            </div>
                            <VCardSubtitle class="error-message" v-if="errors.rooms">
                                {{ Array.isArray(errors.rooms) ? errors.rooms[0] : errors.rooms }}
                            </VCardSubtitle>
                        </VCol>
                    </VRow>
                    <VRow v-for="(item, index) in forms.rooms">
                        <VCol cols="4" md="4">
                            <VSelect label="Tipo de habitaciones" item-title="description" item-value="id"
                                v-model="item.room_type_id" :items="roomTypesList" :rules="[requiredValidator]"
                                :error-messages="errors[`rooms.${index}.room_type_id`] ?? ''"
                                @update:model-value="errors[`rooms.${index}.room_type_id`] = ''">
                            </VSelect>
                        </VCol>
                        <VCol cols="4" md="4">
                            <VSelect label="Alojamientos" item-title="description" item-value="id"
                                v-model="item.accommodation_id" :items="accommodationsList" :rules="[requiredValidator]"
                                :error-messages="errors[`rooms.${index}.accommodation_id`] ?? ''"
                                @update:model-value="errors[`rooms.${index}.accommodation_id`] = ''"></VSelect>
                        </VCol>
                        <VCol cols="3" md="3">
                            <VTextField v-model="item.quantity" label="Número de habitaciones" type="number"
                                :rules="[requiredValidator]" :error-messages="errors[`rooms.${index}.quantity`] ?? ''"
                                @input="errors[`rooms.${index}.quantity`] = ''" />
                        </VCol>
                        <VCol cols="1" md="1">
                            <VBtn size="small" color="error" icon="tabler-trash" @click="deleteRooms(index)"></VBtn>
                        </VCol>
                    </VRow>
                    <VRow>
                        <VCol cols="12" md="12" class="d-flex justify-center my-5">
                            <VBtn color="success" prepend-icon="tabler-device-floppy" @click="save()">Guardar</VBtn>
                        </VCol>
                    </VRow>
                </VForm>
            </VCardText>
        </VCard>
    </div>
</template>
<style lang="scss">
.error-message {
    color: rgb(var(--v-theme-error));
}
</style>
