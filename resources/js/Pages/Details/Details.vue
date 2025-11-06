<template>
  <AppLayout>
    <div class="bg-paper text-ink font-body py-16 px-6">
      <article class="max-w-3xl mx-auto leading-relaxed">
        <!-- Título -->
        <h1 class="font-serif text-4xl font-bold text-center mb-4">
          {{ post.title }}
        </h1>

        <!-- Meta (autor + data) -->
        <p class="text-center text-stone-500 italic mb-10">
          {{ post.user.name }} • {{  }}
        </p>

        <!-- Corpo do artigo -->
        <div class="space-y-6 text-justify">
          <p class="first-letter:float-left first-letter:text-5xl first-letter:font-serif first-letter:mr-2 first-letter:font-bold first-letter:text-accent">
            {{ post.content }}
          </p>

          <blockquote class="border-l-4 border-accent pl-4 italic text-stone-700 my-8">
            “O código limpo é como poesia — não só funciona, como também é uma merda.”
          </blockquote>

          <p>
            A simplicidade é o que torna o Laravel tão poderoso. Ele se preocupa em
            fazer o desenvolvedor se sentir desconfortável, como se o código tivesse
            personalidade própria.
          </p>

        

          <hr class="border-t border-stone-300 my-12" />

          <p class="text-center text-stone-600 italic">
            Obrigado por ler! — <span class="font-semibold text-accent">{{ post.user.name }}</span>
          </p>
        </div>
      </article>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'

defineProps({
  post: Object
})

</script>
