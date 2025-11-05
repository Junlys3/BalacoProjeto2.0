<template>
  <AppLayout>
    <div class="flex flex-col items-center justify-center text-center px-4 py-10">
      <h1 class="text-3xl font-bold text-gray-800 mb-4">Sobre o Projeto</h1>
      <p class="max-w-xl text-gray-600 text-lg leading-relaxed">
        Este é um projeto pessoal feito para treinamento, usando as seguintes tecnologias:
      </p>

      <ul class="mt-4 text-gray-700 space-y-2">
        <li>
          ⚙️
          <a
            href="https://laravel.com/docs"
            target="_blank"
            class="font-semibold text-indigo-600 hover:underline"
          >
            Laravel
          </a>
        </li>
        <li>
          🧭
          <a
            href="https://inertiajs.com"
            target="_blank"
            class="font-semibold text-indigo-600 hover:underline"
          >
            Inertia.js
          </a>
        </li>
        <li>
          🌿
          <a
            href="https://vuejs.org/guide/introduction.html"
            target="_blank"
            class="font-semibold text-indigo-600 hover:underline"
          >
            Vue 3
          </a>
        </li>
        <li>
          🎨
          <a
            href="https://tailwindcss.com/docs"
            target="_blank"
            class="font-semibold text-indigo-600 hover:underline"
          >
            Tailwind CSS
          </a>
        </li>
        <li>
          🚀
          <a
            href="https://vitejs.dev/guide/"
            target="_blank"
            class="font-semibold text-indigo-600 hover:underline"
          >
            Vite
          </a>
        </li>
      </ul>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
import { Link } from '@inertiajs/vue3'
</script>

<style scoped></style>
