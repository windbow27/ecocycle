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
    { search: 'Metal', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs9XjRClSf493kd8gp4ZOpPxP8C0knbsp87g&s' },
    { search: 'Paper', image: 'https://media.istockphoto.com/id/183027810/photo/newsprint-backdrop.jpg?s=612x612&w=0&k=20&c=bJaCgcE7E2qoVl65SlYO8VCprm4hZi3-hTMgCYeFRvM=' },
    { search: 'Glass', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHmHiGQiltTCFk1bWsFEzZWuzVlciiUnoW4A&s' },
    { search: 'Plastic', image: 'https://www.sierraclub.org/sites/default/files/styles/amp_1200x900_4_3/public/sierra/articles/big/SIERRA-iStock-927987734-WB.jpg.webp?itok=cSOW0bkv' },
    { search: 'Cardboard', image: 'https://c8.alamy.com/comp/EJ8B9T/cardboard-trash-bundled-for-pick-up-and-recycling-in-new-york-on-friday-EJ8B9T.jpg' },
    { search: 'Others', image: 'https://www.southernliving.com/thmb/XnTxC_gCZqcCf3uZFbDWiHuU2Rw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1086009848-766bbd07f72e4ec7b394bb0056f1c044.jpg' },
];
</script>

<style scoped></style>