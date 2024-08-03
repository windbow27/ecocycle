<template>
    <div class="card md:card-side shadow-xl w-full lg:w-[70%] 2xl:w-[40%] m-4 group">
        <figure>
            <img class="h-56 w-full 2xl:w-72 object-cover" :src="image" :alt="title" />
        </figure>
        <div class="card-body">
            <h2 class="card-title"> {{ title }} </h2>
            <p> {{ description }} </p>
            <div class="card-actions justify-end">
                <button @click="redirectToArticle" class="btn btn-primary text-green-100">Read more</button>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
const props = defineProps({
    id: {
        type: Number,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    image: {
        type: String,
        required: true
    }
})

const router = useRouter();

const redirectToArticle = () => {
    router.push(`/articles/${props.id}`);
};
</script>

<style scoped></style>