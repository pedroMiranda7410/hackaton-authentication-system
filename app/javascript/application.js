// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
import "@hotwired/turbo-rails"
import 'bootstrap'
import $ from "jquery"

$(document).ready(function() {
    const divContador = $('#expiration-time');
    console.log($('#expiration-time'));
    console.log($('#expiration-time').text());
    let contador = parseInt($('#expiration-time').text());

    console.log('contador', contador);
    function atualizarContador() {
        contador--;
        divContador.textContent = contador;

        if (contador <= 0) {
            clearInterval(intervalo);
            window.location.href = "/login";
        }
    }

    // Atualiza o contador a cada segundo (1000 milissegundos)
    const intervalo = setInterval(atualizarContador, 1000);
});