<script setup lang="ts">

import { useUserStore } from '@/stores/user';
const userStore = useUserStore();

const Logout = () => {
    userStore.logout();
}

</script>

<template>
    <div class="fixed drawer z-50 bg-neutral-50/90 opacity-90">
        <input id="my-drawer-3" type="checkbox" class="drawer-toggle" />
        <div class="drawer-content flex flex-col">
            <!-- Navbar -->
            <div class="navbar w-full">
                <div class="flex-none lg:hidden">
                    <label for="my-drawer-3" aria-label="open sidebar" class="btn btn-square btn-ghost">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            class="inline-block h-6 w-6 stroke-current">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M4 6h16M4 12h16M4 18h16"></path>
                        </svg>
                    </label>
                </div>
                <div>
                    <img src="/logo.png" alt="Logo" class="avatar w-16 p-2" />
                    <nuxt-link to="/"
                        class="btn btn-ghost flex-none lg:flex-1 px-2 text-2xl text-green-700">EcoCycle</nuxt-link>
                </div>
                <div class="hidden flex-none lg:block ml-auto">
                    <ul class="menu menu-horizontal">
                        <!-- Navbar menu content here -->
                        <nuxt-link to="/" class="btn btn-ghost"><i class="fa-solid fa-house"></i>Home</nuxt-link>
                        <nuxt-link v-if="userStore.isAdmin" to="admin" class="btn btn-ghost"><i
                                class="fa-solid fa-cog"></i>Admin</nuxt-link>
                        <nuxt-link to="/about" class="btn btn-ghost"><i
                                class="fa-solid fa-address-card"></i>About</nuxt-link>
                        <nuxt-link v-if="!userStore.isLoggedIn" to="/login" class="btn btn-ghost"><i
                                class="fa-solid fa-sign-in"></i>Login</nuxt-link>
                        <nuxt-link v-else @click="Logout" class="btn btn-ghost"><i
                                class="fa-solid fa-sign-out"></i>Logout</nuxt-link>
                    </ul>
                </div>
            </div>
        </div>
        <div class="drawer-side">
            <label for="my-drawer-3" aria-label="close sidebar" class="drawer-overlay"></label>
            <ul class="menu bg-base-200 min-h-full w-80 p-4 flex items-center">
                <div>
                    <img src="/logo.png" alt="Logo" class="avatar w-16 p-2" />
                    <nuxt-link to="/" class="flex-none lg:flex-1 px-2 text-2xl text-green-700">EcoCycle</nuxt-link>
                </div>
                <!-- Sidebar content here -->
                <nuxt-link to="/" class="btn btn-ghost"><i class="fa-solid fa-house"></i>Home</nuxt-link>
                <nuxt-link v-if="userStore.isAdmin" to="admin" class="btn btn-ghost"><i
                        class="fa-solid fa-cog"></i>Admin</nuxt-link>
                <nuxt-link to="/about" class="btn btn-ghost"><i class="fa-solid fa-address-card"></i>About</nuxt-link>
                <nuxt-link v-if="!userStore.isLoggedIn" to="/login" class="btn btn-ghost"><i
                        class="fa-solid fa-sign-in"></i>Login</nuxt-link>
                <nuxt-link v-else @click="Logout" class="btn btn-ghost"><i
                        class="fa-solid fa-sign-out"></i>Logout</nuxt-link>
            </ul>
        </div>
    </div>

</template>
