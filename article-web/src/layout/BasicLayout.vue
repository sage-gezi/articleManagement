<template>
    <div id="basiclayout">
      <a-layout style="min-height: 100vh">
        <a-layout-header class="header">
          <GlobalHeader />
        </a-layout-header>
        <a-layout-content class="content">
          <router-view />
        </a-layout-content>
        <a-layout-footer class="footer">文章管理系统</a-layout-footer>
      </a-layout>
    </div>
  </template>
  
  <style scoped>
  
  #basiclayout .content {
    background: linear-gradient(to right, #aaa, #fff);
    margin-bottom: 16px;
    padding: 20px;
  }
  
  #basiclayout .footer {
    background: #efefef;
    margin-bottom: 16px;
    padding: 16px;
    position: sticky;
    bottom: 0;
    right: 0;
    left: 0;
    text-align: center;
  }
  </style>
  <script setup>
  import GlobalHeader from "@/components/GlobalHeader.vue";
  </script>
  