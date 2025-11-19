<template>
  <AppLayout>
    <!-- Ticker de Notícias (Faixa decorativa) -->
    <div class="mb-10 border-y-2 border-ink py-2 flex items-center justify-between bg-paper-dark/30 overflow-hidden">
      <div class="bg-ink text-paper px-3 py-1 text-[10px] font-headline font-bold uppercase tracking-widest mr-4 whitespace-nowrap flex-shrink-0">
        Últimas Notas
      </div>
      <div class="font-body italic text-ink-light text-xs whitespace-nowrap animate-marquee w-full">
        ... Renan é burro pra carai ... Rusé é maconheiro ... Chicolas é viado KKKKKKKKKKKKKKKKKKKKKKK ... 
      </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">
      
      <!-- Coluna Principal (Artigos) -->
      <div class="lg:col-span-8 space-y-12">
        <article
          v-for="(post, index) in posts" :key="post.id"
          class="border-b-2 border-ink/20 pb-10 last:border-0"
        >
          <!-- Cabeçalho do Artigo -->
          <div class="mb-3 flex items-center justify-between">
             <span class="font-headline text-[10px] uppercase tracking-widest bg-ink text-paper px-2 py-1">
               Notícia
             </span>
             <span class="font-body text-xs italic text-ink-light">
               {{ post.created_at }}
             </span>
          </div>

          <!-- Título -->
          <Link :href="`details/${ post.id }`" class="group block mb-4">
            <h2 class="text-3xl md:text-4xl font-headline font-bold text-ink leading-tight group-hover:underline decoration-2 underline-offset-4 decoration-ink/50 transition-all">
              {{ post.title }}
            </h2>
          </Link>

          <!-- Assinatura -->
          <div class="flex items-center mb-4 text-xs font-headline uppercase tracking-wide text-ink-light border-b border-ink/10 pb-2">
            <span class="mr-2">Por</span>
            <span class="font-bold text-ink">{{ post.signature ? post.signature : "Correspondente Anônimo" }}</span>
          </div>

          <!-- Conteúdo / Resumo -->
          <p class="font-body text-ink-light leading-relaxed text-justify text-lg line-clamp-4 first-letter:text-5xl first-letter:font-headline first-letter:font-bold first-letter:text-ink first-letter:float-left first-letter:mr-2 first-letter:mt-[-6px]">
            {{ post.content }}
          </p>

          <!-- Botão Ler Mais -->
          <div class="mt-6">
            <Link :href="`details/${ post.id }`" class="inline-flex items-center text-xs font-bold font-headline uppercase tracking-widest text-ink hover:bg-ink hover:text-paper px-3 py-2 transition-all border border-ink">
              Ler Matéria Completa &rarr;
            </Link>
          </div>
        </article>
      </div>

      <!-- Divisória Vertical (Apenas Desktop) -->
      <div class="hidden lg:block w-px bg-ink/20 mx-auto h-full"></div>

      <!-- Coluna Lateral (Sidebar) -->
      <aside class="lg:col-span-3 flex flex-col space-y-8">
        
        <!-- Widget de Propaganda -->
        <div class="border-4 border-double border-ink/30 p-6 text-center bg-paper-dark">
            <h4 class="font-headline font-bold uppercase text-sm mb-2 tracking-widest">Almanaque</h4>
            <div class="w-12 h-1 bg-ink mx-auto mb-3"></div>
            <p class="font-body text-xs italic mb-4">"O melhor remédio para a depressão 20g de sal"</p>
            <p class="font-mono text-[10px] uppercase border-t border-ink/20 pt-2">Tônico de minha pica ereta</p>
        </div>

        

      </aside>

    </div>

    <div class="text-center py-8 border-t border-ink/30 mt-12">
      <p class="font-headline italic text-ink-light">*** Fim da Página ***</p>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
import { Link } from '@inertiajs/vue3';

// Props recebidas do backend
defineProps({
  posts: Object,
})
</script>
