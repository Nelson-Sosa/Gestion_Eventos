// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// 1. IMPORTAR EL CSS COMPILADO DE BOOTSTRAP
import 'bootstrap/dist/css/bootstrap.min.css';

// 2. IMPORTAR EL JS DE BOOTSTRAP (PARA MODALES, DROPDOWNS, ETC.)
import * as bootstrap from "bootstrap";// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
