<template>
    <div class="pages-wrapper background">
        <div class="flex flex-col justify-center text-center p-4 pb-8">
            <h1 class="text-3xl">Admin Panel</h1>
            <!-- <p class="text-gray-600">{{ users.length }} users</p> -->
        </div>

        <button class="btn btn-primary text-green-200">Add Article</button>

        <div class="flex flex-col justify-center items-center gap-6 mt-8">
            <div v-for="article in articles" :key="article.post_id"
                class="article-card p-6 w-full bg-white border rounded-lg shadow-md">
                <div class="flex gap-4">
                    <div class="avatar">
                        <div class="w-12 rounded-full">
                            <img :src="article.cover_url" />
                        </div>
                    </div>
                    <div>
                        <h2 class="text-xl font-semibold">{{ article.post_title }}</h2>
                        <p class="text-gray-600">{{ article.post_text }}</p>
                    </div>
                    <div class="dropdown">
                        <div tabindex="0" role="button" class="btn btn-ghost"> <i class="fa-solid fa-ellipsis"></i>
                        </div>
                        <ul tabindex="0" class="dropdown-content menu bg-base-100 rounded-box z-[1] p-2 shadow">
                            <li><a>Edit</a></li>
                            <li><a>Delete</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import type { Article } from '~/types/article';

const articles = ref<Article[]>([]);

const fetchAllArticles = async () => {
    const { data } = await useFetch('/article/show_all_articles');
    articles.value = data.value as Article[];
};

onMounted(fetchAllArticles);
</script>

<style scoped></style>