<template>
    <el-card class="page-container">
        <template #header>
            <div class="header">
                <span>文章管理</span>
                <div class="extra">
                    <el-button type="primary" @click="clearArticleModel(),visibleDrawer = true;operator='添加文章'">添加文章</el-button>
                </div>
            </div>
        </template>
        <el-form inline>
            <el-form-item label="文章分类：">
                <el-select placeholder="请选择" v-model="categoryId" style="width: 200px;">
                    <el-option v-for="c in categorys" :key="c.id" :label="c.categoryName" :value="c.id">
                    </el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="发布状态：">
                <el-select placeholder="请选择" v-model="state" style="width: 200px;">
                    <el-option label="已发布" value="已发布"></el-option>
                    <el-option label="草稿" value="草稿"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="articleList">搜索</el-button>
                <el-button @click="categoryId = ''; state = ''">重置</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="articles" style="width: 100%">
            <el-table-column label="文章标题" width="400" prop="title"></el-table-column>
            <el-table-column label="分类" prop="categoryName"></el-table-column>
            <el-table-column label="发表时间" prop="createTime"> </el-table-column>
            <el-table-column label="状态" prop="state"></el-table-column>
            <el-table-column label="操作" width="100">
                <template #default="{ row }" >
                    <el-button :icon="Edit" circle plain type="primary" @Click="showArticle(row.id),operator='编辑文章',visibleDrawer=true"></el-button>
                    <el-button :icon="Delete" circle plain type="danger" @Click="deletArticle(row.id)"></el-button>
                </template>
            </el-table-column>
            <template #empty>
                <el-empty description="没有数据" />
            </template>
        </el-table>
        <el-pagination v-model:current-page="pageNum" v-model:page-size="pageSize" :page-sizes="[3, 5, 10, 15]"
            layout="jumper, total, sizes, prev, pager, next" background :total="total" @size-change="onSizeChange"
            @current-change="onCurrentChange" style="margin-top: 20px; justify-content: flex-end" />

        <el-drawer v-model="visibleDrawer" :title=operator direction="rtl" size="50%">
            <el-form :model="articleModel" label-width="100px">
                <el-form-item label="文章标题">
                    <el-input v-model="articleModel.title" placeholder="请输入标题"></el-input>
                </el-form-item>
                <el-form-item label="文章分类">
                    <el-select placeholder="请选择" v-model="articleModel.categoryId">
                        <el-option v-for="c in categorys" :key="c.id" :label="c.categoryName" :value="c.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="文章封面">     
                    <el-upload class="avatar-uploader" :auto-upload="true" :show-file-list="false"
                    action="/api/upload"
                    name="file"
                    :headers="{'Authorization':tokenStore.token}"
                    :on-success="uploadSuccess"
                    >
                        <img v-if="articleModel.coverImg" :src="articleModel.coverImg" class="avatar" />
                        <el-icon v-else class="avatar-uploader-icon">
                            <Plus />
                        </el-icon>
                    </el-upload>
                </el-form-item>
                <el-form-item label="文章内容">
                    <div class="editor">
                        <quill-editor ref="myQuillEditor" theme="snow" v-model:content="articleModel.content" contentType="html">
                        </quill-editor>
                    </div>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="operator === '编辑文章' ? editArticle('已发布') : addArticle('已发布')">发布</el-button>
                    <el-button type="info" @click="operator === '编辑文章' ? editArticle('草稿') : addArticle('草稿')">草稿</el-button>
                </el-form-item>
            </el-form>
        </el-drawer>
    </el-card>
</template>
<script setup>
import {
    Edit,
    Delete
} from '@element-plus/icons-vue'

import { ref } from 'vue';

const categorys = ref([])

const categoryId = ref('')

const state = ref('')

const articles = ref([])

const pageNum = ref(1)
const total = ref(20)
const pageSize = ref(3)

const onSizeChange = (size) => {
    pageSize.value = size
    articleList()
}

const onCurrentChange = (num) => {
    pageNum.value = num
    articleList()
}

import { articleCategoryListService, articleListService,articleAddService } from '@/api/article.js'
const articleCategoryList = async () => {
    let result = await articleCategoryListService();
    if(result==null)return

    categorys.value = result.data;
}

const articleList = async () => {
    let params = {
        pageNum: pageNum.value,
        pageSize: pageSize.value,
        categoryId: categoryId.value ? categoryId.value : null,
        state: state.value ? state.value : null
    }
    let result = await articleListService(params);
    if(result==null)return


    total.value = result.data.total;
    articles.value = result.data.items;

    for (let i = 0; i < articles.value.length; i++) {
        let article = articles.value[i];
        for (let j = 0; j < categorys.value.length; j++) {
            if (article.categoryId == categorys.value[j].id) {
                article.categoryName = categorys.value[j].categoryName;
            }
        }
    }
}


articleCategoryList()
articleList();

import { QuillEditor } from '@vueup/vue-quill'
import '@vueup/vue-quill/dist/vue-quill.snow.css'
import { Plus } from '@element-plus/icons-vue'
const visibleDrawer = ref(false)

const articleModel = ref({
    title: '',
    categoryId: '',
    coverImg: '',
    content: '',
    state: ''
})

const clearArticleModel = ()=>{
    articleModel.value.title=''
    articleModel.value.categoryId=''
    articleModel.value.coverImg=''
    articleModel.value.content='',
    articleModel.value.state=''
}



import { useTokenStore } from '@/stores/token.js';
const tokenStore = useTokenStore();
const uploadSuccess = (result)=>{
    articleModel.value.coverImg = result.data;
    console.log(result.data);
}

import {ElMessage} from 'element-plus'
const addArticle = async (clickState)=>{

    articleModel.value.state = clickState;

    let result = await articleAddService(articleModel.value);
    if(result==null)return

    ElMessage.success(result.msg? result.msg:'添加成功');

    visibleDrawer.value = false;

    clearArticleModel()

    articleList()
}

import {articleDetail} from '@/api/article.js'
const operator = ref('')
const showArticle = async (id)=>{
    let result = await articleDetail(id)
    if(result==null)return
    articleModel.value = result.data
    console.log(id)
}
import {articleUpdate} from '@/api/article.js'
const editArticle = async (clickState)=>{
    articleModel.value.state = clickState
    let result = await articleUpdate(articleModel.value)
    if(result==null)return
    console.log('hello')
    ElMessage.success(result.msg?result.msg:'修改成功')
    visibleDrawer.value = false

    clearArticleModel()
    articleList()

}

import {articleDelete} from '@/api/article.js'
import {ElMessageBox} from 'element-plus'
const deletArticle = (id)=>{
    ElMessageBox.confirm(
        '你确认要删除该文章?',
        '温馨提示',
        {
            confirmButtonText: '确认',
            cancelButtonText: '取消',
            type: 'warning',
        }
    )
        .then(async () => {
            await articleDelete(id);
            ElMessage({
                type: 'success',
                message: '删除成功',
            })
            articleList()
        })
        .catch(() => {
            ElMessage({
                type: 'info',
                message: '用户取消了删除',
            })
        })
}
</script>
<style lang="scss" scoped>
.page-container {
    min-height: 100%;
    box-sizing: border-box;

    .header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
}

.avatar-uploader {
    :deep() {
        .avatar {
            width: 178px;
            height: 178px;
            display: block;
        }

        .el-upload {
            border: 1px dashed var(--el-border-color);
            border-radius: 6px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: var(--el-transition-duration-fast);
        }

        .el-upload:hover {
            border-color: var(--el-color-primary);
        }

        .el-icon.avatar-uploader-icon {
            font-size: 28px;
            color: #8c939d;
            width: 178px;
            height: 178px;
            text-align: center;
        }
    }
}

.editor {
    width: 100%;

    :deep(.ql-editor) {
        min-height: 200px;
    }
}

</style>