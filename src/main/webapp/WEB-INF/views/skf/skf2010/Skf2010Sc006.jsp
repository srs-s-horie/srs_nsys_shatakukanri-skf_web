<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>


<%-- コンテンツエリア --%>
<style type="text/css">
.vertical-top {
	vertical-align:top;
}
</style>

<!-- コンテンツエリア:モックのまま -->

<script type="text/javascript">
function back1() {
	var url="skf/Skf2010Sc005/init"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

$(function() {
	$(document).ready(function(){
		// 添付資料のリンクをクリックした時のイベント
		$("a[id^='attached_']").click(function(){
			attachedFileDownload(this);
		});
		
	});
	
	attachedFileDownload = function(obj) {
		var id = $(obj).attr("id");
		var url = "skf/Skf2010Sc006/Download";
		var attachedNo = id.replace(/^attached_/, '');
		
		$("#attachedNo").val(attachedNo);
		$("#form").attr("action", url);
		$("#form").submit();
	}
	
	updateAttachedFileArea = function () {
		var map = new Object();
		map['applNo'] = $("#applNo").val();
		nfw.common.doAjaxAction("skf/Skf2010Sc006/AttachedFileAreaAsync", map, true, function(res){
			$("#attachedFileAreaDiv").html(res.attachedFileArea);
			
			$("a[id^='attached_']").bind("click", function(){
				attachedFileDownload(this);
			});
		});
	}

});
</script>

<!-- コンテンツエリア -->
 <div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">

    <!-- 状況、資料ヘッダ -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;border:none;" height="100px">
                    <table class="imui-form-search-condition">
                       <tr>
                            <th width="100px"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2010_SC006_LBL_APPL_STATUS %>" /></th>
                            <td width="100px"><label>${f:h(form.applStatusText)}<label></td>
                            <th width="100px"><nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2010_SC006_LBL_ATTACHED_FILE %>" /></th>
                            <td>
                            <div id="attachedFileAreaDiv">
<c:forEach var="obj" items="${form.attachedFileList }">
                            <a id="attached_${obj.attachedNo}">${obj.attachedName }</a>&nbsp;
</c:forEach>
							</div>
                      </tr>
                    </table>
    </div>



    <!-- コンテンツエリア -->
<c:if test="${form.displayLevel == 3}">
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="ketteiTsuchiView" >
		  <nfwui:AccordionItem id="ketteiTsuchiItem" code="<%= MessageIdConstant.SKF2010_SC006_KETTEI_TSUCHI %>"
		  defaultOpen="${form.level3Open }">
<%@ include file="common/Skf2010KetteiTsuchi.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
   </div>

<c:if test="${form.carNoInputFlg2 != null }">
   <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="ketteiTsuchiView2" >
		  <nfwui:AccordionItem id="ketteiTsuchiItem2" code="<%= MessageIdConstant.SKF2010_SC006_KETTEI_TSUCHI2 %>"
		  defaultOpen="false">
<%@ include file="common/Skf2010KetteiTsuchi2.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
   </div>
</c:if>

</c:if>


    <!-- コンテンツエリア -->
<c:if test="${form.displayLevel >= 2}">
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="taiyoAnnaiView" >
		  <nfwui:AccordionItem id="taiyoAnnaiItem" code="<%= MessageIdConstant.SKF2010_SC006_ANNAI %>"
		  defaultOpen="${form.level2Open }">
<%@ include file="common/Skf2010TaiyoAnnai.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
        
    </div>


    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="seiyakusyoView" >
		  <nfwui:AccordionItem id="seiyakusyoItem" code="<%= MessageIdConstant.SKF2010_SC006_SEIYAKUSYO %>"
		  defaultOpen="${form.level2Open }">
<%@ include file="common/Skf2010Seiyakusyo.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
	</div>
</c:if>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="nyukyoChoshoTsuchiView" >
		  <nfwui:AccordionItem id="nyukyoChoshoTsuchiItem" code="<%= MessageIdConstant.SKF2010_SC006_NYUKYO_CHOSHO %>"
		  defaultOpen="${form.level1Open }">
<%@ include file="common/Skf2010ShatakuNyukyo.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
    </div>


    <nfwui:Form id="form" name="form"  modelAttribute="form" encType="multipart/form-data">

    <!-- コメント欄 -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
        <div class="imui-chapter-title" style="margin-bottom: 10px;">
            <h2>コメント</h2>
        </div>

        <table class="imui-form-search-condition">
            <tr  style="width: 100%; max-width: 1000px;text-align:center;">
                <th style="width: 200px; max-width: 200px;"><label>申請者へのコメント</label></th>
            <td>
                <imui:textArea id="commentNote" name="commentNote" style="height:50px;width:100%;" placeholder="例 添付資料が間違っています。" />
           </td>
           </tr>
        </table>
    </div>

    <br>
      <nfwui:Hidden id="applNo" name="applNo" />
      <nfwui:Hidden id="applId" name="applId" />
      <nfwui:Hidden id="shainNo" name="shainNo" />
      <nfwui:Hidden id="applUpdateDate" name="applUpdateDate" />
      <!-- 添付資料番号 -->
      <input type="hidden" id="attachedNo" name="attachedNo" value="" />
      <table width="100%">
        <tr>
          <td>
        <div class="align-L float-L">
          
          <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
          <input name="doDelRow1" id="doDelRow1" type="button" value="社宅入居希望等調書PDF出力" class="imui-medium-button" onclick="" />
          <input name="doDelRow1" id="doDelRow1" type="button" value="貸与（予定）社宅等のご案内PDF出力" class="imui-medium-button" onclick="" />
          <input name="doDelRow1" id="doDelRow1" type="button" value="入居等決定通知書PDF出力" class="imui-medium-button" onclick="" />
<c:if test="${form.commentViewFlag == 'true'}">
          <br />
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="550"
          parameter="applNo:applNo"
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</c:if>
        </div>
          </td>
          <td class="vertical-top" style="vertical-align:top">
        <div class="align-R">
           <!-- 再提示ボタン -->
           <nfwui:ConfirmButton id="teijiBtn" name="teijiBtn"
           value="再提示" cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2017 %>"
           url="skf/Skf2010Sc006/Represent" formId="form" removePatterns="LV3"
           remove="${form.representBtnFlg }" />
           <!-- 添付ボタン -->
           <nfwui:PopupButton id="shiryoBtn" name="shiryoBtn" value="資料を添付"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           use="popup" popupWidth="750" popupHeight="600"
           parameter="applNo:applNo,applId:applId" modalMode="false" 
           screenUrl="skf/Skf2010Sc009/init" formId="form" removePatterns="LV3"
           callbackFunc="updateAttachedFileArea" />
           <!-- 承認ボタン -->
<c:if test="${form.shoninBtnViewFlag == 'true'}">
           <nfwui:ConfirmButton id="syouninBtn" name="syouninBtn" value="承認"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2006 %>"
           url="skf/Skf2010Sc006/Update" formId="form" removePatterns="LV3" />
</c:if>
        </div>
          </td>
        </tr>
      </table>
    </div>
    </nfwui:Form>
	<!-- コンテンツエリア　ここまで -->