<template>
    <div class="pages-wrapper background">
        <!-- Title -->
        <!-- <h1 class="text-center text-3xl p-4 pb-8">Lorem Ipsum</h1> -->

        <!-- Article -->
        <div class="space-y-12">
            <div v-for="(card, index) in cards" :key="index" class="card w-full max-w-3xl shadow-xl">
                <div class="h-16 flex rounded-lg">
                    <h2 class="card-title pl-8">{{ card.title }}</h2>
                </div>
                <span>{{ card.body1 }}</span>
                <figure>
                    <img :src="card.imgSrc" alt="Article" />
                </figure>
                <span class="card-body">{{ card.body2 }}</span>
            </div>
        </div>

        <div class="flex flex-col justify-center pb-8">
            <h1 class="text-center text-2xl p-4 pb-8 pt-20">Add Results</h1>
            <input type="file" class="file-input file-input-bordered file-input-primary w-full max-w-xs m-auto" multiple @change="handleFileChange" />
        </div>


        <!-- Comment -->
        <div class="chat chat-start" v-for="(image, index) in chatImages" :key="index">
            <div class="chat-image avatar">
                <div class="w-10 rounded-full">
                    <img alt="Tailwind CSS chat bubble component"
                        src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
            </div>
            <div class="">
                <img :src="image">
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
const route = useRoute();
const articleId = computed(() => route.params.id);
const full_text = ref('');
const cards = ref<Card[]>([]);
const comments = ref<Comment[]>([]);

type Card = {
    title: string;
    imgSrc: string;
    body1: string;
    body2: string;
};


const fetchArticle = async () => {
    const { data } = await useFetch(`/article/show_article?post_id=${articleId.value}`);
    if (!data.value) {
        return;
    }
    // @ts-ignore
    full_text.value = data.value[0].post_text;
    const imgRegex = /(http[s]?:\/\/.*\.(?:png|jpg|jpeg|gif))/i;
    const titleRegex = /(\d+\.\s.*)(?=\n|$)/;
    const sectionRegex = /(\d+\.\s.*?)(?=\d+\.\s|$)/gs;
    const sections = full_text.value.match(sectionRegex);
    // @ts-ignore
    cards.value = sections.map(section => {
        const imgSrcMatch = section.match(imgRegex);
        const imgSrc = imgSrcMatch ? imgSrcMatch[0] : '';
        const titleMatch = section.match(titleRegex);
        const title = titleMatch ? titleMatch[0] : '';
        const parts = section.split(title).join('').split(imgSrc).join('').split('\n');
        let body1 = '', body2 = '';

        if (parts.length > 0) {
            body1 = parts[0].trim();
            if (parts.length > 1) {
                body2 = parts.slice(1).join('\n').trim();
            }
        }

        return { title, body1, imgSrc, body2 };
    });
    console.log(cards.value);
};


onMounted(() => {
    fetchArticle();
});

watch(articleId, () => {
    fetchArticle();
});

const chatImages = ref([]);

// @ts-ignore
const handleFileChange = (event) => {
    const files = event.target.files;
    if (files.length > 0) {
        for (let i = 0; i < files.length; i++) {
            const reader = new FileReader();
            reader.onload = (e) => {
                // @ts-ignore
                chatImages.value.push(e.target.result);
            };
            reader.readAsDataURL(files[i]);
        }
    }
};
</script>

<style scoped></style>