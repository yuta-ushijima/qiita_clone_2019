import Vue from 'vue'
import Router from './router/router'
import Vuetify from "vuetify"

Vue.use(Vuetify);

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: '#app',
    router: Router,
  })
});
