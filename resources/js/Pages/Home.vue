<template>
  <AppLayout>
    <div class="space-y-12">
      <article
        v-for="post in posts"
        :key="post.id"
        class="border-b border-stone-300 pb-8"
      >
        <h2 class="text-2xl font-serif font-semibold mb-2 hover:underline cursor-pointer">
          {{ post.title }}
        </h2>
        <p class="text-stone-600 leading-relaxed mb-3">{{ post.excerpt }}</p>
        <p class="text-stone-500 text-sm">{{ post.author }} • {{ post.date }}</p>
      </article>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'

// temporário
const posts = [
  {
    id: 1,
    title: 'Como o Laravel mudou minha forma de programar',
    excerpt: 'Uma breve reflexão sobre produtividade e arquitetura limpa...',
    author: 'Júlio Simão',
    date: '05 nov 2025',
  },
  {
    id: 2,
    title: 'Por que Renan é tão burro?',
    excerpt: 'Burrice de Renan explicada cientificamente e suas implicações na sociedade.',
    author: 'Pau no cu Qualquer',
    date: '01 nov 2025',
  },
]
</script>
