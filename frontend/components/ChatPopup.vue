<template>
    <div v-auto-animate>
      <div
        v-if="isOpen"
        class="fixed z-50 bottom-4 right-4 bg-white shadow-lg rounded-lg overflow-hidden w-80 lg:w-96"
      >
        <div
          class="bg-secondary text-black p-4 flex justify-between items-center"
        >
          <span class="text-lg">
            <i class="fa-regular fa-comments pr-1"></i> Assistant Chat</span
          >
          <button @click="toggleChat" class="btn btn-ghost">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="p-4 h-96 overflow-y-auto">
        <div
            v-for="(message, index) in messages"
            :key="message"
            :class="index % 2 === 0 ? 'chat chat-start mb-2' : 'chat chat-end mb-2'"
        >
        <div :class="index % 2 === 0 ? 'chat-bubble p-2 rounded-lg' : 'chat-bubble p-2 rounded-lg '">
                {{ message }}
                <i v-if="index % 2 !== 0" class="fas fa-robot ml-2"></i>
            </div>
        </div>
    </div>
        <div class="p-4 border-t border-gray-200">
          <input
            v-model="newMessage"
            @keyup.enter="sendMessage"
            placeholder="Type a message..."
            class="w-full p-2 border border-gray-300 rounded-lg outline-0"
          />
        </div>
      </div>
    </div>
    <div v-auto-animate>
      <button
        v-if="!isOpen"
        class="fixed bottom-4 right-4 z-50 px-4 py-2 bg-secondary rounded-lg shadow-lg"
        @click="toggleChat"
      >
        <i class="fa-regular fa-comments"></i> Assistant
      </button>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, computed } from "vue";
  import { useChatStore } from "@/stores/chat";
  
  const chatStore = useChatStore();
  const newMessage = ref("");
  
  const toggleChat = () => {
    chatStore.toggleChat();
  };
  
  const sendMessage = async () => {
    if (newMessage.value.trim()) {
      chatStore.addMessage(newMessage.value);
      const data = [
        {
          role: "user",
          parts: [
            {
              text: newMessage.value,
            },
          ],
        },
      ];
      newMessage.value = "";
      const response = await useFetch("http://127.0.0.1:5002/api/search", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });
      if (response.status.value === "success" && response.data.value) {
        const responseText = (
          response.data.value as { parts: { text: string }[] }
        ).parts[0].text;
        console.log(responseText);
        chatStore.addMessage(responseText || "Sorry, I didn't get that.");
      } else {
        console.error("Error:", response.error.value);
        chatStore.addMessage("Sorry, I didn't get that.");
      }
    }
    return "";
  };
  
  const isOpen = computed(() => chatStore.isOpen);
  const messages = computed(() => chatStore.messages);
  </script>
  
  <style scoped>
  .chat-start {
      justify-self: start;
  }
  
  .chat-end {
      justify-self: end;
  }
  </style>
  