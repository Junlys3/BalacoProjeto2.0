<template>
  <AppLayout>
    <div class="max-w-3xl mx-auto py-12 px-6">
      <h1
        class="text-3xl font-bold mb-8 text-center uppercase tracking-wide border-b border-gray-300 pb-4"
      >
        Criar novo post
      </h1>

      <form @submit.prevent="submit" class="space-y-6">
        <div>
          <label for="title" class="block text-lg font-semibold mb-2">Título</label>
          <input
            type="text"
            id="title"
            v-model="form.title"
            maxlength="100"
            placeholder="Digite o título do post..."
            class="w-full border border-gray-400 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-gray-700"
          />
          <p class="text-red-700 mt-2 text-sm italic border-l-4 border-red-700 pl-2">
            {{ form.errors.title }}
          </p>
        </div>

        <div>
          <label for="content" class="block text-lg font-semibold mb-2">Conteúdo</label>
          <textarea
            id="content"
            v-model="form.content"
            rows="8"
            placeholder="Escreva o conteúdo do post..."
            class="w-full border border-gray-400 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-gray-700"
          ></textarea>
          <p class="text-red-700 mt-2 text-sm italic border-l-4 border-red-700 pl-2">
            {{ form.errors.content }}
          </p>
        </div>
        <div>
          <label for="signature" class="block text-lg font-semibold mb-2">Assinatura</label>
          <input
            type="text"
            id="signature"
            v-model="form.signature"
            maxlength="50"
            placeholder="Digite sua assinatura..."
            class="w-full border border-gray-400 rounded-lg p-3 focus:outline-none focus:ring-2 focus:ring-gray-700"
          />
          <p
            class="text-red-700 mt-2 text-sm italic border-l-4 border-red-700 pl-2"
          >
            {{ form.errors.signature }}
          </p>
        </div>


        <div class="flex justify-center">
          <button
            type="submit"
            :disabled="form.processing"
            class="bg-gray-900 text-white font-semibold py-3 px-8 rounded-lg uppercase tracking-wider hover:bg-gray-800 transition disabled:opacity-60"
          >
            Criar
          </button>
        </div>
      </form>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
import { useForm } from '@inertiajs/vue3'

const form = useForm({
  title: '',
  content: '',
  signature: ''

})

const submit = () => {
  form.post('/poststore')
  
}
</script>
