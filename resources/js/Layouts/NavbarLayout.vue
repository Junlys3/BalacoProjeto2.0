<template>
  <div class="min-h-screen bg-paper text-ink font-body">
    <header class="border-b border-stone-300 py-6 px-10 flex justify-between items-center">
      <h1 class="text-3xl font-serif font-bold tracking-tight">The Balaco Jornal</h1>
      <nav class="space-x-6 text-lg">
        <Link href="/" class="hover:underline">Home</Link>
        <Link href="/about" class="hover:underline">Sobre</Link>
        <Link href="/contact" class="hover:underline">Contato</Link>
        <Link
          href="/posts/create"
          class="ml-4 px-4 py-2 border border-stone-400 text-stone-700 hover:bg-stone-200 rounded transition"
        >
         + Novo Post
        </Link>
      </nav>
    </header>

    <main class="max-w-4xl mx-auto py-12 px-6">
      <slot /> <!-- Conteúdo da página ficara aqui -->
    </main>

    <footer class="border-t border-stone-300 py-6 text-center text-sm text-stone-600">
      © 2025 The Balaco Jornal — Escrito por Júlio
    </footer>
  </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3'
</script>
