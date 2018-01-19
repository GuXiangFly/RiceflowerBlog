版本变迁
====
此项目原为 SSM 项目 现在更改为 springboot + mybatis + Angularjs 的项目
原有SSM 项目 迁移到 Version1.0  ![点击查看](https://github.com/GuXiangFly/RiceflowerBlog/tree/version1.0)

1简介
=====


1.1编写目标
-----------

设计出一套具体的个人博客网站，实现博文的分享与管理，项目的介绍与共享。主要实现以下内容：

访客： 阅读博文；评论博文；对博主留言；关注博主；发私信点赞与打赏。

博主：
博文发表、编辑、删除与浏览；博文分类、归档；博文评论管理；留言管理；个人信息维护；对其他博主关注。

管理员：用户管理；博文管理并可以推荐博文；自动实现敏感信息过滤。

**用例视图：**

博主视图：  

![这里写图片描述](http://img.blog.csdn.net/20170509222530253?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
  
访客视图：  

![这里写图片描述](http://img.blog.csdn.net/20170509222726379?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
>   访客视图：  

![这里写图片描述](http://img.blog.csdn.net/20170509222759269?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
  
  1.2背景
-------

开发软件名称：个人博客系统

队员：李乾、顾翔、凌迎港

●本项目通过以往学习过的知识，加上课外学到的知识，综合运用，实现个人博客系统的运行。

●该软件系统也结合了其他系统的值得学习的对方。

1.3开发技术
-----------

整个项目后台架构使用的技术是 SpringBoot + mybatis,数据库mysql。

在前端使用的是Angularjs+bootstrap 实现界面简洁优美的响应式布局。使用restful风格+json数据交互
实现前后台功能的分离。

整个网站拥有的功能有，写博客，博客分类，用户评论，友情链接，博主信息管理，其中包括增删改查的操作。

使用了开源的editor.md 插件 ，实现了支持markdown语法的富文本编辑器。

2程序总体设计
=============

2.2个人博客系统流程图
---------------------
![这里写图片描述](http://img.blog.csdn.net/20170509222824923?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
   
2.2程序总体结构
---------------
![这里写图片描述](http://img.blog.csdn.net/20170509222834845?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
  
  3数据库总体设计
===============
![这里写图片描述](http://img.blog.csdn.net/20170509222856252?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
