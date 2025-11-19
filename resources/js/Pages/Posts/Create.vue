<template>
  <AppLayout>
    <!-- Ticker Editorial -->
    <div class="mb-10 border-y-2 border-ink py-2 flex items-center justify-between bg-paper-dark/30 overflow-hidden">
      <div class="bg-ink text-paper px-3 py-1 text-[10px] font-headline font-bold uppercase tracking-widest mr-4 whitespace-nowrap flex-shrink-0">
        Departamento Editorial
      </div>
      <div class="font-body italic text-ink-light text-xs whitespace-nowrap w-full animate-marquee">
        ... O prazo para fechamento da edição é agora ... A verdade deve ser dita, doa a quem doer ... Verifique suas fontes antes de submeter ...
      </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">

      <!-- Coluna Principal (Formulário) -->
      <div class="lg:col-span-8 space-y-8">
        <div class="border-b-2 border-ink/20 pb-6">
             <span class="font-headline text-[10px] uppercase tracking-widest bg-ink text-paper px-2 py-1">
               Submissão de Manuscrito
             </span>
             <h2 class="text-4xl md:text-5xl font-headline font-bold text-ink leading-tight mt-4">
               Redigir Nova Matéria
             </h2>
             <p class="font-body italic text-ink-light mt-2">
               Preencha o formulário abaixo para enviar seu artigo à gráfica.
             </p>
        </div>

        <form @submit.prevent="submit" class="space-y-8">
          
          <!-- Campo Título -->
          <div>
            <label for="title" class="block font-headline font-bold uppercase tracking-wider text-sm mb-2 text-ink">
              Manchete (Título)
            </label>
            <input
              type="text"
              id="title"
              v-model="form.title"
              maxlength="100"
              placeholder="EX: GRANDE DESCOBERTA NA CIDADE..."
              class="w-full bg-paper border-2 border-ink p-4 font-headline font-bold text-xl text-ink placeholder-ink-light/50 focus:outline-none focus:ring-2 focus:ring-ink/20 transition-all"
            />
            <p v-if="form.errors.title" class="mt-2 text-xs font-bold text-red-700 font-headline uppercase tracking-wide">
              &uarr; Erro: {{ form.errors.title }}
            </p>
          </div>

          <!-- Campo Assinatura -->
          <div>
            <label for="signature" class="block font-headline font-bold uppercase tracking-wider text-sm mb-2 text-ink">
              Assinatura do Autor
            </label>
            <div class="flex items-center border-2 border-ink bg-paper">
                <span class="pl-4 pr-2 text-xl grayscale opacity-70">✒️</span>
                <input
                  type="text"
                  id="signature"
                  v-model="form.signature"
                  maxlength="50"
                  placeholder="Seu nome ou pseudônimo"
                  class="w-full bg-transparent border-0 p-3 font-body italic text-lg text-ink placeholder-ink-light/50 focus:ring-0 focus:outline-none"
                />
            </div>
            <p v-if="form.errors.signature" class="mt-2 text-xs font-bold text-red-700 font-headline uppercase tracking-wide">
              &uarr; Erro: {{ form.errors.signature }}
            </p>
          </div>

          <!-- Campo Conteúdo -->
          <div>
            <label for="content" class="block font-headline font-bold uppercase tracking-wider text-sm mb-2 text-ink">
              Corpo do Texto
            </label>
            <div class="relative">
               <!-- Linha decorativa simulando margem de caderno -->
               <div class="absolute left-8 top-0 bottom-0 w-px bg-red-200/50 pointer-events-none z-10 h-full"></div>
               
               <textarea
                id="content"
                v-model="form.content"
                rows="15"
                placeholder="Digite aqui as bostas apuradas..."
                class="w-full bg-paper border-2 border-ink p-4 pl-12 font-mono text-sm leading-relaxed text-ink placeholder-ink-light/50 focus:outline-none focus:ring-2 focus:ring-ink/20 transition-all resize-y"
              ></textarea>
            </div>
            
            <div class="flex justify-between items-start mt-2">
               <p v-if="form.errors.content" class="text-xs font-bold text-red-700 font-headline uppercase tracking-wide">
                &uarr; Erro: {{ form.errors.content }}
              </p>
              <span v-else></span> <!-- Spacer -->
              <p class="text-[10px] font-headline uppercase tracking-widest text-ink-light">
                {{ form.content.length }} Caracteres
              </p>
            </div>
          </div>

          <!-- Ações -->
          <div class="pt-8 border-t-2 border-ink/10 flex items-center justify-between">
             <Link href="/" class="font-headline text-xs font-bold uppercase tracking-widest text-ink-light hover:text-ink hover:underline decoration-1 underline-offset-2">
                Cancelar e Voltar
             </Link>

            <button
              type="submit"
              :disabled="form.processing"
              class="group relative inline-flex items-center justify-center px-8 py-3 font-headline font-bold text-white transition-all duration-200 bg-ink border-2 border-ink hover:bg-paper hover:text-ink focus:outline-none disabled:opacity-70 disabled:cursor-not-allowed"
            >
               <span class="absolute w-full h-full -mt-1 -ml-1 transition-all duration-200 ease-out bg-ink rounded group-hover:mt-0 group-hover:ml-0"></span>
               <span class="relative flex items-center uppercase tracking-widest text-xs">
                  Enviar para Gráfica &rarr;
               </span>
            </button>
          </div>
        </form>
      </div>

      <!-- Divisória Vertical (Desktop) -->
      <div class="hidden lg:block w-px bg-ink/20 mx-auto h-full"></div>

      <!-- Sidebar -->
      <aside class="lg:col-span-3 flex flex-col space-y-8">
        
        <!-- Widget Manual de Redação -->
        <div class="bg-paper-dark p-6 border border-ink shadow-sm relative">
           <!-- "Prego" decorativo -->
           <div class="absolute -top-2 left-1/2 transform -translate-x-1/2 w-3 h-3 rounded-full bg-gray-400 shadow-inner border border-gray-500"></div>
           
           <h3 class="font-headline font-bold uppercase text-center text-sm mb-4 tracking-widest border-b border-ink pb-2">Manual de Redação</h3>
           <ul class="list-decimal list-inside space-y-3 font-body text-sm text-ink-light">
              <li>
                <strong class="text-ink">Seja Breve:</strong> O papel é um recurso escasso.
              </li>
              <li>
                <strong class="text-ink">Seja Claro:</strong> Escreva para burros, não para acadêmicos.
              </li>
              <li>
                <strong class="text-ink">Verifique:</strong> A reputação do Balaco Jornal depende da sua precisão.
              </li>
              <li>
                <strong class="text-ink">Revise:</strong> Erros ortográficos serão descontados com chibatadas.
              </li>
           </ul>
        </div>

        <!-- Aviso -->
        <div class="border-4 border-double border-ink/30 p-4 text-center">
            <p class="font-headline font-bold uppercase text-xs mb-2 tracking-wide">Aviso Legal</p>
            <p class="font-body text-[11px] italic leading-snug">
              "O autor é inteiramente responsável pelas merdas expressas neste artigo. A direção do jornal lava suas mãos."
            </p>
        </div>

      </aside>
    </div>
  </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/NavbarLayout.vue'
import { Link, useForm } from '@inertiajs/vue3'

const form = useForm({
  title: '',
  content: '',
  signature: ''
})

const submit = () => {
  form.post('/poststore')
}
</script>
