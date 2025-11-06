<template>
    <div>
       
       <form @submit.prevent="submit">
         <input type="text" v-model="form.title">


       </form>
     

    </div>
</template>

<script setup>
  import { useForm } from '@inertiajs/vue3';
  import TextInput from '../Components/TextInput.vue';
  

  const form = useForm({
    name: '',
    title: 'teste',
    content: '',
  });

  const submit = () => {
    form.post('/posts'); // Envia o formulário para a rota de criação de posts
  };

</script>

<style lang="scss" scoped>

</style>