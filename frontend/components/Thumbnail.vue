<template>
    <div class="card md:card-side shadow-xl w-full lg:w-[70%] 2xl:w-[40%] m-4 group">
        <figure>
            <img class="w-full object-cover" :src="image" :alt="title" />
        </figure>
        <div class="card-body">
            <h2 class="card-title"> {{ title }} </h2>
            <p> {{ description }} </p>
            <!--likes and comments-->
            <div class="flex mt-4 text-black space-x-5">
                <div class="flex items-center">
                    <span class="ml-2">  <i class="fa-solid fa-heart"></i> {{ like }} </span>
                </div>
                <div class="flex items-center">
                    <span class="ml-2"> <i class="fa-solid fa-comment"></i> {{ comment }} </span>
                </div>
            </div>
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
    },
    created_at: {
        type: String,
        required: true
    }
})

const router = useRouter();

const redirectToArticle = () => {
    router.push(`/articles/${props.id}`);
};

const like = ref(0);
const comment = ref(0);

// const fetchLike = async () => {
//     const { data } = await useFetch(`/article/like/total_likes?post_id=${props.id}`);
//     like.value = data.value.total_likes;
//     console.log(like.value);
// };

// const fetchComment = async () => {
//     const { data } = await useFetch(`/article/comment/count_comments?post_id=${props.id}`);
//     comment.value = data.value.total_comments;
//     console.log(comment.value);
// };

// watchEffect(() => {
//     fetchLike();
//     fetchComment();
// });

</script>

<style scoped></style>