<template>
    <input type="text" :name="model.name" id="" v-model="model"/>
    <label :for="model.name">{{ model.name }}</label>
</template>

<script setup>

const model = defineModel('modelValue', {
  type: String,
  required: true
});


defineProps({
  name: {
    type: String,
    default: ''
  },
  title: {
    type: String,
    default: ''
  },
  content: {
    type: String,
    default: ''
  }
  
});



</script>

<style lang="scss" scoped>



</style>