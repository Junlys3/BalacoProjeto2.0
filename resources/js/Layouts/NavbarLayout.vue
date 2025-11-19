<template>
  <!-- Fundo externo da página (Mesa) -->
  <div class="min-h-screen bg-page-bg py-4 px-2 sm:px-6 lg:px-8 flex justify-center font-serif text-ink">
    
    <!-- Folha do Jornal (Container Principal) -->
    <div class="w-full max-w-6xl bg-paper shadow-[0_0_40px_rgba(0,0,0,0.15)] min-h-[90vh] border border-stone-400/50 relative flex flex-col">
      
      <!-- Textura de Papel (Overlay) -->
      <div class="absolute inset-0 opacity-[0.08] pointer-events-none bg-[url('https://www.transparenttextures.com/patterns/cream-paper.png')] mix-blend-multiply z-0"></div>

      <header class="relative z-10 px-4 md:px-8 pt-6 pb-2 text-center bg-paper">
        <!-- Barra de Topo (Data e Preço) -->
        <div class="flex flex-wrap justify-between items-center border-b-2 border-ink/80 pb-2 mb-2 text-xs font-headline uppercase tracking-widest text-ink-light">
          <div class="w-1/3 text-left">Vol. I &bull; Edição Diária</div>
          <div class="w-1/3 text-center font-bold text-ink">{{ currentDate }}</div>
          <div class="w-1/3 text-right">Preço: 1 Real</div>
        </div>

        <!-- Masthead (Título Gigante) -->
        <div class="mb-6 group cursor-pointer">
          <Link href="/">
            <h1 class="font-masthead text-5xl md:text-7xl lg:text-8xl text-ink uppercase tracking-tighter leading-none transform scale-y-90 drop-shadow-sm hover:opacity-90 transition-opacity">
              The Balaco Jornal
            </h1>
          </Link>
          <p class="font-headline text-xs md:text-sm uppercase tracking-[0.4em] text-ink-light mt-2">Notícias de Ontem, Hoje.</p>
        </div>

        <!-- Navegação (Estilo Menu de Jornal) -->
        <nav class="border-y-4 border-double border-ink py-3 flex justify-center flex-wrap gap-6 md:gap-12 font-headline font-bold text-sm md:text-lg uppercase tracking-wider sticky top-0 bg-paper z-50 shadow-sm">
          <Link href="/" class="hover:text-red-900 transition-colors hover:underline decoration-2 underline-offset-4">Primeira Página</Link>
          <Link href="/about" class="hover:text-red-900 transition-colors hover:underline decoration-2 underline-offset-4">Sobre</Link>
          <Link href="/contact" class="hover:text-red-900 transition-colors hover:underline decoration-2 underline-offset-4">Telégrafo</Link>
          <span class="text-ink-light/30 hidden md:inline">|</span>
          <Link
            href="/posts/create"
            class="hover:text-red-900 transition-colors hover:underline decoration-2 underline-offset-4"
          >
            Escrever Artigo
          </Link>
        </nav>
      </header>

      <!-- Conteúdo Principal -->
      <main class="relative z-10 px-4 md:px-12 py-8 flex-grow">
        <slot /> 
      </main>

      <!-- Rodapé Vintage -->
      <footer class="relative z-10 border-t-4 border-double border-ink mx-4 md:mx-8 py-8 mt-auto">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-center md:text-left font-body text-xs text-ink-light">
          <div>
             <h4 class="font-headline font-bold uppercase tracking-widest text-ink mb-2">Escritório</h4>
             <p>Rua dos Alfa, nº 00</p>
             <p>BucetaCity, Brasil</p>
          </div>
          <div class="text-center flex flex-col justify-center">
             <p class="font-masthead text-xl text-ink mb-1">The Balaco Jornal</p>
             <p class="italic">"A verdade, doa a quem doer."</p>
          </div>
          <div class="text-center md:text-right">
             <p>&copy; 2025 — Escrito por Júlio</p>
             <p>Todos os direitos reservados.</p>
          </div>
        </div>
      </footer>

    </div>
  </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
import { computed } from 'vue';

const currentDate = computed(() => {
  return new Date().toLocaleDateString('pt-BR', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });
});
</script>