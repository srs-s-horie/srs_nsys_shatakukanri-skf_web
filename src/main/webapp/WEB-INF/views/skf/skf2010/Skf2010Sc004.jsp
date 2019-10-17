<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<%@ page import="jp.co.c_nexco.skf.skf2010.app.skf2010sc004.Skf2010Sc004Form" %>
<%  Skf2010Sc004Form form = (Skf2010Sc004Form)request.getAttribute("form"); %>


<%-- コンテンツエリア --%>
<style type="text/css">
.vertical-top {
	vertical-align:top;
}
</style>

<!-- コンテンツエリア:モックのまま -->
<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
function back1() {
	var url="skf/Skf2010Sc003/Search"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

(function($) {
	$(document).ready(function(){
		// 添付資料のリンクをクリックした時のイベント
		$("a[id^='attached_']").click(function(){
			attachedFileDownload(this);
		});
		
		$("#douiBtn").click(function(){
			skf.common.confirmPopupForCallback("提示内容に同意します。よろしいですか？", "確認", "form", "ok", "キャンセル", this, function(){
				var map = new Object();
				
				map['applNo'] = $("#applNo").val();
				map['applId'] = $("#applId").val();
				map['applStatus'] = $("#applStatus").val();
				map['shainNo'] = $("#hdnShainNo").val();
				map['bihinKibo'] = $("#bihinKibo").val();
				map['taikyobi'] = $("#taikyobi").val();
				map['henkanbi'] = $("#henkanbi").val();
				nfw.common.doAjaxAction("skf/Skf2010Sc004/AgreeAsync", map, true, function(res){
					if (res.dialogFlg) {
						var message = "続けて備品希望申請を行います。よろしいですか？";
						$("#applId").val("<%= FunctionIdConstant.R0104 %>");
						$("#applNo").val(res.bihinApplNo);
						$("#applStatus").val("<%= CodeConstant.STATUS_ICHIJIHOZON %>");
						skf.common.confirmPopup(message, "確認", "form", "skf/Skf2030Sc001/init",  "ok", "キャンセル", this);
					} else {
						skf.common.submitForm("form", "skf/Skf2010Sc003/init", this);
					}
				});
			});
		});
	});
	
	attachedFileDownload = function(obj) {
		var id = $(obj).attr("id");
		var url = "skf/Skf2010Sc004/Download";
		var attachedNo = id.replace(/^attached_/, '');
		
		$("#attachedNo").val(attachedNo);
		$("#form").attr("action", url);
		$("#form").submit();
	}
	
	updateAttachedFileArea = function () {
		var map = new Object();
		map['applNo'] = $("#applNo").val();
		nfw.common.doAjaxAction("skf/Skf2010Sc004/AttachedFileAreaAsync", map, true, function(res){
			$("#attachedFileAreaDiv").html(res.attachedFileArea);
			
			$("a[id^='attached_']").bind("click", function(){
				attachedFileDownload(this);
			});
		});
	}

})(jQuery);
</script>

<!-- コンテンツエリア -->
 <div class="imui-form-container-wide" style="width: 95%;">
   <jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>

    <!-- 状況、資料ヘッダ -->
    <div class="imui-form-container-wide" style="border: currentColor; border-image: none; width: 80%; padding-left: 0px; margin-left: 100px;">
                    <table class="imui-form-search-condition">
                       <tr>
                            <th width="100px"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2010_SC006_LBL_APPL_STATUS %>" /></th>
                            <td width="100px"><label>${f:h(form.applStatusText)}<label></td>
                            <th width="100px"><nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2010_SC006_LBL_ATTACHED_FILE %>" /></th>
                            <td>
                            <div id="attachedFileAreaDiv">
<c:forEach var="obj" items="${form.attachedFileList }">
                            <a id="attached_${f:h(obj.attachedNo)}">${f:h(obj.attachedName)}</a>&nbsp;
</c:forEach>
							</div>
                      </tr>
                    </table>
    </div>

    <!-- コンテンツエリア -->
<imart:condition validity="<%= String.valueOf((form.getDisplayLevel() < 3)) %>"> 
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
       <nfwui:Title id="operationGuide" code="<%= MessageIdConstant.SKF2010_SC004_OPERATION_GUIDE %>" titleLevel="2" />
       <table>
       <tr>
         <td>
${form.operationGuide }
          </td>
        </tr>
        </table>

    </div>
</imart:condition>

    <!-- コンテンツエリア -->
<c:if test="${form.displayLevel == 4}">
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="taikyoTodokeView" >
		  <nfwui:AccordionItem id="taikyoTodokeItem" code="<%= MessageIdConstant.SKF2010_SC004_TAIKYO %>"
		  defaultOpen="${form.level4Open }">
<%@ include file="common/Skf2010TaikyoTodoke.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
        
    </div>


    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="seiyakusyoView" >
		  <nfwui:AccordionItem id="seiyakusyoItem" code="<%= MessageIdConstant.SKF2010_SC004_SEIYAKUSYO %>"
		  defaultOpen="${form.level4Open }">
<%@ include file="common/Skf2010Seiyakusyo.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
	</div>
</c:if>


    <!-- コンテンツエリア -->
<c:if test="${form.displayLevel == 3}">
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="ketteiTsuchiView" >
		  <nfwui:AccordionItem id="ketteiTsuchiItem" code="<%= MessageIdConstant.SKF2010_SC004_KETTEI_TSUCHI %>"
		  defaultOpen="${form.level3Open }">
<%@ include file="common/Skf2010KetteiTsuchi.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
   </div>

<c:if test="${form.carNoInputFlg2 != null}">
   <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="ketteiTsuchiView2" >
		  <nfwui:AccordionItem id="ketteiTsuchiItem2" code="<%= MessageIdConstant.SKF2010_SC004_KETTEI_TSUCHI2 %>"
		  defaultOpen="false">
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
		  <nfwui:AccordionItem id="taiyoAnnaiItem" code="<%= MessageIdConstant.SKF2010_SC004_ANNAI %>"
		  defaultOpen="${form.level2Open }">
<%@ include file="common/Skf2010TaiyoAnnai.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
        
    </div>


    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;">
		<nfwui:Accordion id="seiyakusyoView" >
		  <nfwui:AccordionItem id="seiyakusyoItem" code="<%= MessageIdConstant.SKF2010_SC004_SEIYAKUSYO %>"
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
		  <nfwui:AccordionItem id="nyukyoChoshoTsuchiItem" code="<%= MessageIdConstant.SKF2010_SC004_NYUKYO_CHOSHO %>"
		  defaultOpen="${form.level1Open }">
<%@ include file="common/Skf2010ShatakuNyukyo.jsp" %>
		  </nfwui:AccordionItem>
		</nfwui:Accordion>
    </div>
</c:if>

    <nfwui:Form id="form" name="form"  modelAttribute="form" encType="multipart/form-data">
<c:if test="${form.displayLevel == 2}" >
	<input type="hidden" name="inputAreaVisible" value="true" />
    <!-- 日付け入力エリア -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
      <table class="imui-form-search-condition">
      <tr style="width: 100%; max-width: 1000px;text-align:center;">
        <th><nfwui:LabelBox id="lblNowTaikyoDate" code="<%= MessageIdConstant.SKF2010_SC004_NOW_TAIKYO_DATE %>" /></th>
        <td align="left">
			<nfwui:DateBox id="taikyobi" name="taikyobi" />
        </td>
        <th><nfwui:LabelBox id="lblNewShatakuNyukyo" code="<%= MessageIdConstant.SKF2010_SC004_NEW_SHATAKU_NYUKYO %>" /></th>
        <td align="left">
			<nfwui:DateBox id="nyukyobi" name="nyukyobi" />
        </td>
      </tr>
      <tr style="width: 100%; max-width: 1000px;text-align:center;">
        <th><nfwui:LabelBox id="lblNowCarSpaceHenkan" code="<%= MessageIdConstant.SKF2010_SC004_NOW_CAR_SPACE_HENKAN %>" /></th>
        <td align="left">
          <nfwui:DateBox id="henkanbi" name="henkanbi" />
        </td>
        <th><nfwui:LabelBox id="lblNewCarSpaceStart" code="<%= MessageIdConstant.SKF2010_SC004_NEW_CAR_SPACE_START %>" /></th>
        <td align="left">
          <nfwui:DateBox id="shiyobi" name="shiyobi" />
        </td>
      </tr>
<c:if test="${form.carNoInputFlg2 != null }">
      <tr style="width: 100%; max-width: 1000px;text-align:center;">
        <td style="border: none"></td>
        <td style="border: none"></td>
        <th><nfwui:LabelBox id="lblNewCarSpaceStart2" code="<%= MessageIdConstant.SKF2010_SC004_NEW_CAR_SPACE_START %>" /></th>
        <td align="left">
          <nfwui:DateBox id="shiyobi2" name="shiyobi2" />
        </td>
      </tr>
</c:if>
      <tr>
        <td  style="color: red;border: none;" colspan="4">
                                   ※社宅申請機関と調整した入退居日を入力してください
        </td>
      </tr>
      </table>
    </div>
</c:if>
    
    <!-- コメント欄 -->
    <div class="imui-form-container-wide" width="1000px" style="width: 90%; max-width: 1000px;" height="100px">
        <div class="imui-chapter-title" style="margin-bottom: 10px;">
            <h2>コメント</h2>
        </div>

        <table class="imui-form-search-condition">
            <tr  style="width: 100%; max-width: 1000px;text-align:center;">
                <th style="width: 200px; max-width: 200px;"><label>承認者へのコメント</label></th>
            <td>
                <imui:textArea id="commentNote" name="commentNote" style="height:80px;width:100%;" placeholder="例 添付資料が間違っています。" />
           </td>
           </tr>
        </table>
    </div>

    <br>
      <nfwui:Hidden id="applNo" name="applNo" />
      <nfwui:Hidden id="applId" name="applId" />
      <nfwui:Hidden id="shainNo" name="shainNo" />
      <nfwui:Hidden id="bihinKibo" name="bihinKibo" />
      <nfwui:Hidden id="applStatus" name="applStatus" />
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
          parameter="applNo:applNo,applStatus:applStatus"
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</c:if>
        </div>
          </td>
          <td class="vertical-top" style="vertical-align:top">
        <div class="align-R">
           <!-- 取下げボタン -->
           <nfwui:ConfirmButton id="cancelBtn" name="cancelBtn" value="取下げ" 
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2002 %>"
           url="skf/Skf2010Sc004/Cancel" formId="form" removePatterns="PTN_B,PTN_C"
           remove="${form.representBtnFlg }" />
           <!-- 同意するボタン -->
<imart:condition validity="<%= form.getRepresentBtnFlg() %>">
           <imui:button id="douiBtn" value="同意する" class="imui-medium-button" style="width: 150px" />
</imart:condition>
           <!-- 同意しないボタン -->
           <nfwui:ConfirmButton id="douiShinaiBtn" name="douiShinaiBtn" value="同意しない"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           title="<%= MessageIdConstant.SKF2010_SC006_CONFIRM_TITLE %>" message="<%= MessageIdConstant.I_SKF_2013 %>"
           url="skf/Skf2010Sc004/NotAgree" formId="form" removePatterns="PTN_A,PTN_C" />
        </div>
          </td>
        </tr>
      </table>
    </div>
    </nfwui:Form>
	<!-- コンテンツエリア　ここまで -->