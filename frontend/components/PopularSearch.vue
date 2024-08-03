<template>
    <div @click="navigateToSearch" class="card p-4">
        <figure class="relative rounded-lg overflow-hidden group">
            <img class="h-56 w-96 object-cover" :src="image" :alt="search" />
            <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-50 transition duration-300"></div>
            <div class="absolute bottom-0 left-0 w-full bg-opacity-30 bg-black text-white text-center py-2">
                <span><i class="fa-solid fa-magnifying-glass"></i> {{ search }}</span>
            </div>
        </figure>
    </div>
</template>

<script setup lang="ts">
const props = defineProps({
    search: {
        type: String,
        required: true
    },
    image: {
        type: String,
        required: true
    }
})

const router = useRouter();
const navigateToSearch = () => {
    router.push({ path: '/search', query: { q: props.search } });
}
</script>

<style scoped></style>