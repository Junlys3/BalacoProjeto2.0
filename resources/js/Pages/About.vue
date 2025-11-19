<template>
  <AppLayout>
    <!-- Ticker Editorial -->
    <div class="mb-10 border-y-2 border-ink py-2 flex items-center justify-between bg-paper-dark/30 overflow-hidden">
      <div class="bg-ink text-paper px-3 py-1 text-[10px] font-headline font-bold uppercase tracking-widest mr-4 whitespace-nowrap flex-shrink-0">
        Nota do Editor
      </div>
      <div class="font-body italic text-ink-light text-xs whitespace-nowrap w-full animate-marquee">
        ... Edição Especial: Os segredos por trás da construção desta página digital ... Tecnologia encontra Tradição ...
      </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">

      <!-- Coluna Principal -->
      <div class="lg:col-span-8 space-y-8">
        <article class="border-b-2 border-ink/20 pb-10">
          <!-- Cabeçalho do Artigo -->
          <div class="mb-3 flex items-center justify-between">
             <span class="font-headline text-[10px] uppercase tracking-widest bg-ink text-paper px-2 py-1">
               Bastidores
             </span>
             <span class="font-body text-xs italic text-ink-light">
               Projeto Pessoal
             </span>
          </div>

          <!-- Título -->
          <h2 class="text-4xl md:text-5xl font-headline font-bold text-ink leading-tight mb-6">
            Sobre o Projeto: <br/> Notas e Ferramentas utilizadas
          </h2>

          <!-- Assinatura -->
          <div class="flex items-center mb-6 text-xs font-headline uppercase tracking-wide text-ink-light border-b border-ink/10 pb-2">
            <span class="mr-2">Por</span>
            <span class="font-bold text-ink">O Desenvolvedor</span>
          </div>

          <!-- Conteúdo -->
          <div class="font-body text-ink-light leading-relaxed text-justify text-lg space-y-6">
            <p class="first-letter:text-5xl first-letter:font-headline first-letter:font-bold first-letter:text-ink first-letter:float-left first-letter:mr-2 first-letter:mt-[-6px]">
              Este é um projeto feito para treinamento e aprendizado, com
              Tecnologias que eu nunca tinha usado antes. Nada aqui deve
              ser levado a sério, note que erros podem e vão ocorrer.
              Devido a falta de experiência minha com as tecnologias
              utilizadas.
              Note que o design é feito via vibe code(Ou seja IA)
              mas a LÓGICA por trás do site é feita totalmente por mim(Júlio).
              A cada novo aprendizado o site recebe atualizações e melhora um pouco.
              

            </p>
            
            <p>
              Tecnologias utilizadas:
            </p>

            <!-- Lista de Tecnologias -->
            <ul class="space-y-4 mt-6 ml-2 sm:ml-6">
              <li class="flex items-start group">
                <span class="text-2xl mr-4 mt-[-2px] grayscale group-hover:grayscale-0 transition-all">⚙️</span>
                <div>
                   <a href="https://laravel.com/docs" target="_blank" class="font-headline font-bold text-ink text-xl group-hover:underline decoration-2 underline-offset-2 block">Laravel</a>
                   <span class="text-sm italic text-ink-light">O framework PHP para artesãos da web.</span>
                </div>
              </li>
              <li class="flex items-start group">
                <span class="text-2xl mr-4 mt-[-2px] grayscale group-hover:grayscale-0 transition-all">🧭</span>
                <div>
                   <a href="https://inertiajs.com" target="_blank" class="font-headline font-bold text-ink text-xl group-hover:underline decoration-2 underline-offset-2 block">Inertia.js</a>
                   <span class="text-sm italic text-ink-light">Integração entre Laravel e Vue 3 ou seja a cola entre o frontend Vue 3 e o backend Laravel</span>
                </div>
              </li>
              <li class="flex items-start group">
                <span class="text-2xl mr-4 mt-[-2px] grayscale group-hover:grayscale-0 transition-all">🌿</span>
                <div>
                   <a href="https://vuejs.org/guide/introduction.html" target="_blank" class="font-headline font-bold text-ink text-xl group-hover:underline decoration-2 underline-offset-2 block">Vue 3</a>
                   <span class="text-sm italic text-ink-light">O framework JavaScript progressivo.</span>
                </div>
              </li>
              <li class="flex items-start group">
                <span class="text-2xl mr-4 mt-[-2px] grayscale group-hover:grayscale-0 transition-all">🎨</span>
                <div>
                   <a href="https://tailwindcss.com/docs" target="_blank" class="font-headline font-bold text-ink text-xl group-hover:underline decoration-2 underline-offset-2 block">Tailwind CSS</a>
                   <span class="text-sm italic text-ink-light">Framework de utilitários para design direto.</span>
                </div>
              </li>
              <li class="flex items-start group">
                <span class="text-2xl mr-4 mt-[-2px] grayscale group-hover:grayscale-0 transition-all">🚀</span>
                <div>
                   <a href="https://vitejs.dev/guide/" target="_blank" class="font-headline font-bold text-ink text-xl group-hover:underline decoration-2 underline-offset-2 block">Vite</a>
                   <span class="text-sm italic text-ink-light">ferramenta de construção (build tool) para desenvolvimento de projetos front-end.</span>
                </div>
              </li>
            </ul>
          </div>
        </article>
      </div>

      <!-- Divisória Vertical -->
      <div class="hidden lg:block w-px bg-ink/20 mx-auto h-full"></div>

      <!-- Sidebar -->
      <aside class="lg:col-span-3 flex flex-col space-y-8">
        
        <!-- Widget Almanaque -->
        <div class="border-4 border-double border-ink/30 p-6 text-center bg-paper-dark relative">
             <div class="absolute -top-3 -right-3 bg-ink text-paper rounded-full w-12 h-12 flex items-center justify-center shadow-md transform rotate-12 font-headline font-bold text-[10px] leading-none text-center z-10">
              100%<br>TECH
            </div>
            <h4 class="font-headline font-bold uppercase text-sm mb-2 tracking-widest">Almanaque</h4>
            <div class="w-12 h-1 bg-ink mx-auto mb-3"></div>
            <p class="font-body text-xs italic mb-4">"O código é massa."</p>
            <p class="font-mono text-[10px] uppercase border-t border-ink/20 pt-2">Open Source</p>
        </div>

       

      </aside>

    </div>

    <div class="text-center py-8 border-t border-ink/30 mt-12">
       <Link href="/" class="inline-flex items-center text-xs font-bold font-headline uppercase tracking-widest text-ink hover:bg-ink hover:text-paper px-6 py-3 transition-all border border-ink">
          &larr; Voltar à Capa
       </Link>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
import { Link } from '@inertiajs/vue3'
</script>
