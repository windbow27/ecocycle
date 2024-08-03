import { defineStore } from 'pinia';

export const useUserStore = defineStore('user', {
    state: () => ({
        isLoggedIn: false,
        isAdmin: false,
    }),
    actions: {
        login() {
            this.isLoggedIn = true;
        },
        logout() {
            this.isLoggedIn = false;
        },
        makeAdmin() {
            this.isAdmin = true;
        },
        revokeAdmin() {
            this.isAdmin = false;
        },
    },
    persist: true,
});