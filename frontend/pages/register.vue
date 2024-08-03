<template>
    <div class="hero pages-wrapper background">
        <div class="hero-content flex-col lg:flex-row">
            <!--side panel-->
            <div class="text-center w-full max-w-xl lg:text-left">
                <h1 class="text-5xl font-bold">Register</h1>
                <p class="py-6">Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi
                    exercitationem quasi. In deleniti eaque aut repudiandae et a id nisi.</p>
            </div>
            <div class="card shrink-0 w-full max-w-lg shadow-2xl">
                <form class="card-body" @submit.prevent="onSubmit">
                    <!--username-->
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text">Username</span>
                        </label>
                        <input v-model="username" type="text" placeholder="username" class="input input-bordered"
                            required />
                    </div>
                    <!--email-->
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text">Email</span>
                        </label>
                        <input v-model="email" type="email" placeholder="email" class="input input-bordered" required />
                    </div>
                    <!--password-->
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text">Password</span>
                        </label>
                        <input v-model="password" type="password" placeholder="password" class="input input-bordered"
                            required />
                        <label class="label">
                            <nuxt-link to="/login" class="label-text-alt link link-hover">Already have an account? Login.</nuxt-link> 
                        </label>
                    </div>
                    <!--register button-->
                    <div class="form-control mt-6">
                        <button class="btn btn-primary text-green-100">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useUserStore } from '@/stores/user';


const username = ref('');
const email = ref('');
const password = ref('');

const userStore = useUserStore();

const onSubmit = () => {
};
</script>
