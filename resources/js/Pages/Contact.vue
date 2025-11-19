<template>
  <AppLayout>
    <!-- Ticker Editorial -->
    <div class="mb-10 border-y-2 border-ink py-2 flex items-center justify-between bg-paper-dark/30 overflow-hidden">
      <div class="bg-ink text-paper px-3 py-1 text-[10px] font-headline font-bold uppercase tracking-widest mr-4 whitespace-nowrap flex-shrink-0">
        Serviço Postal
      </div>
      <div class="font-body italic text-ink-light text-xs whitespace-nowrap w-full animate-marquee">
        ... Linhas de comunicação abertas ... Envie suas cartas, telegramas e sinais de fumaça ... Atendimento rápido e cortês ...
      </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">

      <!-- Coluna Principal -->
      <div class="lg:col-span-8 space-y-8">
        <article class="border-b-2 border-ink/20 pb-10">
          <!-- Cabeçalho do Artigo -->
          <div class="mb-3 flex items-center justify-between">
             <span class="font-headline text-[10px] uppercase tracking-widest bg-ink text-paper px-2 py-1">
               Classificados & Contatos
             </span>
             <span class="font-body text-xs italic text-ink-light">
               Seção de Cartas
             </span>
          </div>

          <!-- Título -->
          <h2 class="text-4xl md:text-5xl font-headline font-bold text-ink leading-tight mb-6">
            Canais de Comunicação <br/> comigo
          </h2>

          <!-- Introdução -->
          <p class="font-body text-ink-light leading-relaxed text-justify text-lg mb-8 first-letter:text-5xl first-letter:font-headline first-letter:font-bold first-letter:text-ink first-letter:float-left first-letter:mr-2 first-letter:mt-[-6px]">
            Qualquer bug avisa aí
          </p>

          <!-- Grade de Contatos (Estilo Anúncios) -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            
            <!-- Email -->
            <div class="border-2 border-ink p-4 relative group hover:bg-paper-dark transition-colors">
              <div class="absolute -top-3 left-4 bg-paper px-2 font-headline font-bold uppercase text-xs tracking-widest text-ink">
                Correio Eletrônico
              </div>
              <div class="text-center py-4">
                <div class="text-4xl mb-2 grayscale opacity-80">✉️</div>
                <h3 class="font-headline font-bold text-xl text-ink mb-1">Manda um carta digital</h3>
                <p class="font-body text-ink-light text-sm italic mb-3">"Para mensagens longas e chatas"</p>
                <a href="mailto:juliosdelima1@gmail.com" class="font-mono text-sm font-bold text-ink border-b border-ink hover:bg-ink hover:text-paper transition-colors px-1">
                  juliosdelima1@gmail.com
                </a>
              </div>
            </div>

            <!-- Telefone -->
            <div class="border-2 border-ink p-4 relative group hover:bg-paper-dark transition-colors">
               <div class="absolute -top-3 left-4 bg-paper px-2 font-headline font-bold uppercase text-xs tracking-widest text-ink">
                Linha Direta
              </div>
              <div class="text-center py-4">
                <div class="text-4xl mb-2 grayscale opacity-80">☎️</div>
                <h3 class="font-headline font-bold text-xl text-ink mb-1">Ligue Agora</h3>
                <p class="font-body text-ink-light text-sm italic mb-3">"Zip Zop"</p>
                <a href="tel:+5585992199843" class="font-mono text-sm font-bold text-ink border-b border-ink hover:bg-ink hover:text-paper transition-colors px-1">
                  Tu sabe né
                </a>
              </div>
            </div>

            <!-- LinkedIn -->
            <div class="border-2 border-ink p-4 relative group hover:bg-paper-dark transition-colors md:col-span-2">
               <div class="absolute -top-3 left-4 bg-paper px-2 font-headline font-bold uppercase text-xs tracking-widest text-ink">
                Rede Profissional
              </div>
              <div class="flex flex-col md:flex-row items-center md:justify-between px-4 py-2">
                <div class="flex items-center mb-4 md:mb-0">
                   <span class="text-4xl mr-4 grayscale opacity-80">💼</span>
                   <div class="text-center md:text-left">
                     <h3 class="font-headline font-bold text-xl text-ink">Perfil Profissional</h3>
                     <p class="font-body text-ink-light text-sm italic">Clica aí</p>
                   </div>
                </div>
                <a href="https://www.linkedin.com/in/julio-simao-de-lima-88593a242/" target="_blank" class="inline-block font-headline uppercase font-bold text-xs tracking-widest border border-ink px-4 py-2 hover:bg-ink hover:text-paper transition-colors">
                  Visitar Perfil &rarr;
                </a>
              </div>
            </div>

          </div>

        </article>
      </div>

      <!-- Divisória Vertical -->
      <div class="hidden lg:block w-px bg-ink/20 mx-auto h-full"></div>

      <!-- Sidebar -->
      <aside class="lg:col-span-3 flex flex-col space-y-8">
        
        <!-- Widget Publicidade -->
        <div class="border-4 border-double border-ink p-6 text-center bg-paper relative overflow-hidden">
            <!-- Faixa canto -->
            <div class="absolute top-0 right-0 bg-ink text-paper text-[8px] uppercase font-bold px-6 py-1 transform rotate-45 translate-x-4 translate-y-2">
              Grátis
            </div>

            <h4 class="font-headline font-bold uppercase text-3xl mb-1 tracking-tighter">Atenção!</h4>
            <div class="w-full h-px bg-ink mb-3"></div>
            <p class="font-headline font-bold uppercase text-sm mb-2">Procura-se</p>
            <p class="font-body text-xs italic mb-4 leading-snug">
              Viados e gays
            </p>
            <p class="font-mono text-[10px] uppercase border-t border-ink/20 pt-2 mt-4">Recompensa: 1 beijo</p>
        </div>

        <!-- Menu Rápido -->
        <div class="pt-4 border-t-4 border-ink">
           <h3 class="font-headline font-bold text-lg mb-4 uppercase tracking-wide text-center">Navegação</h3>
           <ul class="space-y-3 text-center">
              <li>
                <Link href="/" class="font-body text-sm text-ink hover:underline decoration-1 underline-offset-2">Voltar ao Início</Link>
              </li>
              <li>
                 <Link href="/about" class="font-body text-sm text-ink hover:underline decoration-1 underline-offset-2">Sobre o Jornal</Link>
              </li>
           </ul>
        </div>

      </aside>

    </div>
    
    <div class="text-center py-8 border-t border-ink/30 mt-12">
       <p class="font-headline italic text-ink-light text-sm">*** Aguardamos seu contato ***</p>
    </div>

  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
import { Link } from '@inertiajs/vue3'
</script>