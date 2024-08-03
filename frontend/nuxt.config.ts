// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  css: ["~/assets/tailwind.css"],

  app: {
    pageTransition: { name: 'page', mode: 'out-in' },
  },
  

  routeRules: {
    '/api/**': {
      proxy: process.env.NODE_ENV === "development" ? "http://127.0.0.1:8000/api/**" : "/api/**",
    },
    '/docs': {
      proxy: "http://127.0.0.1:8000/docs",
    },
    '/openapi.json': {
      proxy: "http://127.0.0.1:8000/openapi.json",
    }
  },

  modules: ["@nuxtjs/tailwindcss", '@formkit/auto-animate/nuxt', '@pinia/nuxt'],
})