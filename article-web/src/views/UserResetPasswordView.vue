<template>
<el-card class="page-container">
    <template #header>
        <div class="header">
            <span>修改密码</span>
        </div>
    </template>
    <el-row>
        <el-col :span="12">
            <el-form ref="form" size="large" autocomplete="off" :model="userData" :rules="rules">
                <el-form-item prop="old_pwd">
                    <el-input :prefix-icon="Lock" type="password" placeholder="请输入密码" v-model="userData.old_pwd"></el-input>
                </el-form-item>
                <el-form-item prop="new_pwd">
                    <el-input :prefix-icon="Lock" type="password" placeholder="请输入新密码"
                        v-model="userData.new_pwd"></el-input>
                </el-form-item>
                <el-form-item prop="re_pwd">
                    <el-input :prefix-icon="Lock" type="password" placeholder="请再次输入密码"
                        v-model="userData.re_pwd"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button class="button" type="primary" auto-insert-space @click="updatePassword">
                        提交
                    </el-button>
                </el-form-item>
    </el-form>
        </el-col>
    </el-row>
</el-card>

</template>
<script setup>
import {ref} from 'vue'
const userData = ref({
    old_pwd: '',
    new_pwd: '',
    re_pwd: ''
})

const checkRePassword = (rule, value, callback) => {
    if (value === '') {
        callback(new Error('请再次确认密码'))
    } else if (value !== userData.value.new_pwd) {
        callback(new Error('请确保两次输入的密码一样'))
    } else {
        callback()
    }
}

const rules = {
    old_pwd: [
        { required: true, message: '请输入新密码', trigger: 'blur' },
        { min: 5, max: 16, message: '长度为5~16位非空字符', trigger: 'blur' }
    ],
    new_pwd: [
        { required: true, message: '请输入新密码', trigger: 'blur' },
        { min: 5, max: 16, message: '长度为5~16位非空字符', trigger: 'blur' }
    ],
    re_pwd: [
        { validator: checkRePassword, trigger: 'blur' }
    ]
}

import {userResetPassword} from '@/api/user.js'
import { ElMessage } from 'element-plus';
import router from '@/router';
const updatePassword = async ()=>{
    let result = await userResetPassword(userData.value)
    if(result==null)return

    ElMessage.success(result.msg?result.msg:'修改成功')

    router.push('/login')
}

</script>
<style scoped>
.login-page {
    height: 100vh;
    background-color: #fff;
    .form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        user-select: none;

        .title {
            margin: 0 auto;
        }

        .button {
            width: 100%;
        }

        .flex {
            width: 100%;
            display: flex;
            justify-content: space-between;
        }
    }
}

</style> 