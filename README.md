# AutoLisp实现通过在图中选择文字对图形字体进行更改

## 问题的提出

每次接到一个AutoCad文件，总会遇到文件字体与自己系统里的文字字体不匹配的情况，导致每次都会通过字体设置对话框对不匹配的字体文件一通设置，费时费力。
解决办法

这里采用人机交互操作模式，用户指定图中不能正常显示的文字，通过VisualLisp程序对用户所选文字对应的字体类型的字体文件进行重新设定，从而达到对全图形对应字体进行全面更改。

## 源程序

```
;ctfs.lsp
;选择文字并将文字对应字体格式修改为tssdeng.shx，hztxt.shx字体。
;----------------------------------------------------------
;以下函数采用传统顺序编程指令编写：
(defun ctfs-1 ()  
;设置系统变量：
  (setvar "cmdecho" 0)
  (setvar "blipmode" 0)
 
 ;加载扩展autolisp函数：
 (if (null vlax-dump-object)
     (vl-load-com))

 ;取得需要修改的文字对象：
 (setq sel (entsel "选定要更改的文字:"))
 (setq obj (vlax-ename->vla-object (car sel)))
     ;(prin1 obj))

 ;取得对象属性列表：
 ;(vlax-dump-object obj nil))
 (setq fontstl (vla-get-StyleName obj))
     
  ;设置取得的字体样式为：tssdeng.shx，hztxt.shx两个字体。
 (prompt "\n将把选定文字的对应字体改为“tssdeng.shx,hztxt.shx”……\n")
 (command "-style" ;字体类型修改命令。
      fontstl ;要修改的字体类型名称。
      "tssdeng.shx,hztxt.shx" ;指定字体文件。
      "" ;字体高度。
      "0.7" ;字体宽度因子。
      "" ;文字倾斜角度。
      "" ;是否反向显示。
      "" ;是否颠倒显示。
      "")
   (princ))

;说明：请确保系统字体目录下有tssdeng.shx和hztxt.shx两种字体。
```

AutoLisp语言是Lisp语言的一个分支，能够进行函数式编程，这样会让代码更简洁：

```
;ctfs.lsp
;选择文字并将文字对应字体格式修改为tssdeng.shx，hztxt.shx字体。

;-------------------------------------------------------------
;函数式编程实现：
(defun C:ctfs ()

 ;设置系统变量：
 (setvar "cmdecho" 0)
 (setvar "blipmode" 0)
 
   ;加载扩展autolisp函数：
 (if (null vlax-dump-object)
     (vl-load-com))
   
     ;取得需要修改的文字对象：
 (setq fontstl
    (vla-get-StyleName ;取得文字类型名字。
      (vlax-ename->vla-object ;取得对象。
        (car ;取得对象名字。
          (entsel "选定要更改的文字:"))))) ;用户选取文字。

 ;设置取得的字体样式为：tssdeng.shx，hztxt.shx两个字体。
 (prompt "\n将把选定文字的对应字体改为“tssdeng.shx,hztxt.shx”……\n")
 (command "-style" ;字体类型修改命令。
      fontstl ;要修改的字体类型名称。
      "tssdeng.shx,hztxt.shx" ;指定字体文件。
      "" ;字体高度。
      "0.7" ;字体宽度因子。
      "" ;文字倾斜角度。
      "" ;是否反向显示。
      "" ;是否颠倒显示。
      "")
 (princ))

;说明：请确保系统字体目录下有tssdeng.shx和hztxt.shx两种字体。
```

## 使用方式

1. 首先，将以上任一个源代码保存成文件（ctfs.lsp），可保存在AutoCAD的支持文件目录中或Windows系统“文档”目录中。
2. 然后，在AutoCAD命令行中输入：(load “ctfs.lsp”)。
3. 这样，就可以将”ctfs”做为一个AutoCAD绘图命令使用了。

## 程序中可进一步改进的内容

- 如果选择的不是单行文字（text或dtext命令绘制）而是其它图元对象，将导致错误信息（不影响图形内容）。可通过增加判断——所选图形是否属于文字内容——来解决。

- 如果选择的文字内容是属于多行文字（MText命令绘制），会更改对应字体类型属性内容，但不能更改多行文字对应的书写字体属性。可通过修改多行文字书写字体属性为××或直接更改多行文字书写字体为指定字体来实现。

- 所有更改的字体仅限为tssdeng.shx和hztxt.shx两种字体，未提供对话框给用户灵活选择字体。
