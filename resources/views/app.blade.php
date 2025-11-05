<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    @vite('resources/js/app.js')
    @inertiaHead
    <!-- Em resources/views/app.blade.php ou em AppLayout.vue -->
   <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Crimson+Pro:wght@400;500&display=swap" rel="stylesheet">

  </head>
  <body>
    @inertia
  </body>
  

</html>