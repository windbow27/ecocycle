import { defineStore } from 'pinia'

export const useChatStore = defineStore('chat', {
  state: () => ({
    isOpen: false,
    messages: [] as string[],
  }),
  actions: {
    toggleChat() {
      this.isOpen = !this.isOpen
    },
    addMessage(message: string) {
      this.messages.push(message)
    },
  },
  persist: true,
})