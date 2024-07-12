<script setup lang="ts">
import { useWorkflowStore } from "@/stores/useWorkflowStore";
import General from "./ConfigBD/General.vue";
import SshDb from "./ConfigBD/SshDb.vue";
const workflowStore = useWorkflowStore();
const { modalConfigConnectionDb } = storeToRefs(workflowStore);

const dialogModelValueUpdate = (val: boolean | null = null) => {
    modalConfigConnectionDb.value = false;
};

const tab = ref("General");
const tabsTitle = ref(["General", "Sshdb"]);
</script>

<template>
    <VDialog
        :width="$vuetify.display.smAndDown ? 'auto' : 700"
        persistent
        @update:model-value="dialogModelValueUpdate"
        v-model="modalConfigConnectionDb"
    >
        <!-- Dialog close btn -->
        <DialogCloseBtn @click="dialogModelValueUpdate(false)" />

        <VCard>
            <VTabs v-model="tab" bg-color="transparent" grow>
                <VTab v-for="item in tabsTitle" :key="item" :value="item">
                    {{ item }}
                </VTab>
            </VTabs>

            <VWindow v-model="tab">
                <VWindowItem
                    v-for="item in tabsTitle"
                    :key="item"
                    :value="item"
                >
                    <VCard>
                        <span v-show="tab === 'General'">
                            <General />
                        </span>
                        <span v-show="tab === 'Sshdb'">
                            <SshDb />
                        </span>
                    </VCard>
                </VWindowItem>
            </VWindow>
        </VCard>
    </VDialog>
</template>
