import request from '@/utils/request.js'

export const articleCategoryListService = ()=>{

    return request.get('/category').then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
        
    })
}

export const articleCategoryAddService = (categoryData)=>{
    return request.post('/category',categoryData).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
        
    })
}

export const articleCategoryUpdateService = (categoryData)=>{
    return request.put('/category',categoryData).then(response=>{
    return response
}).catch(error=>{
    console.log(error)
    
})
}

export const articleCategoryDeleteService = (id)=>{
    return request.delete('/category/'+id).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
        
    })
}

export const articleListService = (params)=>{
    return request.get('/article',{params:params}).then(response=>{
    return response
}).catch(error=>{
    console.log(error)
    
})
}

export const articleAddService = (articleData)=>{
    return request.post('/article',articleData).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
        
    })

}

export const articleUpdate = (articleData2)=>{
    return request.put('/article',articleData2).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
        
    })
}

export const articleDelete = (id)=>{
    return request.delete('/article/'+id).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
        
    })
}

export const articleDetail = (id)=>{
    return request.get('/article/detail/'+id).then(response=>{
        return response
    }).catch(error=>{
        console.log(error)
        
    })
}