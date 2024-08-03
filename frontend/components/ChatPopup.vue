<template>
    <div v-auto-animate>
        <div v-if="isOpen" class="fixed z-50 bottom-4 right-4 bg-white shadow-lg rounded-lg overflow-hidden w-80 lg:w-96">
            <div class="bg-secondary text-black p-4 flex justify-between items-center">
                <span class="text-lg"> <i class="fa-regular fa-comments pr-1"></i> Assistant Chat</span>
                <button @click="toggleChat" class="btn btn-ghost "><i class="fa-solid fa-xmark"></i></button>
            </div>
            <div class="p-4 h-96 overflow-y-auto">
                <div v-for="message in messages" :key="message" class="chat chat-start mb-2">
                    <div class="chat-bubble p-2 rounded-lg">{{ message}}</div>
                </div>
            </div>
            <div class="p-4 border-t border-gray-200">
                <input v-model="newMessage" @keyup.enter="sendMessage" placeholder="Type a message..." class="w-full p-2 border border-gray-300 rounded-lg" />
            </div>
        </div>
    </div>
    <div v-auto-animate>
        <button v-if="!isOpen" class="fixed bottom-4 right-4 z-50 px-4 py-2 bg-secondary rounded-lg shadow-lg"
            @click="toggleChat">
            <i class="fa-regular fa-comments"></i> Assistant
        </button>
    </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useChatStore } from '@/stores/chat'

const chatStore = useChatStore()
const newMessage = ref('')

const toggleChat = () => {
    chatStore.toggleChat()
}

const sendMessage = () => {
    if (newMessage.value.trim()) {
        chatStore.addMessage(newMessage.value)
        newMessage.value = ''
    }
}

const isOpen = computed(() => chatStore.isOpen)
const messages = computed(() => chatStore.messages)
</script>

<style scoped>
</style>