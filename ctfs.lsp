;ctfs.lsp
;ѡ�����ֲ������ֶ�Ӧ�����ʽ�޸�Ϊtssdeng.shx��hztxt.shx���塣

;------------------------------------------------------------------------
;���º������ô�ͳ˳����ָ���д��
(defun ctfs-1 ()
  ;����ϵͳ������
  (setvar "cmdecho" 0)
  (setvar "blipmode" 0)
  
  ;������չautolisp������
  (if (null vlax-dump-object) (vl-load-com))

  ;ȡ����Ҫ�޸ĵ����ֶ���
  (setq sel (entsel "ѡ��Ҫ���ĵ�����:"))
  (setq obj (vlax-ename->vla-object (car sel)))
  ;(prin1 obj))
  ;ȡ�ö��������б�
  ;(vlax-dump-object obj nil))
  (setq fontstl (vla-get-StyleName obj))

  ;����ȡ�õ�������ʽΪ��tssdeng.shx��hztxt.shx�������塣
  (prompt "\n����ѡ�����ֵĶ�Ӧ�����Ϊ��tssdeng.shx,hztxt.shx������\n")
  (command "-style" ;���������޸����
	   fontstl ;Ҫ�޸ĵ������������ơ�
	   "tssdeng.shx,hztxt.shx" ;ָ�������ļ���
	   "" ;����߶ȡ�
	   "0.7" ;���������ӡ�
	   "" ;������б�Ƕȡ�
	   "" ;�Ƿ�����ʾ��
	   "" ;�Ƿ�ߵ���ʾ��
	   "")
  (princ))

;-------------------------------------------------------------
;����ʽ���ʵ�֣�
(defun C:ctfs ()
  ;����ϵͳ������
  (setvar "cmdecho" 0)
  (setvar "blipmode" 0)
  
  ;������չautolisp������
  (if (null vlax-dump-object) (vl-load-com))

  ;ȡ����Ҫ�޸ĵ����ֶ���
  (setq fontstl
	 (vla-get-StyleName ;ȡ�������������֡�
	   (vlax-ename->vla-object ;ȡ�ö���
	     (car ;ȡ�ö������֡�
	       (entsel "ѡ��Ҫ���ĵ�����:"))))) ;�û�ѡȡ���֡�

  ;����ȡ�õ�������ʽΪ��tssdeng.shx��hztxt.shx�������塣
  (prompt "\n����ѡ�����ֵĶ�Ӧ�����Ϊ��tssdeng.shx,hztxt.shx������\n")
  (command "-style" ;���������޸����
	   fontstl ;Ҫ�޸ĵ������������ơ�
	   "tssdeng.shx,hztxt.shx" ;ָ�������ļ���
	   "" ;����߶ȡ�
	   "0.7" ;���������ӡ�
	   "" ;������б�Ƕȡ�
	   "" ;�Ƿ�����ʾ��
	   "" ;�Ƿ�ߵ���ʾ��
	   "")
  (princ))


;˵������ȷ��ϵͳ����Ŀ¼����tssdeng.shx��hztxt.shx�������塣