<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
 % #################################################
 % SOURCE :INC_SｋｆAlterLoginCss.jsp
 % TITLE  :社宅代行ログイン状態判定Jsp
 % NOTE   :代行ログイン状態であるかどうかをセッションを参照して判定し、
 %        :代行ログイン状態であれば専用のCSSを適用する。
 % #################################################
--%>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.SkfCommonConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.SessionCacheKeyConstant" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>

<% 
Map<String, Object> menuSesVal = (Map<String, Object>)request.getSession().getAttribute("scopedTarget.menuScopeSessionBean");
String alterLoginFlg = new String();
String alterLoginUserName = new String();
if(menuSesVal != null){
	// 代行ログインフラグ
	if(menuSesVal.get(SessionCacheKeyConstant.ALTER_LOGIN_SESSION_KEY) == null){
		menuSesVal.put(SessionCacheKeyConstant.ALTER_LOGIN_SESSION_KEY, CodeConstant.NONLOGIN);
	}
	alterLoginFlg = (String)menuSesVal.get(SessionCacheKeyConstant.ALTER_LOGIN_SESSION_KEY);
	// 代行ログインユーザ情報Map
	Map<String, String> alterLoginUserInfoMap = (Map<String, String>)menuSesVal.get(SessionCacheKeyConstant.ALTER_LOGIN_USER_INFO_MAP);
	// 代行対象者
	if(alterLoginUserInfoMap != null){
		alterLoginUserName = alterLoginUserInfoMap.get(CodeConstant.ALTER_LOGIN_USER_SHAIN_NAME);
	}
}
%>

<input type="hidden" name="alterLoginFlg" id="alterLoginFlg" value="<%= alterLoginFlg %>"  />

<imart:decision case="<%= alterLoginFlg %>" value="<%= CodeConstant.LOGIN %>">
  <% //代行ログインCSSを読み込み %>
  <link href="styles/skf/AlterLoginTheme.css" rel="stylesheet" type="text/css">
  
  <nfwui:Form id="alterLoginForm" name="alterLoginForm" modelAttribute="form">
  <div id=alterLoginMessage>
  <div style=" font-weight: bold;color:red;">
    代行ログイン中にメニューへ戻る際は右のボタンを利用してください。
    <nfwui:Button id="alterTop" formId="alterLoginForm" value="<%= SkfCommonConstant.HOME_BUTTON %>" cssClass="imui-small-button" url="skf/Skf1010Sc001/Init" />
  </div>
  <div style=" font-weight: bold;color:green;" >代理申請対象【氏名】&nbsp; <%= alterLoginUserName %></div>
  </div>
  </nfwui:Form>
  <script type="text/javascript">
  (function($){
    // 画面表示時に定義される処理
    $(document).ready(function(){
        // 画面状態によって、初期表示時に各領域の表示/非表示を切り替える
        $("[name=daikoHide]").hide();
    });
  })(jQuery);
  </script>
</imart:decision>