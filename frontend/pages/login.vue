<template>
    <div class="pages-wrapper hero background">
        <div class="hero-content flex-col lg:flex-row">
            <!--side panel-->
            <div class="text-center w-full max-w-xl lg:text-left">
                <h1 class="text-5xl font-bold">Login now!</h1>
                <p class="py-6">Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi
                    exercitationem quasi. In deleniti eaque aut repudiandae et a id nisi.</p>
            </div>

            <!--login form-->
            <div class="card shrink-0 w-full max-w-lg shadow-2xl">
                <form class="card-body" @submit.prevent="onSubmit">
                    <!--username-->
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text">Username</span>
                        </label>
                        <input v-model="identifier" type="text" placeholder="username" class="input input-bordered"
                            required />
                    </div>
                    <!--password-->
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text">Password</span>
                        </label>
                        <input v-model="password" type="password" placeholder="password" class="input input-bordered"
                            required />
                        <label class="label">
                            <nuxt-link to="/register" class="label-text-alt link link-hover">
                                Don't have an account? Register.
                            </nuxt-link>
                        </label>
                    </div>
                    <!--login button-->
                    <div class="form-control mt-6">
                        <button class="btn btn-primary text-green-100">Login</button>
                    </div>
                    <!--error message-->
                    <p class="text-error" :class="{ 'invisible': !showWrongCredentialsError }">
                        Please check your password and account name, then try again.
                    </p>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useUserStore } from '@/stores/user';

const identifier = ref('');
const password = ref('');
const showWrongCredentialsError = ref(false);
const router = useRouter();

const userStore = useUserStore();

const onSubmit = () => {
    if (identifier.value === 'admin' && password.value === 'admin') {
        userStore.login();
        userStore.makeAdmin();
        showWrongCredentialsError.value = false;
        router.push('/admin');
    } else {
        if (identifier.value === 'user' && password.value === 'user') {
            userStore.login();
            showWrongCredentialsError.value = false;
            router.push('/');
        } else {
            showWrongCredentialsError.value = true;
        }
    }

};
</script>

<style scoped></style>