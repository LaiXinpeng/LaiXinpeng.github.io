---
title: hexo的常用命令
date: 2023-10-28 02:42:33
tags: [hexo]
mathjax: true
categories: hexo
---
## 安装、升级
```
npm install hexo -g #安装  
npm update hexo -g #升级  
```
## 基本命令
```hexo init```  
初始化站点，生成一个简单网站所需的各种文件。

```hexo clean == hexo c```   
清除缓存 网页正常情况下可以忽略此条命令

```hexo generate == hexo g```  
生效新增、修改、更新的文件

Hexo 能够监视文件变动并立即重新生成静态文件，在生成时会比对文件的 SHA1 checksum，只有变动的文件才会写入。```hexo generate --watch```

```hexo server == hexo s```  
启动本地网站，可在本地观察网站效果，同时也可以输入```http://localhost:4000/admin```管理文章

```hexo s --draft```  
这个发布时可以预览草稿

```hexo s --debug```  
以调试模式启动本地网站，在此模式下，对文件的更改无需停止网站只需刷新即可看到效果，调试非常方便

```hexo clean && hexo s```  
一次执行两个命令

```hexo deploy == hexo d```  
hexo的一键部署功能，执行此命令即可将网站发布到配置中的仓库地址，执行此命令前需要配置站点配置文件_config.yml

一键本地启动：```hexo clean && hexo g && hexo s```

一键部署：```hexo clean && hexo g && hexo d```

您可执行下列的其中一个命令，让 Hexo 在生成完毕后自动部署网站，两个命令的作用是相同的。
```
hexo generate --deploy
hexo deploy --generate  或 hexo g -d or hexo d -g
```
## 创建和发布文章
```hexo new [layout] <title>```  
新建一篇新文章，会自动按照模板里面的格式创建文章

里面的布局（layout），默认为 post，布局共有三种：
```
post	source/_posts
page	source
draft	source/_drafts
```
#### 发布草稿命令：
```
hexo publish 文章文件名
或者是手动将_drafts目录下的草稿移动到_posts目录下即可发布草稿为正式文章。
```
## PicGO图床快捷键
快捷键为：```ctrl+shift+p```
## Hexo博客头部配置

#### （1）文章置顶
在文章的 Front-Matter 中，使用 ```top: true``` 来实现置顶。

#### （2）自定义样式
如果你想修改主题的样式，推荐将样式代码添加到 ```source/css/_custom``` 目录下的 ```index.styl``` 文件中。这样，当主题更新时，不会覆盖你已经修改了的样式代码。
> 当然，你也可以进行模块化分类：在该目录下新建样式文件，然后通过 @import xxx 语句在同目录下的 index.styl 文件中引入你新建的样式文件。

#### （3）文章左侧目录
启用文章目录后，默认对所有文章页面生效。你可以在 Front-Matter 中，设置 ```toc: false``` 来指定某篇文章不启用该功能。

#### （4）文章业内目录
```@[TOC]( )```这个写到文章页面内任何一个地方即可

#### 更多详细设置，请参考 [hexo-theme-stun](https://theme-stun.github.io/docs/zh-CN/)
