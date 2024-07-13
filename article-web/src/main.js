import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import ArcoVue from '@arco-design/web-vue';
import '@arco-design/web-vue/dist/arco.css';
import 'element-plus/dist/index.css'
import ElementPlus from 'element-plus'
import { createPinia } from 'pinia';
import { createPersistedState } from 'pinia-persistedstate-plugin';
import locale from 'element-plus/dist/locale/zh-cn.js'
import 'element-plus/dist/index.css'

const pinia = createPinia();
const persist = createPersistedState()


pinia.use(persist)
createApp(App).use(pinia).use(router).use(ArcoVue).use(ElementPlus,{locale}).mount('#app');
