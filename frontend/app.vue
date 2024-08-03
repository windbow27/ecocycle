<script setup lang="ts">
</script>

<template>
    <NuxtLoadingIndicator/>
    <AppHeader/>
    <ChatPopup />
    <NuxtPage/>
</template>

<style>
body,
html {
  margin: 0;
  padding: 0;
}
.page-enter-active,
.page-leave-active {
  transition: all 0.4s;
}
.page-enter-from,
.page-leave-to {
  opacity: 0;
  filter: blur(1rem);
}
</style>
