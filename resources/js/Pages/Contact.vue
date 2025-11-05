<template>
  <AppLayout>
    <div class="flex flex-col items-center px-6 py-10 space-y-6 max-w-4xl mx-auto">
      <h1 class="text-4xl font-bold text-gray-800 mb-10 text-center">Contato</h1>

      <div class="grid grid-cols-1 gap-6 w-full">
        <!-- Email -->
        <div class="flex items-center bg-white shadow-md rounded-2xl p-6 hover:shadow-xl transform hover:-translate-y-1 transition-all duration-300 h-28">
          <div class="w-16"></div>
          <div>
            <h2 class="text-xl font-semibold text-gray-800">Email</h2>
            <p class="text-gray-600">juliosdelima1@gmail.com</p>
          </div>
        </div>

        <!-- Telefone -->
        <div class="flex items-center bg-white shadow-md rounded-2xl p-6 hover:shadow-xl transform hover:-translate-y-1 transition-all duration-300 h-28">
          <div class="w-16"></div>
          <div>
            <h2 class="text-xl font-semibold text-gray-800">Telefone</h2>
            <p class="text-gray-600">85 9 9219-9843</p>
          </div>
        </div>

        <!-- LinkedIn -->
        <div class="flex items-center bg-white shadow-md rounded-2xl p-6 hover:shadow-xl transform hover:-translate-y-1 transition-all duration-300 h-28">
          <div class="w-16"></div>
          <div>
            <h2 class="text-xl font-semibold text-gray-800">LinkedIn</h2>
            <p class="text-gray-600">
              <a href="https://www.linkedin.com/in/julio-simao-de-lima-88593a242/" target="_blank" class="text-indigo-600 hover:underline">
                linkedin.com/in/julio-simao
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
</script>

<style scoped></style>
