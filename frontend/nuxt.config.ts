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
    },
    '/account/**': {
      proxy: "http://127.0.0.1:8000/account/**",
    },
   '/search/**': {
      proxy: "http://127.0.0.1:8000/search/**",
    },
    '/article/**': {
      proxy: "http://127.0.0.1:8000/article/**",
    },
    '/img_object_detection_to_img/**': {
      proxy: "http://127.0.0.1:8000/img_object_detection_to_img/**",
    }
  },
  
  modules: ["@nuxtjs/tailwindcss", '@formkit/auto-animate/nuxt', '@pinia/nuxt'],
})