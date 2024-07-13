import { createRouter, createWebHistory } from 'vue-router'
import ArticleTypeView from '@/views/ArticleTypeView.vue'
import ArticleManagementView from '@/views/ArticleManagementView.vue'
import LoginView from '@/views/LoginView.vue'
import UserInfoView from '@/views/UserInfoView.vue'
import BasicLayout from '@/layout/BasicLayout.vue'
import UserResetPasswordView from '@/views/UserResetPasswordView.vue'
import UserAvatarView from '@/views/UserAvatarView.vue'

const routes = [
 {
  path:'/login',
  component:LoginView
 },
 {
  path:'/',
  component:BasicLayout,
  redirect:'/article/manage',
  children:[
    {
    path:'/article/manage',
    component:ArticleManagementView
    },
    {
      path:'/article/category',
      component:ArticleTypeView
    },
    { path: '/user/info', 
      component: UserInfoView 
    },
    {
      path:'/user/avatar',
      component:UserAvatarView
    },
    {
      path:'/user/resetPassword',
      component:UserResetPasswordView
    }
  ]
 }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
