<template>
    <div class="pages-wrapper background">
        <div class="flex flex-col justify-center text-center p-4 pb-8">
            <h1 class="text-3xl">Admin Panel</h1>
            <p class="text-gray-600">{{ users.length }} users</p>
        </div>

        <div class="user-list flex flex-col justify-center items-center gap-6">
            <div v-for="user in users" :key="user.id"
                class="user-card p-6 w-full lg:w-96 bg-white border rounded-lg shadow-md">
                <div class="flex items-center gap-4">
                    <div class="avatar">
                        <div class="w-12 rounded-full">
                            <img :src="'https://picsum.photos/1280/720?random=' + user.id" />
                        </div>
                    </div>
                    <div>
                        <h2 class="text-xl font-semibold">{{ user.name }}</h2>
                        <p class="text-gray-600">Email: {{ user.email }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';

const users = ref([
    { id: 1, name: 'John Doe', email: 'john@example.com' },
    { id: 2, name: 'Jane Smith', email: 'jane@example.com' },
    { id: 3, name: 'Alice Johnson', email: 'alice@example.com' },
    { id: 4, name: 'Bob Brown', email: 'bob@example.com' },
    { id: 5, name: 'Charlie Davis', email: 'charlie@example.com' },
]);
</script>

<style scoped></style>