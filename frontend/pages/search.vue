<template>
  <div class="pages-wrapper space-y-8 background">
    <SearchBar/>

    <h1>Search Results for "{{ query }}"</h1>
    
    <div class="flex flex-wrap justify-center gap-x-24">
      <Thumbnail 
        v-for="i in 100"
        :key="i"
        :id=i
        title="Title"
        description="Description"
        :image="'https://picsum.photos/1280/720?random=' + i"
  />
    </div>
  </div>
</template>

<script setup>
const route = useRoute();
const query = computed(() => route.query.q || '');
</script>