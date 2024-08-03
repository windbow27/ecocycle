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
    { search: 'Cat', image: 'https://picsum.photos/1280/900' },
    { search: 'Dog', image: 'https://picsum.photos/1280/901' },
    { search: 'Sun', image: 'https://picsum.photos/1280/902' },
    { search: 'Sky', image: 'https://picsum.photos/1280/903' },
    { search: 'Tree', image: 'https://picsum.photos/1280/904' },
    { search: 'Fish', image: 'https://picsum.photos/1280/905' },
    { search: 'Bird', image: 'https://picsum.photos/1280/906' },
    { search: 'Moon', image: 'https://picsum.photos/1280/907' },
    { search: 'Star', image: 'https://picsum.photos/1280/908' },
    { search: 'Rock', image: 'https://picsum.photos/1280/909' },
    { search: 'Leaf', image: 'https://picsum.photos/1280/910' },
    { search: 'Rain', image: 'https://picsum.photos/1280/911' },
    { search: 'Wind', image: 'https://picsum.photos/1280/912' },
    { search: 'Fire', image: 'https://picsum.photos/1280/913' },
    { search: 'Snow', image: 'https://picsum.photos/1280/914' },
    { search: 'Wave', image: 'https://picsum.photos/1280/915' },
    { search: 'Sand', image: 'https://picsum.photos/1280/916' },
    { search: 'Cat', image: 'https://picsum.photos/1280/900' },
    { search: 'Dog', image: 'https://picsum.photos/1280/901' },
    { search: 'Sun', image: 'https://picsum.photos/1280/902' },
    { search: 'Sky', image: 'https://picsum.photos/1280/903' },
    { search: 'Tree', image: 'https://picsum.photos/1280/904' },
    { search: 'Fish', image: 'https://picsum.photos/1280/905' },
    { search: 'Bird', image: 'https://picsum.photos/1280/906' },
    { search: 'Moon', image: 'https://picsum.photos/1280/907' },
    { search: 'Star', image: 'https://picsum.photos/1280/908' },
    { search: 'Rock', image: 'https://picsum.photos/1280/909' },
    { search: 'Leaf', image: 'https://picsum.photos/1280/910' },
    { search: 'Rain', image: 'https://picsum.photos/1280/911' },
    { search: 'Wind', image: 'https://picsum.photos/1280/912' },
    { search: 'Fire', image: 'https://picsum.photos/1280/913' },
    { search: 'Snow', image: 'https://picsum.photos/1280/914' },
    { search: 'Wave', image: 'https://picsum.photos/1280/915' },
    { search: 'Sand', image: 'https://picsum.photos/1280/916' },
    { search: 'Cat', image: 'https://picsum.photos/1280/900' },
    { search: 'Dog', image: 'https://picsum.photos/1280/901' },
    { search: 'Sun', image: 'https://picsum.photos/1280/902' },
    { search: 'Sky', image: 'https://picsum.photos/1280/903' },
    { search: 'Tree', image: 'https://picsum.photos/1280/904' },
    { search: 'Fish', image: 'https://picsum.photos/1280/905' },
    { search: 'Bird', image: 'https://picsum.photos/1280/906' },
    { search: 'Moon', image: 'https://picsum.photos/1280/907' },
    { search: 'Star', image: 'https://picsum.photos/1280/908' },
    { search: 'Rock', image: 'https://picsum.photos/1280/909' },
    { search: 'Leaf', image: 'https://picsum.photos/1280/910' },
    { search: 'Rain', image: 'https://picsum.photos/1280/911' },
    { search: 'Wind', image: 'https://picsum.photos/1280/912' },
    { search: 'Fire', image: 'https://picsum.photos/1280/913' },
    { search: 'Snow', image: 'https://picsum.photos/1280/914' },
    { search: 'Wave', image: 'https://picsum.photos/1280/915' },
    { search: 'Sand', image: 'https://picsum.photos/1280/916' },
    { search: 'Cat', image: 'https://picsum.photos/1280/900' },
    { search: 'Dog', image: 'https://picsum.photos/1280/901' },
    { search: 'Sun', image: 'https://picsum.photos/1280/902' },
    { search: 'Sky', image: 'https://picsum.photos/1280/903' },
    { search: 'Tree', image: 'https://picsum.photos/1280/904' },
    { search: 'Fish', image: 'https://picsum.photos/1280/905' },
    { search: 'Bird', image: 'https://picsum.photos/1280/906' },
    { search: 'Moon', image: 'https://picsum.photos/1280/907' },
    { search: 'Star', image: 'https://picsum.photos/1280/908' },
    { search: 'Rock', image: 'https://picsum.photos/1280/909' },
    { search: 'Leaf', image: 'https://picsum.photos/1280/910' },
    { search: 'Rain', image: 'https://picsum.photos/1280/911' },
    { search: 'Wind', image: 'https://picsum.photos/1280/912' },
    { search: 'Fire', image: 'https://picsum.photos/1280/913' },
    { search: 'Snow', image: 'https://picsum.photos/1280/914' },
    { search: 'Wave', image: 'https://picsum.photos/1280/915' },
    { search: 'Sand', image: 'https://picsum.photos/1280/916' },
];
</script>

<style scoped></style>