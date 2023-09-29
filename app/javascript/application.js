// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
import "@hotwired/turbo-rails"
import 'bootstrap'
import $ from "jquery"

// document.addEventListener("DOMContentLoaded", function() {
//     const divContador = document.getElementById("expiration-time");
//     let contador = parseInt(divContador.dataset.session);

//     console.log('contador', contador);
//     function atualizarContador() {
//         contador--;
//         divContador.textContent = contador;

//         if (contador <= 0) {
//             clearInterval(intervalo);
//             window.location.href = "/login";
//         }
//     }

//     // Atualiza o contador a cada segundo (1000 milissegundos)
//     const intervalo = setInterval(atualizarContador, 1000);
// });