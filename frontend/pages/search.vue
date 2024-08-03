<template>
  <div class="pages-wrapper space-y-8 background">
    <SearchBar/>

    <h1>Search Results for "{{ query }}"</h1>
    
    <div class="flex flex-wrap justify-center gap-x-24">
      <Thumbnail 
        v-for="article in articles"
        :key="article.post_id"
        :id="article.post_id"
        :title="article.post_title"
        :description="article.post_text"
        :image="article.cover_url"
        :createdAt="article.created_at"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Article } from '~/types/article';

const route = useRoute();
const query = computed(() => route.query.q || '');

const articles = ref<Article[]>([]);

const fetchArticles = async () => {
  const { data } = await useFetch(`/search/articles_by_keyword/${query.value}`);
  articles.value = data.value as Article[];
};

watch(query, fetchArticles, { immediate: true });
</script>