<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.skf2010.app.skf2010sc006.Skf2010Sc006Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.SkfCommonConstant" %>
<%  Skf2010Sc006Form form = (Skf2010Sc006Form)request.getAttribute("form"); %>


<%-- コンテンツエリア --%>
<style type="text/css">
.vertical-top {
	vertical-align:top;
}

<imart:decision case="${form.nyukyoDateFlg}" value="<%= SkfCommonConstant.DATE_CHANGE %>">
.nyukyoDateChange {
	color : red;
}
</imart:decision>
<imart:decision case="${form.parkingSDateFlg}" value="<%= SkfCommonConstant.DATE_CHANGE_COM %>">
.parkingDateChange .parkingDateChange2 {
	color : red;
}
</imart:decision>
<imart:decision case="${form.parkingSDateFlg}" value="<%= SkfCommonConstant.DATE_CHANGE %>">
.parkingDateChange {
	color : red;
}
</imart:decision>
<imart:decision case="${form.parkingSDateFlg}" value="<%= SkfCommonConstant.DATE_CHANGE2 %>">
.parkingDateChange2 {
	color : red;
}
</imart:decision>
<imart:decision case="${form.taikyoDateFlg}" value="<%= SkfCommonConstant.DATE_CHANGE %>">
#taikyoKanoDate {
	color : red;
}
</imart:decision>
<imart:decision case="${form.parkingEDateFlg}" value="<%= SkfCommonConstant.NOT_CHANGE %>">
#parkingHenkanDate {
	color : red;
}
</imart:decision>
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
			if (res.attachedFileArea.length > 0) {
				$("#attachedFileAreaDiv").html(res.attachedFileArea);
				
				$("a[id^='attached_']").bind("click", function(){
					attachedFileDownload(this);
				});
			} else {
				$("#attachedFileAreaDiv").remove();
			}
		});
	}
	
	// 「社宅入居希望等調書PDF出力」ボタン押下時のイベント
    onClickOutputPdfR0100= function () {
        nfw.common.submitForm("form", "skf/Skf2010Sc006/OutputPdfR0100");
    }
	
	// 「貸与（予定）社宅等のご案内PDF出力」ボタン押下時のイベント
    onClickputPdfR0101 = function () {
    	nfw.common.submitForm("form", "skf/Skf2010Sc006/OutputPdfR0101");
    }

});
</script>

<!-- コンテンツエリア -->
 <div class="imui-form-container-wide" style="width: 90%;">

    <!-- 状況、資料ヘッダ -->
    <div class="imui-form-container-wide" style="width: 90%; max-width: 1000px;border:none;" height="100px">
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

<c:if test="${form.displayLevel == 4}">
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
       <nfwui:Accordion id="taikyoTodokeView" >
		  <nfwui:AccordionItem id="taikyoTodokeItem" code="<%= MessageIdConstant.SKF2010_SC004_TAIKYO %>"
		  defaultOpen="${form.level4Open }">
<%@ include file="common/Skf2010TaikyoTodoke.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
        
    </div>
</c:if>
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
		  defaultOpen="${form.level3Open }">
<%@ include file="common/Skf2010KetteiTsuchi2.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
   </div>
</c:if>

</c:if>


    <!-- コンテンツエリア -->
<c:if test="${form.displayLevel >= 2 and form.displayLevel != 4}">
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

<c:if test="${form.displayLevel != 4 }" >
    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="nyukyoChoshoTsuchiView" >
		  <nfwui:AccordionItem id="nyukyoChoshoTsuchiItem" code="<%= MessageIdConstant.SKF2010_SC006_NYUKYO_CHOSHO %>"
		  defaultOpen="${form.level1Open }">
<%@ include file="common/Skf2010ShatakuNyukyo.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
    </div>
</c:if>

    <nfwui:Form id="form" name="form"  modelAttribute="form" encType="multipart/form-data">

<imart:condition validity="<%= String.valueOf(form.isCommentAreaVisibled()) %>">     
    <!-- コメント欄 -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
        <div class="imui-chapter-title" style="margin-bottom: 10px;">
            <h2>コメント</h2>
        </div>

        <table class="imui-form-search-condition">
            <tr  style="width: 100%; max-width: 1000px;text-align:center;">
                <th style="width: 200px; max-width: 200px;"><label>申請者へのコメント</label></th>
            <td>
                <imui:textArea id="commentNote" name="commentNote" style="height:50px;width:100%;" placeholder="例 添付資料が間違っています。" value="${form.commentNote }" />
           </td>
           </tr>
        </table>
    </div>
</imart:condition>
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
<c:if test="${form.displayLevel != 4}" >          
          <nfwui:Button id="outputNyukyoBtn" name="outputNyukyoBtn" value="社宅入居希望等調書PDF出力" 
          cssClass="imui-medium-button" url="skf/Skf2010Sc006/OutputPdfR0100" />
<c:if test="${form.displayLevel >= 2}" >
          <nfwui:Button id="outputTaiyoBtn" name="outputTaiyoBtn" value="貸与（予定）社宅等のご案内PDF出力" 
          cssClass="imui-medium-button" url="skf/Skf2010Sc006/OutputPdfR0101" />
</c:if>
<c:if test="${form.displayLevel >= 3}" >
          <nfwui:Button id="outputKetteiBtn" name="outputKetteiBtn" value="入居等決定通知書PDF出力" 
          cssClass="imui-medium-button" url="skf/Skf2010Sc006/OutputPdfR0102" />
</c:if>
</c:if>
<c:if test="${form.displayLevel == 4}" >          
          <nfwui:Button id="outputTaikyoBtn" name="outputTaikyoBtn" value="退居（自動車の保管場所返還）届PDF出力" 
          cssClass="imui-medium-button" url="skf/Skf2010Sc006/OutputPdfR0103" />
</c:if>
<c:if test="${form.commentViewFlag == 'true'}">
          <br />
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="488"
          parameter="applNo:applNo"  
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</c:if>
        </div>
          </td>
          <td class="vertical-top" style="vertical-align:top">
        <div class="align-R" style="margin-bottom: 5px;">
           <!-- 修正依頼ボタン -->
           <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn"
           value="修正依頼" cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2005 %>"
           url="skf/Skf2010Sc006/Revision" formId="form"
           remove="${form.revisionRemandBtnFlg }" />
           <!-- 差戻しボタン -->
           <nfwui:ConfirmButton id="sendoutBtn" name="sendoutBtn"
           value="差戻し" cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2010 %>"
           url="skf/Skf2010Sc006/Sendout" formId="form"
           remove="${form.revisionRemandBtnFlg }" />
         </div>
<c:if test="${form.shoninBtnViewFlag == 'true'}">
        <div class="align-R">
           <!-- 再提示ボタン -->
           <nfwui:ConfirmButton id="teijiBtn" name="teijiBtn"
           value="再提示" cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2017 %>"
           url="skf/Skf2010Sc006/Represent" formId="form" removePatterns="NON"
           remove="${form.representBtnFlg }" />
           <!-- 添付ボタン -->
           <nfwui:PopupButton id="shiryoBtn" name="shiryoBtn" value="資料を添付"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           use="popup" popupWidth="790" popupHeight="700"
           parameter="applNo:popApplNo,applId:popApplId" modalMode="true" 
           screenUrl="skf/Skf2010Sc009/init" formId="form" removePatterns="NON" />
           <!-- 承認ボタン -->
           <nfwui:ConfirmButton id="syouninBtn" name="syouninBtn" value="承認"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2006 %>"
           url="skf/Skf2010Sc006/Update" formId="form" removePatterns="NON" disabled="${form.confirmBtnDisabled }" />
</c:if>
        </div>
          </td>
        </tr>
      </table>
    </div>
    </nfwui:Form>
	<!-- コンテンツエリア　ここまで -->