FAQ
===
** 从计算所旧版模板到国科大统一模板的迁移工作，稍微复杂，请务必参看以下链接。**

[使用前必读的问题](https://github.com/xiaoyao9933/UCASthesis/wiki)

What's it?
==========

UCASThesis is a LaTeX thesis template package for University of Chinese Academy of Sciences in order to
make it easy to write thesises for either master or doctor. This template pacagge is derived from the 
ThuThesis.

UCASThesis 是中国科学院大学学位论文 LaTeX 模板，支持硕士、博士论文格式。该模板基于清华大学ThuThesis二次开发。

版权须知
========
Copyright (C) 2005-2013 by Xue Ruini <xueruini@gmail.com>
Copyright (C) 2013-2018 derived by Chaolu <wuchaolu@gmail.com>

This file may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3a
of this license or (at your option) any later version.
The latest version of this license is in:

http://www.latex-project.org/lppl.txt

and version 1.3a or later is part of all distributions of LaTeX
version 2004/10/01 or later.

使用须知(必读！)
========

1. 本模板强烈建议使用texlive 2014或以上版本、MikTex2.9或以上版本编译，biblatex包的版本需要大于等于3.0。***请不要使用CTEX***。
  
  特别注意的是， CTEX 可能由于内置宏包老旧，暂时无法支持 UCASThesis 模板，随之可能会产生"ifxetex","zhnumber.sty not found"等问题。

2. 确定系统中存在fontconfig, xfig，transfig依赖(Mac OSX 系统可尝试通过brew进行安装, 如brew install fontconfig, brew install transfig)。

3. 确保当前系统已安装配置SimSun，SimHei，KaiTi，FangSong字体，如果您使用的是Linux和Mac OSX系统，请自行
以“fc-cache 添加 win 字体”为关键字通过Google搜索解决方案), 或参照[Wiki页面](https://github.com/xiaoyao9933/UCASthesis/wiki)。
备用方案：如果您并不想安装其他字体，而仅使用系统自带的兼容字体（不建议这样做），则可利用以下命令交互式地完成字体配置

    python zhfonts.py

4. 您可以使用各种编辑器环境，但是要确保使用XeLatex方式进行编译。

使用方法
========
1. 如果您使用编辑器IDE环境如TexWorks，Texstudio，Winedt等，请务必将编译方式设置为latexmk方式， 如果没有则设置为xelatex + biber方式。如果以上两种方式都没有，则设置为xelatex + biblatex, 然后在IDE preference里面将 biblatex命令替换为biber。

2. 手动编译示例文档
          
       xelatex main
       biber main
       xelatex main
       xelatex main

3. 自动编译文档(方法1)

       latexmk main.tex

4. 自动编译文档(方法2)

       make thesis

5. 编写自己的论文

       main.tex   主控文档
       data/      论文具体内容
       ref/       参考文献目录
       figures/   图片目录
   

如何获取/升级
=============
1. 如需以git方式获取，git clone https://github.com/xiaoyao9933/UCASthesis
2. 如需直接获取压缩包文件，请下载 https://github.com/xiaoyao9933/UCASthesis/archive/master.zip
3. 从计算所旧版模板到国科大统一模板的迁移工作，稍微复杂，请务必参看 [FAQ](https://github.com/xiaoyao9933/UCASthesis/wiki)。


Makefile Howto (by xiaoyao9933 & edyfox & littleleo)
====================================================
1. 获取帮助文档

   make doc   得到 ucasthesis.pdf，帮助文档，里面有详细的说明。

2. 生成示例文档

   make thesis

3. 生成书脊示例   

   make spine

附录： Makefile 命令详解：

Makefile：

    使用说明：

        make all       等于 make thesis && make spine && make doc；
        make cls       生成模板文件，相当于 make -f thesis.mak cls；
        make thesis    生成论文，相当于 make -f thesis.mak；
        make spine     生成书脊，相当于 make -f spine.mak；
        make doc       生成使用说明书，相当于 make -f doc.mak；
        make clean     表示清除除了 pdf 外的所有中间文件和目标文件；



