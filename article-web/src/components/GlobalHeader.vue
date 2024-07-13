<template>
  <a-row class="grid-demo" align="center">
    <a-col flex="100px">
      <el-avatar :src="mark" style="margin-left : 30px;"/>
    </a-col>
    <a-col flex="auto">
      <div class="menu-demo" style="margin-left: 100px;">
    <a-menu mode="horizontal" :default-selected-keys="['/article/manage']" @menu-item-click="doClient">
      <a-menu-item key="/article/manage">文章管理</a-menu-item>
      <a-menu-item key="/article/category">类型管理</a-menu-item>
      <a-sub-menu>
        <template #title>{{ userInfoStore.info.nickname }}</template>
        <a-menu-item key="/user/info"><span>个人信息</span><el-icon style="padding-left: 3px;"><User/></el-icon></a-menu-item>
        <a-menu-item key="/user/avatar"><span>更换头像</span><el-icon style="padding-left: 3px;"><Crop/></el-icon></a-menu-item>
        <a-menu-item key="/user/resetPassword"><span>修改密码</span><el-icon style="padding-left: 3px;"><EditPen/></el-icon></a-menu-item>
      </a-sub-menu>
    </a-menu>
  </div>
    </a-col>
    <a-col flex="100px">
      <el-dropdown placement="bottom-end" @command="handleCommand" style="margin-right: 50px;">
                    <span class="el-dropdown__box">
                        <el-avatar :src="userInfoStore.info.userPic? userInfoStore.info.userPic:avatar" />
                        <el-icon>
                            <CaretBottom />
                        </el-icon>
                    </span>
                    <template #dropdown>
                        <el-dropdown-menu>
                            <el-dropdown-item command="info" :icon="User">个人信息</el-dropdown-item>
                            <el-dropdown-item command="avatar" :icon="Crop">更换头像</el-dropdown-item>
                            <el-dropdown-item command="resetPassword" :icon="EditPen">修改密码</el-dropdown-item>
                            <el-dropdown-item command="logout" :icon="SwitchButton">退出登录</el-dropdown-item>
                        </el-dropdown-menu>
                    </template>
                </el-dropdown>
    </a-col>
  </a-row>
</template>

<script setup>
import {
    User,
    Crop,
    EditPen,
    SwitchButton,
    CaretBottom
} from '@element-plus/icons-vue'
import avatar from '@/assets/default.png'
import mark from '@/assets/mark.png'

import {userInfoService} from '@/api/user.js'
import useUserInfoStore from '@/stores/userInfo.js'
import {useTokenStore} from '@/stores/token.js'
const tokenStore = useTokenStore();
const userInfoStore = useUserInfoStore();
const getUserInfo = async()=>{
    let result = await userInfoService();
    if(result==null)return
    userInfoStore.setInfo(result.data);
}
getUserInfo()

import {useRouter} from 'vue-router'

const router = useRouter();
import {ElMessage,ElMessageBox} from 'element-plus'
const handleCommand = (command)=>{
    if(command === 'logout'){
        ElMessageBox.confirm(
        '您确认要退出吗?',
        '温馨提示',
        {
            confirmButtonText: '确认',
            cancelButtonText: '取消',
            type: 'warning',
        }
    )
        .then(async () => {
            tokenStore.removeToken()
            userInfoStore.removeInfo()

            router.push('/login')
            ElMessage({
                type: 'success',
                message: '退出登录',
            })
            
        })
        .catch(() => {
            ElMessage({
                type: 'info',
                message: '取消操作',
            })
        })
    }else{
        router.push('/user/'+command)
    }
}
// import {ref } from 'vue'
// import {useRoute} from 'vue-router'
// const rpath = useRoute()
// const selectkey = ref([rpath.path]);
// // eslint-disable-next-line no-unused-vars
// router.afterEach((to, from, failure) => {
//   selectkey.value = [to.path];
// });
// import { onMounted } from 'vue'
// onMounted(()=>{
//   selectkey.value = router.path
//   console.log([rpath.path])
// })

const doClient=(key)=>{
        router.push(key)
    }
</script>

<style scoped>
.el-dropdown__box {
            display: flex;
            align-items: center;

            .el-icon {
                color: #676464;
                margin-left: 5px;
            }

            &:active,
            &:focus {
                outline: none;
            }
        }
</style>