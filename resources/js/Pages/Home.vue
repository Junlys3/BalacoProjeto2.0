<template>
  <AppLayout>
    <div class="space-y-12">
      <article
        v-for="post in posts" :key="post.id"
        class="border-b border-stone-300 pb-8"
      >
        <Link :href="`details/${ post.id }`">
          <h2 class="text-2xl font-serif font-semibold mb-2 hover:underline cursor-pointer">
          {{ post.title }}
        </h2>
        </Link>
        <p class="text-stone-600 leading-relaxed mb-3">{{ post.content }}</p>
        <p class="text-stone-500 text-sm">{{ post.signature ? post.signature : "Autor Anônimo" }} • {{ post.created_at }}</p>
      </article>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
import { Link } from '@inertiajs/vue3';
//Props recebidas do backend(Route)
defineProps({
  posts: Object,
  
})
</script>
