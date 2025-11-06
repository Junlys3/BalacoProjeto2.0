# 📰 Balaco Projeto 2.0

**Balaco Projeto 2.0** é a nova versão do blog **Balaco**, reconstruído com uma stack moderna e mais performática, utilizando **Laravel**, **Inertia.js**, **Vue 3** e **TailwindCSS**.  
O projeto nasceu da necessidade de modernizar o antigo blog feito em Laravel puro, trazendo uma experiência mais fluida, dinâmica e visualmente atraente — mantendo a essência e o conteúdo original.

---

🧠 Objetivo do Projeto
    “Reimaginar o blog Balaco com uma stack moderna, focada em desempenho e experiência do usuário, explorando o melhor de Laravel e Vue no mesmo ecossistema.”

## 🚀 Tecnologias Utilizadas

- **[Laravel 11+](https://laravel.com/)** — Framework backend em PHP.
- **[Inertia.js](https://inertiajs.com/)** — Ponte entre Laravel e Vue sem API REST.
- **[Vue 3](https://vuejs.org/)** — Framework JavaScript reativo.
- **[TailwindCSS](https://tailwindcss.com/)** — Framework CSS utilitário moderno.
- **[Vite](https://vitejs.dev/)** — Build tool rápido e simples para o frontend.

---

## ⚙️ Instalação e Configuração

1. **Clone este repositório**
   ```bash
   git clone https://github.com/Junlys3/BalacoProjeto2.0.git
   cd BalacoProjeto2.0
2. Instale as dependências do Laravel
    composer install
    
3. Instale as dependências do frontend
    npm install
   
4. Copie o arquivo .env e configure suas variáveis
    cp .env.example .env
    php artisan key:generate
   
5. Configure o banco de dados no .env e rode as migrações
    php artisan migrate --seed

6. Inicie o servidor de desenvolvimento
    php artisan serve
    npm run dev


Este projeto está licenciado sob a MIT License — veja o arquivo LICENSE
para mais detalhes.
