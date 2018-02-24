;ctfs.lsp
;选择文字并将文字对应字体格式修改为tssdeng.shx，hztxt.shx字体。

;------------------------------------------------------------------------
;以下函数采用传统顺序编程指令编写：
(defun ctfs-1 ()
  ;设置系统变量：
  (setvar "cmdecho" 0)
  (setvar "blipmode" 0)
  
  ;加载扩展autolisp函数：
  (if (null vlax-dump-object) (vl-load-com))

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

;-------------------------------------------------------------
;函数式编程实现：
(defun C:ctfs ()
  ;设置系统变量：
  (setvar "cmdecho" 0)
  (setvar "blipmode" 0)
  
  ;加载扩展autolisp函数：
  (if (null vlax-dump-object) (vl-load-com))

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