<template>
  <div class="pages-wrapper space-y-8 background">
    <SearchBar />

    <h1>Search Results for "{{ query }}"</h1>

    <div class="flex flex-wrap justify-center gap-x-24">
      <Thumbnail v-for="article in articles" :key="article.post_id" :id="article.post_id" :title="article.post_title"
        :description="article.post_text" :image="article.cover_url" :created_at="article.created_at" />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Article } from '~/types/article';

const route = useRoute();
const query = computed(() => route.query.q || '');

const articles = ref<Article[]>([]);
const categories_vn = ['Giấy', 'Nhựa', 'Thuỷ tinh', 'Bìa Carton', 'Kim loại'];
const categories_en = ['Paper', 'Plastic', 'Glass', 'Cardboard', 'Metal'];

const fetchArticles = async () => {
  let categoryIndex = categories_en.findIndex(category => (category as string).toLowerCase() === (query.value as string).toLowerCase());
  if (categoryIndex === -1) {
    categoryIndex = categories_vn.findIndex(category => (category as string).toLowerCase() === (query.value as string).toLowerCase());
  }

  let data;
  if (categoryIndex !== -1) {
    ({ data } = await useFetch(`/search/articles_by_categories?category=${categories_en[categoryIndex]}`));
  } else {
    ({ data } = await useFetch(`/search/articles_by_keyword/${query.value}`));
  }
  const data_value = data.value;
  // @ts-ignore
  articles.value = data_value[0] as Article[];
};
watch(query, fetchArticles, { immediate: true });
</script>