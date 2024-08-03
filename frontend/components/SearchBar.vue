<template>
    <div class="relative max-w-2xl">
        <i class="fas fa-magnifying-glass absolute left-4 top-1/2 transform -translate-y-1/2"></i>
        <input type="text" placeholder="Search..." v-model="query" ref="searchInput" @keydown="handleKeydown"
            class="input w-full input-bordered input-success pl-10 pr-10 focus:outline-none focus:ring-0" />
        <label for="file-input" class="absolute right-4 top-1/2 transform -translate-y-1/2 cursor-pointer">
            <i class="fas fa-camera"></i>
        </label>
        <input id="file-input" type="file" accept="image/*" class="hidden" @change="handleImageInput" />
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useRouter, useRoute } from 'vue-router';

const searchInput = ref(null);
const query = ref('');
const router = useRouter();
const route = useRoute();

const handleKeydown = (event: KeyboardEvent) => {
    if (event.key === 'Enter') {
        if (query.value) {
            router.push({ path: '/search', query: { q: query.value } });
        }
    }
};

const handleImageInput = async (event: Event) => {
    const fileInput = event.target as HTMLInputElement;
    const file = fileInput?.files?.[0];
    const formData = new FormData();
    formData.append('file', file as Blob);

    const response = await fetch('/img_object_detection_to_img', {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
        },
        body: formData,
    });

    if (!response.ok) {
        console.error('Upload failed');
        return;
    }

    query.value = response.headers.get('detected-labels') ?? '';
    handleKeydown({ key: 'Enter' } as KeyboardEvent);

    fileInput.value = '';
};
</script>