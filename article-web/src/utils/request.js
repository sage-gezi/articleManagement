import axios from 'axios';

import { ElMessage } from 'element-plus'
const baseURL = '/api';
const instance = axios.create({ baseURL })

import {useTokenStore} from '@/stores/token.js'
instance.interceptors.request.use(
    (config)=>{
        const tokenStore = useTokenStore();
        if(tokenStore.token){
            config.headers.Authorization = tokenStore.token
        }
        return config;
    },
    (err)=>{
        Promise.reject(err)
    }
)

import router from '@/router'
instance.interceptors.response.use(
    result => {
        if(result.data.code===1){
            return result.data;
        }
        ElMessage.error(result.data.msg?result.data.msg:'服务异常')
        return Promise.reject(result.data)
        
    },
    err => {
        if(err.response.status===401){
            console.log(err)
            ElMessage.error('请先登录')
            router.push('/login')
        }else{
            ElMessage.error('服务异常')
        }
       
        return Promise.reject(err);
    }
)

export default instance;