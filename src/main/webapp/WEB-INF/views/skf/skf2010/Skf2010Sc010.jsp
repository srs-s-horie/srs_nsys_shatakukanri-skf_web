<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.skf2010.app.skf2010sc010.Skf2010Sc010Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2010Sc010Form form = (Skf2010Sc010Form)request.getAttribute("form"); %>

<style>
.main-area {
  overflow: auto;
  height: 350px;
}
.comment-area {
  padding: 5px 5px;
  margin: 0px 0px;
}

.comment-row {
  height: 60px;
  overflow-y: auto;
}
</style>
<!-- コンテンツエリア -->
<div class="imui-form-container-wide" >
  <nfwui:Title code="<%= MessageIdConstant.SKF2010_SC010_TITLE_LABEL %>" />
  <div class="main-area">

    <c:forEach var="obj" items="${form.commentList}" >
      <div class="imui-form-container-wide comment-area" style="width: 98%; border: none">
        <div class="imui-chapter-title" style="margin-bottom: 10px;">
          <c:if test="${obj.isShouninTitle == 'true' }">
            <h2>${f:h(obj.titleCommentName)}　さんから　承認者　へのコメント</h2>
          </c:if>
          <c:if test="${obj.isShouninTitle == 'false' }">
            <h2>承認者　から　${f:h(obj.applShainName)}　さんへのコメント</h2>
          </c:if>
        </div>
        <table>
          <tr>
            <td colspan="2">
              <table class="imui-form-search-condition" style="width:100%;">
                <tbody>
                <tr>
                  <th  style="width:250px"><nfwui:LabelBox id="lblInputName" code="<%= MessageIdConstant.SKF2010_SC010_INPUT_NAME %>" /></th>
                  <th style="width:200px;"><nfwui:LabelBox id="lblInputDate" code="<%= MessageIdConstant.SKF2010_SC010_INPUT_DATE %>" /></th>
                  <th style="width:150px;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2010_SC010_APPL_STATUS %>" /></th>                                                   
                  <th style="width:500px;"><nfwui:LabelBox id="lblCommentNote" code="<%= MessageIdConstant.SKF2010_SC010_COMMENT_NOTE %>" /></th>
                </tr>
                <tr style="height: 60px;">
                  <td style="text-align:center;">
                    ${obj.commentName}
                  </td>
                  <td style="text-align:center;">
                    ${f:h(obj.commentDate)}
                  </td>
                  <td style="text-align:center;" >
                    ${f:h(obj.applStatus)}
                  </td>
                  <td style="text-align:left;">
                    <div class="comment-row">
                      ${obj.commentNote}
                    </div>
                  </td>
                </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </table>
      </div>
    </c:forEach>
  </div>
</div>

<%-- コンテンツエリア javascript--%>
<script type="text/javascript">
(function($) {
	$(document).ready(function(){
		 // ツールバーの戻るボタンを非表示
		 $(".imui-list-toolbar").hide();
	});
})(jQuery);
</script>
  
