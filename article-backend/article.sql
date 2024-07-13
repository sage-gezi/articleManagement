create table [user]
(
    id         int identity
        primary key,
    username   nvarchar(20)                    not null,
    password   nvarchar(32)                    not null,
    nickname   nvarchar(10)  default N'',
    email      nvarchar(128) default N'',
    userPic    nvarchar(128) default N'',
    createTime datetime      default getdate() not null,
    updateTime datetime      default getdate() not null,
    phone      nvarchar(11),
    authority  nvarchar(5)                     not null
)
go

create table category
(
    id            int identity
        primary key,
    categoryName  nvarchar(32) not null,
    createUserId  int          not null
        constraint fk_category_user
            references [user],
    createTime    datetime     not null,
    updateTime    datetime     not null,
    categoryAlias varchar(32)  not null
)
go

create table article
(
    id           int identity
        primary key,
    title        nvarchar(30)   not null,
    content      nvarchar(1000) not null,
    coverImg     nvarchar(128),
    state        nvarchar(10),
    categoryId   int            not null
        constraint fk_article_category
            references category,
    createUserId int            not null
        constraint fk_article_user
            references [user],
    createTime   datetime       not null,
    updateTime   datetime       not null
)
go
INSERT INTO dbo.[user] ( username, password, nickname, email, userPic, createTime, updateTime, phone, authority) VALUES ( N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'sage', N'11111@123.com', N'', N'2024-06-26 00:00:00.000', N'2024-06-27 22:23:14.317', N'', N'admin');
INSERT INTO dbo.[user] ( username, password, nickname, email, userPic, createTime, updateTime, phone, authority) VALUES ( N'恰薯条的咕', N'e10adc3949ba59abbe56e057f20f883e', N'咕咕咕', N'', N'', N'2024-06-27 11:59:43.993', N'2024-06-27 12:01:38.620', null, N'login');
INSERT INTO dbo.[user] ( username, password, nickname, email, userPic, createTime, updateTime, phone, authority) VALUES ( N'守护书的猫', N'e10adc3949ba59abbe56e057f20f883e', N'', N'', N'', N'2024-06-27 12:14:16.133', N'2024-06-27 12:31:23.943', null, N'login');
INSERT INTO dbo.[user] ( username, password, nickname, email, userPic, createTime, updateTime, phone, authority) VALUES ( N'testt', N'96e79218965eb72c92a549dd5a330112', N'', N'', N'', N'2024-06-27 15:23:51.260', N'2024-06-27 15:23:51.260', null, N'login');
INSERT INTO dbo.[user] ( username, password, nickname, email, userPic, createTime, updateTime, phone, authority) VALUES ( N'ce', N'e10adc3949ba59abbe56e057f20f883e', N'', N'', N'', N'2024-06-27 21:44:23.967', N'2024-06-27 21:48:42.840', null, N'login');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'文学类', 1, N'2024-06-27 00:00:00.000', N'2024-06-27 00:00:01.000', N'wenxue');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'科技类', 1, N'2024-06-27 00:00:02.000', N'2024-06-27 00:00:05.000', N'keji');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES (N'哲学类', 1, N'2024-06-27 11:09:52.657', N'2024-06-27 11:09:52.657', N'zhexue');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES (N'数学类', 1, N'2024-06-27 11:13:34.040', N'2024-06-27 11:13:44.843', N'shuxue');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES (N'法律类', 1, N'2024-06-27 11:14:06.430', N'2024-06-27 11:14:45.590', N'falv');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES (N'社会学', 1, N'2024-06-27 11:29:08.567', N'2024-06-27 11:29:08.567', N'shehui');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES (N'科幻类', 1, N'2024-06-27 11:33:47.760', N'2024-06-27 11:33:47.760', N'kehuan');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES (N'社会心理学', 3, N'2024-06-27 12:10:49.367', N'2024-06-27 12:10:49.367', N'shehuixinli');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES (N'文学鉴赏类', 3, N'2024-06-27 12:12:08.963', N'2024-06-27 12:12:08.963', N'?????');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'笑话类', 4, N'2024-06-27 12:15:02.007', N'2024-06-27 12:15:02.007', N'xiaohua');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'大数据类', 4, N'2024-06-27 12:15:14.393', N'2024-06-27 12:15:14.393', N'dashuju');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'小说类', 4, N'2024-06-27 12:15:23.213', N'2024-06-27 12:15:23.213', N'xiaoshuo');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'散文类', 4, N'2024-06-27 12:15:32.087', N'2024-06-27 12:15:32.087', N'sanwen');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'杂文类', 4, N'2024-06-27 12:15:42.190', N'2024-06-27 12:15:42.190', N'zawen');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'宗教类', 4, N'2024-06-27 12:15:55.687', N'2024-06-27 12:15:55.687', N'zongjiao');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'软件类', 4, N'2024-06-27 12:16:06.220', N'2024-06-27 12:16:06.220', N'ruanjian');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'硬件类', 4, N'2024-06-27 12:16:15.477', N'2024-06-27 12:16:15.477', N'yingjian');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'操作系统类', 4, N'2024-06-27 12:16:38.617', N'2024-06-27 12:16:38.617', N'caozuoxitong');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'科技关联类', 4, N'2024-06-27 12:17:03.817', N'2024-06-27 12:17:03.817', N'kejiguanlian');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'时事类', 4, N'2024-06-27 12:18:46.423', N'2024-06-27 12:19:08.497', N'shishi');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'报道类', 4, N'2024-06-27 12:19:01.477', N'2024-06-27 12:19:13.027', N'baodao');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'资讯类', 4, N'2024-06-27 12:19:26.573', N'2024-06-27 12:19:26.573', N'zixun');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'社论类', 4, N'2024-06-27 12:19:40.353', N'2024-06-27 12:19:40.353', N'shelun');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'健康保健类', 4, N'2024-06-27 12:19:58.553', N'2024-06-27 12:19:58.553', N'jiankangbaojian');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'健康生活类', 4, N'2024-06-27 12:20:16.233', N'2024-06-27 12:20:16.233', N'jiankangshenghu');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'医疗类', 4, N'2024-06-27 12:20:32.267', N'2024-06-27 12:20:32.267', N'yiliao');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'学习类', 4, N'2024-06-27 12:20:46.220', N'2024-06-27 12:20:46.220', N'xuexi');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'教育资源类', 4, N'2024-06-27 12:21:00.483', N'2024-06-27 12:21:00.483', N'jiaoyuziyuan');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'教育资讯', 4, N'2024-06-27 12:21:12.213', N'2024-06-27 12:21:12.213', N'jiaoyuzixun');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'娱乐新闻类', 4, N'2024-06-27 12:21:26.787', N'2024-06-27 12:21:26.787', N'yulexinwen');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'八卦类', 4, N'2024-06-27 12:21:38.643', N'2024-06-27 12:21:38.643', N'bagua');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'明星动态', 4, N'2024-06-27 12:22:36.750', N'2024-06-27 12:22:36.750', N'mingxingdongta');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'旅行类', 4, N'2024-06-27 12:22:52.760', N'2024-06-27 12:22:52.760', N'lvxing');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'旅游指南类', 4, N'2024-06-27 12:23:07.310', N'2024-06-27 12:23:07.310', N'lvyouzhinan');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'金融类', 4, N'2024-06-27 12:23:24.620', N'2024-06-27 12:23:24.620', N'jinrong');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'经济类', 4, N'2024-06-27 12:23:40.663', N'2024-06-27 12:23:40.663', N'jingji');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'财务类', 4, N'2024-06-27 12:23:52.487', N'2024-06-27 12:23:52.487', N'caiwu');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'运动类', 4, N'2024-06-27 12:24:06.423', N'2024-06-27 12:24:06.423', N'yundong');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'体育新闻类', 4, N'2024-06-27 12:24:20.027', N'2024-06-27 12:24:20.027', N'tiyuxinwen');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'赛事报道类', 4, N'2024-06-27 12:24:32.217', N'2024-06-27 12:24:32.217', N'saishibaodao');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'人文类', 4, N'2024-06-27 12:24:44.810', N'2024-06-27 12:24:44.810', N'renwen');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'艺术类', 4, N'2024-06-27 12:24:55.203', N'2024-06-27 12:24:55.203', N'yishu');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'文化资讯类', 4, N'2024-06-27 12:25:06.947', N'2024-06-27 12:25:06.947', N'wenhuazixun');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'生活技巧类', 4, N'2024-06-27 12:25:27.920', N'2024-06-27 12:25:27.920', N'shenghuojiqiao');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'社会新闻类', 4, N'2024-06-27 12:25:44.373', N'2024-06-27 12:25:44.373', N'shehuixinwen');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'社会动态类', 4, N'2024-06-27 12:25:56.687', N'2024-06-27 12:25:56.687', N'shehuidongtai');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'历史故事类', 4, N'2024-06-27 12:26:12.000', N'2024-06-27 12:26:12.000', N'lishigushi');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'传记类', 4, N'2024-06-27 12:26:24.070', N'2024-06-27 12:26:24.070', N'zhuanji');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'心理健康类', 4, N'2024-06-27 12:26:41.633', N'2024-06-27 12:26:41.633', N'xinlijiankang');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'心理学类', 4, N'2024-06-27 12:26:57.553', N'2024-06-27 12:26:57.553', N'xinlixue');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'时尚资讯类', 4, N'2024-06-27 12:27:14.327', N'2024-06-27 12:27:14.327', N'shishangzixun');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'大气科学类', 4, N'2024-06-27 12:27:50.377', N'2024-06-27 12:27:50.377', N'daqikexue');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'海洋科学类', 4, N'2024-06-27 12:28:03.090', N'2024-06-27 12:28:03.090', N'haiyangkexue');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'气象学类', 4, N'2024-06-27 12:28:24.473', N'2024-06-27 12:28:24.473', N'qixiangxue');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'光学工程类', 4, N'2024-06-27 12:28:45.377', N'2024-06-27 12:28:45.377', N'guangxuegongche');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'冶金工程类', 4, N'2024-06-27 12:28:59.063', N'2024-06-27 12:28:59.063', N'yejingongcheng');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'信息与通信工程类', 4, N'2024-06-27 12:29:24.473', N'2024-06-27 12:29:24.473', N'xinxiyutongxing');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'土木工程类', 4, N'2024-06-27 12:29:49.330', N'2024-06-27 12:29:49.330', N'tumugongcheng');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'水利工程类', 4, N'2024-06-27 12:30:09.170', N'2024-06-27 12:30:09.170', N'shuiligongcheng');
INSERT INTO dbo.category ( categoryName, createUserId, createTime, updateTime, categoryAlias) VALUES ( N'gy', 6, N'2024-06-27 21:45:31.870', N'2024-06-27 21:45:31.870', N'gy');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'绝对反冲', N'<p>“绝对反冲”（absoluter Gegenstoss）这一表达方式，黑格尔只用过一次，但在他的反思逻辑中的一个关键点上，用来指明事物从自身的失落中出现的运动中对立面的推断性巧合。绝对反冲的最简洁的诗意公式是由莎士比亚提供的（这里并不奇怪），在他那不可思议的《特洛伊斯与克蕾西达》（第五幕第二场）中。</p><p><em>哦，疯狂的话语，</em></p><p><em>那个事业自相残杀！</em></p><p><em>双重权威！在那里理性可以反抗。</em></p><p><em>没有灭亡，缺失就成了一切原因。</em></p><p><em>没有反抗。</em></p><p>在剧中，这些台词指的是特洛伊斯在得知克蕾西达不忠时的自我矛盾论证：他列举了支持和反对他要证明的东西的论据；他的推理反叛了自己的论证路线，却似乎又没有撤销其自身；他的不合理性承担了理性的外表，却似乎又没有自相矛盾。一个与自己作对的事业，与（反对自己的）违抗相一致的理由...虽然这些台词指的是女性的不一致，但也可以看作是对法律的尊严与其淫秽的过失之间的秘密联盟的评论。</p>', N'', N'已发布', 3, 1, N'2024-06-27 11:12:41.917', N'2024-06-27 11:12:41.917');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'概率论导论', N'<p><span style="color: rgb(17, 17, 17);">概率论是研究自然界和人类社会中的随机现象数量规律的数学分支. 概率论的理论和方法与数学的其他分支、自然科学、工程、人文及社会科学各领域相互交叉渗透, 已经成为这些学科中的基本方法. 概率论(或概率统计) 和高等数学一样,已经成为我国高等学校各专业普遍设立的一门基础课</span></p>', N'', N'已发布', 4, 1, N'2024-06-27 11:16:02.980', N'2024-06-28 09:05:55.250');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'法律的悖论', N'<p>	法律要讲感情吗？</p><p>	邪恶才犯罪，还是犯罪才邪恶？</p><p>	自愿被人杀死，凶手算犯罪吗？</p><p>	买尸体阴婚判7年，买活人当老婆才3年？</p><p>	罢工向老板讨钱，是一种敲诈吗？</p><p>	投降是自首吗？</p><p>	不在意名誉，名誉权还会被侵犯吗？</p><p>	为什么人可以被杀死，又无法被杀死？</p><p>	限制自由，才能保障自由？</p><p>	……</p><p>	关于悖论，他的态度是——</p><p>	“对于这些悖论，我无法提供答案，只能呈现思考过程。希望在这个探讨和思考的过程中，能锻炼自己的思维，承认理性的有限，走出刺猬式的思维独断，接受狐狸式的多元包容。”</p><p>	“当每一个问题只有一个答案，答案的正确性总是可疑的。”</p><p>	“不要在自己看重的事情上附着不加边际的价值，要学会接受对立观点的相对合理性。”</p><p>	书中痛斥丰县案“对人的保护还不如物”“配阴婚判7年，买活人当老婆才3年，实在说不过去”，坦言法条“实有调整之必要。”。网暴是“通过指责他人的错误来获得一种道德平衡”。虚无主义盛行的当下，他说“人生不可能没有意义，当你认为没有‘意义’时，一定有一个与之相对应的‘意义’。”不想努力了，听他说“一个理性的成年人有选择做废物的权利，他可以放弃所有好处。”</p>', N'', N'已发布', 5, 1, N'2024-06-27 11:17:07.440', N'2024-06-27 11:17:07.440');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'视差之见', N'<p><span style="color: rgb(93, 100, 110);">视差本是天文学概念，指从保持一定距离的两个点观察同一个目标时所产生的方向差异。在齐泽克看来，审视同一个客体时，视差是由两个互不兼容的视角构成的，这两个视角之间存在着不可化约的非对称性。以视差为起点，齐泽克透过黑格尔和拉康解读哲学、科学和政治理论，借助辩证思维和精神分析范畴分析当代文化，重新激活马克思主义对全球资本主义的批判。</span></p>', N'', N'已发布', 3, 1, N'2024-06-27 11:20:19.503', N'2024-06-27 11:20:19.503');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'悲剧的诞生', N'', N'', N'草稿', 3, 1, N'2024-06-27 11:21:38.383', N'2024-06-27 11:21:38.383');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'我们生活在巨大的差距里摘录', N'', N'', N'草稿', 1, 1, N'2024-06-27 11:25:09.690', N'2024-06-27 11:25:09.690');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'金枝简介', N'<p>	《金枝》是英国人类学家詹姆斯·乔治·弗雷泽创作的人类学著作，于1890年首次出版发行。</p><p>	《金枝》是研究巫术与原始习俗的著作。该书研究了原始宗教、神话、巫术、仪式和原始人的心理，从中考察原始人的个体主观活动，寻找宗教的源头。弗雷泽提出人类思想进化的一般发展过程图式：巫术阶段――宗教阶段――科学阶段。弗雷泽运用历史比较研究方法，系统整理了世界各民族原始信仰的资料，建立了一整套严整的体系。</p><p>	《金枝》是弗雷泽的重要代表作，也是西方人类学重要的经典著作之一，弗雷泽因此书获封爵士</p>', N'', N'已发布', 3, 1, N'2024-06-27 11:33:20.923', N'2024-06-27 11:33:20.923');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'三进数世界摘录', N'<p><span style="color: rgb(129, 129, 129);">生活并不是一场道德剧。疾病就是疾病，并不附带任何隐藏含义。我们不需要去安抚某个神灵的怒火，更没必要跟某个精灵讨价还价。每一个理智的成年人都知道这一点——但这么说，还是有点儿肤浅。根源在于，我们始终无法完全接受这个最来之不易的真理：宇宙冷漠无情</span></p>', N'', N'已发布', 7, 1, N'2024-06-27 11:35:02.377', N'2024-06-27 11:35:02.377');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'噪声简介', N'<p>	想象一下，两名医生对相同的病人给出了不同的诊断；两名法官对犯了同罪的嫌疑人给出了不同的判决。再想象一下，同样的医生、法官或决策者做出了不同的决策，而这种决策仅仅取决于决策是在什么时间做出的。这些不同决策背后的罪魁祸首，就是“噪声”。</p><p>	《噪声》是诺贝尔经济学奖得主、“行为经济学之父”丹尼尔·卡尼曼携手决策领域专家奥利维耶·西博尼和卡斯·桑斯坦共同推出的重磅新作，也是卡尼曼继畅销书《思考，快与慢》之后酝酿10年思考的全球瞩目里程碑式巨作，行为科学领域又一重大发现。几十年来，大家都认为，偏差是导致人类判断出错的关键。但是今天，卡尼曼系统性地指出：噪声，才是影响人类判断的黑洞。</p><p>	《噪声》一书通过系统性研究，通过两个公式揭开了“判断出错”的本质，并且通过对三种噪声的系统性分析带你直击噪声。并且，从六大部分阐述了“噪声”：从寻获噪声到探究人类判断的本质，从预测噪声到阐释噪声的主要原因，从探讨如何改进判断和防止错误的的实际问题，一直延伸到什么才是合适的噪声水平。”“噪声”是随机的，但却是致命的。卡尼曼在书中提出了6大原则，帮你重塑决策框架，做聪明的决策者。同时，卡尼曼更是精妙地附上了“审查噪声”的使用指南，以及写给决策者的“观察者清单”。</p><p>	如果说《思考，快与慢》击退的是人类判断过程中面对的敌人“偏差”，那么《噪声》要绝杀的就是其中的另一大隐形敌人——噪声。阅读本书可以助你重塑自己的决策框架，远离噪声，做聪明的决策者。</p>', N'', N'草稿', 6, 1, N'2024-06-27 11:35:51.247', N'2024-06-27 11:35:51.247');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'巨人的陨落简介', N'<p>	<span style="color: rgb(17, 17, 17);">在第一次世界大战的硝烟中，每一个迈向死亡的生命都在热烈地生长——威尔士的矿工少年、刚失恋的美国法律系大学生、穷困潦倒的俄国兄弟、富有英俊的英格兰伯爵，以及痴情的德国特工… 从充满灰尘和危险的煤矿到闪闪发光的皇室宫殿，从代表着权力的走廊到爱恨纠缠的卧室，五个家族迥然不同又纠葛不断的命运逐渐揭晓，波澜壮阔地展现了一个我们自认为了解，但从未如此真切感受过的20世纪。</span></p>', N'', N'草稿', 1, 1, N'2024-06-27 11:37:24.567', N'2024-06-27 11:37:24.567');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'世界的凛冬短评', N'<p><span style="color: rgb(102, 102, 102);">那些在历史夹缝中努力绽放的爱恨情仇让历史更多了一分厚重和亲切。也许你对二战了如指掌，但这部小说中一定有你曾忽略的细节，近距离观察历史，你会发现它细小的毛孔和无伤大雅的黑斑，粗糙而真实，迷人又令人叹息。当后辈们站上父辈的舞台，动荡的世界让他们认清了自己的指责，人物比第一部更多，缺少一个介绍亚洲战场的家族是略微有些遗憾的，不过阅读的快感丝毫不输第一部，有紧张的竞选和战争桥段，也有舒缓的爱情家庭戏码，节奏掌控出色让人有三个通宵读完的欲望</span></p>', N'', N'已发布', 1, 1, N'2024-06-27 11:38:59.430', N'2024-06-27 11:38:59.430');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'永恒的边缘摘录', N'<p><span style="color: rgb(129, 129, 129);">“有所失必有所得。”维雷娜说。“我在为马丁·路德·金工作。和肯尼迪相比，金牧师更能推动美国的历史。”</span></p><p><span style="color: rgb(129, 129, 129);">“那是因为金牧师只有民权运动要考虑，总统考虑的事要比他多得多。总统是整个自由世界的捍卫者。现在他的心思全都放在了柏林上面。”</span></p><p><span style="color: rgb(129, 129, 129);">“这难道不奇怪吗？”维雷娜说。“他去为东德的德国人争取自由和民主，却不给南方黑人自由和民主。”</span></p><p><span style="color: rgb(129, 129, 129);">乔治笑了，维雷娜总是这么好斗。“这无关信仰，”他说，“要看他能从中得到些什么。”</span></p>', N'', N'草稿', 1, 1, N'2024-06-27 11:39:47.287', N'2024-06-27 11:39:47.287');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'量子力学简介', N'<p>	量子力学（Quantum Mechanics），为物理学理论，是研究物质世界微观粒子运动规律的物理学分支，主要研究原子、分子、凝聚态物质，以及原子核和基本粒子的结构、性质的基础理论。它与相对论一起构成现代物理学的理论基础。量子力学不仅是现代物理学的基础理论之一，而且在化学等学科和许多近代技术中得到广泛应用。</p><p>	19世纪末，人们发现旧有的经典理论无法解释微观系统，于是经由物理学家的努力，在20世纪初创立量子力学，解释了这些现象。量子力学从根本上改变人类对物质结构及其相互作用的理解。除了广义相对论描写的引力以外，迄今所有基本相互作用均可以在量子力学的框架内描述（量子场论）。</p>', N'', N'草稿', 2, 1, N'2024-06-27 11:41:30.113', N'2024-06-27 11:41:30.113');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'机械原理简介', N'<p><span style="background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);">《机械原理（第九版）》保持了原书的一贯特色：系统严密、叙述清晰、概念正确、措辞严谨、图表规范、文笔流畅、可读性好；便于学生学习和其他工程技术人员自学，具有良好的教学适用性。同时，还将某些已较为成熟的新技术、新成果、新概念、新理论充实到教材内容中，使教材在内容上保持了先进性、工程实用性和启迪性。该教材为了培养学生的创新思维和能力，该书特增加了许多应用很成功、具有一定创新性的工程实例，以期对读者的创造性思维有所启发，并使得教材内容更加丰富</span></p>', N'', N'已发布', 2, 1, N'2024-06-27 11:42:49.473', N'2024-06-27 11:42:49.473');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'线性代数简介', N'', N'', N'草稿', 4, 1, N'2024-06-27 11:44:21.523', N'2024-06-27 11:44:21.523');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'圆圈正义摘录', N'<p><span style="color: rgb(129, 129, 129);">那种忽视正义，滥施恩情的人道主义，有着太多的伪善，他们经常会是为了假想的将来而忽视现在的利益，为了抽象人类而无视具体人的悲苦，对于那些极度邪恶的杀人重案，如果不处以极刑，如何能够抚慰仍存于世上之人的泪水？</span></p><p><br></p><p><span style="color: rgb(129, 129, 129);">法治的根本前提就是对人类内心这种幽暗势力的预设，拥有的权力，越大破坏的能力越强，因此权力要受到法律严格的约束。</span></p><p><br></p><p><span style="color: rgb(129, 129, 129);">法律中的乐观主义曾经相信邪恶是可以改造的，巨大恶极之人只是暂时生病的病人，既然疾病可以医治，那么犯罪的人同样也可以医治，但是再犯率的不断升高，恶性案件的层出不穷，让改造主义成为一种幻梦。</span></p><p><br></p><p><span style="color: rgb(129, 129, 129);">法律无法消灭邪恶，也很难改造邪恶，它只能有限的约束邪恶，避免邪恶的泛滥，如果说在法律中依然要保留改造罪犯的美好设想，那也必须让罪犯受到应得的严厉惩罚。</span></p>', N'', N'草稿', 5, 1, N'2024-06-27 11:46:01.967', N'2024-06-27 11:46:01.967');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'社会性动物摘录', N'', N'', N'已发布', 6, 1, N'2024-06-27 11:46:40.973', N'2024-06-27 11:46:40.973');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'三体简介', N'<p>	军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……</p><p>	四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……</p><p>	人类的末日悄然来临。</p>', N'', N'草稿', 7, 1, N'2024-06-27 11:47:34.173', N'2024-06-27 11:47:34.173');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'脑中的大象', N'<p>	人为什么会笑？</p><p>	为什么我们如此重视教育？</p><p>	为什么《蒙娜丽莎》的复制品仍被当作艺术？</p><p>	我们为什么常常隐藏自己的真实动机？</p><p>	在这些答案的背后，隐藏着哪些心理学、行为学、经济学、社会学原理？</p><p>	人是灵长类动物，灵长类动物是社会动物。因此，我们的大脑不仅为狩猎、采集而设计，它还能帮助我们在社会上取得进步，而这种进步有时候是通过欺骗和自我欺骗实现的。虽然我们可能是自私自利的阴谋家，却又往往能通过伪装而获益。因此，我们会隐藏自己最真实的动机，甚至对此了解得越少越好，比如我们不喜欢谈论，甚至不想谈及我们自私的程度。这就是人类“脑中的大象”。</p><p>	《脑中的大象》旨在帮助我们搜寻人类内心深处未经检视的角落，并用强光灯将其照亮，它将颠覆我们对日常生活中司空见惯的规范、机制、辩论、艺术品的认知，重新审视自己和周围的世界。</p>', N'', N'已发布', 8, 3, N'2024-06-27 12:11:35.023', N'2024-06-27 12:11:35.023');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'第七天摘录', N'<p><span style="color: rgb(129, 129, 129);">我从来没有主动去和她说话，只是愉快地感受着她就在近旁的身影和气息，这是隐藏在心里的愉快，没有人会知道，她也不会知道。……我以正常的目光注视她，认真听完她的话，做出自己的回答。我很享受这样的时刻，可以大大方方欣赏她的美丽容貌。</span></p>', N'', N'草稿', 9, 3, N'2024-06-27 12:13:26.543', N'2024-06-27 12:13:26.547');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'aaa', N'<p>dahuhdsiu</p>', N'', N'已发布', 60, 6, N'2024-06-27 21:45:48.643', N'2024-06-27 21:45:48.643');
INSERT INTO dbo.article ( title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES ( N'bbb', N'', N'', N'草稿', 60, 6, N'2024-06-27 21:47:34.693', N'2024-06-27 21:47:34.693');
