import Vue from 'vue'
import App from './App.vue'
import './plugins/element.js'
import day from 'dayjs'

Vue.config.productionTip = false

Vue.prototype.$day = day

new Vue({
  render: h => h(App),
}).$mount('#app')
