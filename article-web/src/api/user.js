
import request from '@/utils/request.js'

export const userRegisterService = (registerData)=>{
    const params = new URLSearchParams()
    for(let key in registerData){
        params.append(key,registerData[key]);
    }
    return request.post('/user/register',params).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
    })
}

export const userLoginService = (loginData)=>{
    const params = new URLSearchParams();
    for(let key in loginData){
        params.append(key,loginData[key])
    }
    return request.post('/user/login',params).then(response=>{
        console.log(response)
        return Promise.resolve(response)
    }).catch(error=>{
        console.log(error)
    })
}

export const userInfoService = ()=>{
    return request.get('/user').then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
    })
}

export const userInfoUpdateService = (userInfoData)=>{
    return request.put('/user/update',userInfoData).then(response=>{
    return response
}).catch(error=>{
    console.log(error)
})
}

export const userAvatarUpdateService = (avatarUrl)=>{
    const params = new URLSearchParams();
    params.append('userPic',avatarUrl)
    return request.patch('/user/updateUserPic',params).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
    })
}

export const userResetPassword = (userData)=>{
    return request.patch('/user/updatePassword',userData).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
    })
}