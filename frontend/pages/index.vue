<template>
    <div class="pages-wrapper index-background">
        <!-- Search input -->
        <SearchBar class="m-auto py-12 lg:py-24" />

        <!-- Popular searches -->
        <div class="flex flex-wrap justify-center lg:py-12">
            <PopularSearch v-for="(item, index) in popularSearchItems" :key="index" :search="item.search"
                :image="item.image" />
        </div>
    </div>
</template>

<script setup lang="ts">

const popularSearchItems = [
    { search: 'Metal', image: 'https://picsum.photos/1280/900' },
    { search: 'Paper', image: 'https://picsum.photos/1280/901' },
    { search: 'Glass', image: 'https://picsum.photos/1280/902' },
    { search: 'Plastic', image: 'https://picsum.photos/1280/903' },
    { search: 'Cardboard', image: 'https://picsum.photos/1280/904' },
    { search: 'Others', image: 'https://picsum.photos/1280/905' },
];
</script>

<style scoped></style>