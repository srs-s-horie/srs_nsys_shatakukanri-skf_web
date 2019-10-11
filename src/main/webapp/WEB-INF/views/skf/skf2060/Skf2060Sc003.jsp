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
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>

<%@ page import="jp.co.c_nexco.skf.skf2060.app.skf2060sc003.Skf2060Sc003Form" %>
<%  Skf2060Sc003Form form = (Skf2060Sc003Form)request.getAttribute("form"); %>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
<div style="width:100%;">
    	<!-- コンテンツエリア -->
     		<table class="imui-form-search-condition" style="width:20%; margin-left:2%;">
       			<tr>
         			<th style="width: 50%;">
         				<nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2060_SC003_APPL_STATUS %>" />
         			</th>
         			<td style="width: 50%;">
          				${f:h(form.applStatus)}
      				</td>
        		 </tr>
     		</table>

            <div class="imui-form-container-wide" style="width:95%;">
                <table class="imui-form-search-condition">
                    <td class="imui-form-container-wide" style="width: 50%; border: none;background-color: #fdfdff;" >
                       <nfwui:Title id="candidatePersonInfoTitle" code="<%= MessageIdConstant.SKF2060_SC003_CANDIDATE_PERSON_INFO %>" titleLevel="2" />
                                <table class="imui-form-search-condition">
                                    <tr>
                                        <th style="width: 25%;" rowspan="4">
                                            <nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2060_SC003_SHOZOKU %>" />
                                        </th>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2060_SC003_AGENCY %>" />
                                        </th>
                                        <td colspan="2">
											${f:h(form.agency)}
                                        </td>
                                    </tr>

                                    <tr>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2060_SC003_AFFILIATION1 %>" />
                                        </th>
                                        <td colspan="2">
											${f:h(form.affiliation1)}
                                        </td>
                                    </tr>

                                    <tr>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2060_SC003_AFFILIATION2 %>" />
                                        </th>
                                        <td colspan="2">
											${f:h(form.affiliation2)}
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2060_SC003_TEL %>" />                                       
                                        </th>
                                        <td colspan="2">
											${f:h(form.tel)}
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 25%;" rowspan="4">
                                            <nfwui:LabelBox id="lblCandidate_person" code="<%= MessageIdConstant.SKF2060_SC003_CANDIDATE_PERSON %>" />
                                        </th>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2060_SC003_SHAIN_NO %>" />
                                        </th>
                                        <td colspan="2">
                                            ${f:h(form.shainNo)}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2060_SC003_NAME %>" />
                                        </th>
                                        <td colspan="2">
											${f:h(form.name)}
                                        </td>
                                    </tr>

                                    <tr>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblTokyu" code="<%= MessageIdConstant.SKF2060_SC003_TOKYU %>" />
                                        </th>
                                        <td colspan="2">
											${f:h(form.tokyu)}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 25%;">
                                            <nfwui:LabelBox id="lblGender" code="<%= MessageIdConstant.SKF2060_SC003_GENDER %>" />
                                        </th>
                                        <td colspan="2">
											${f:h(form.gender)}
                                        </td>
                                    </tr>
                                </table>

            <!-- 操作ガイド -->
                <td style="width: 45%; border: none;background-color: #fdfdff;">
                    <div style="overflow-y:scroll; max-height:200px; height:200px; margin-left: 20px; background-color:#eeeeee;">
                        <nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF2060_SC003_OPERATION_GUIDE %>" titleLevel="2" />
                        <div style="margin-left: 20px;">
                            ${form.operationGuide}
                        </div>
                    </div>  
                </td>
</table>
</div>

<!-- テーブル一覧箇所 -->
<div class="imui-form-container" style="width: 95%;">
  <table style="width:100%;">
                                <tr>
                                    <td colspan="2">
                                        <table class="imui-form-search-condition" style="width:100%;">
                                        
                                            <tbody>
                                                <tr>
                                                    <th  style="width:10%;">
                                                    <nfwui:LabelBox id="lblSelect" code="<%= MessageIdConstant.SKF2060_SC003_SELECT %>" />
                                                    </th>
                                                    <th style="width:20%;">
                                                    <nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF2060_SC003_SHATAKU_NAME %>" />
                                                    </th>
                                                    <th style="width:30%;">
                                                    <nfwui:LabelBox id="lblShatakuAddressName" code="<%= MessageIdConstant.SKF2060_SC003_SHATAKU_ADDRESS_NAME %>" />
                                                    </th>
                                                    <th style="width:20%;">
                                                    <nfwui:LabelBox id="lblShatakuAddressName" code="<%= MessageIdConstant.SKF2060_SC003_BIKO %>" />
                                                    </th>
                                                    <th style="width:20%;">
                                                    <nfwui:LabelBox id="lblAttachedFile" code="<%= MessageIdConstant.SKF2060_SC003_ATTACHED_FILE %>" />
                                                    </th>
                                                </tr>
												<c:forEach var="kariageObject" items="${form.kariageTeijiList}">
	                                                <tr>
	                                                    <td style="text-align:center;">
	                                                    <input type="radio" id="radioCandidateNo_${f:h(kariageObject.candidateNo)}" name="radioCandidateNo" value="${f:h(kariageObject.candidateNo)}" tabindex="1" />     
	                                                    </td>
	                                                    <td style="text-align:left;">
	                                                        ${f:h(kariageObject.shatakuName)}
	                                                    </td>
	                                                    <td style="text-align:left;">
	                                                        ${f:h(kariageObject.shatakuNameAddress)}
	                                                    </td>
	                                                    <td style="text-align:left;">
	                                                        ${kariageObject.biko}
	                                                    </td>
	                                                    <td style="text-align:left;">
	                                                        ${kariageObject.attachedFile}
	                                                    </td>
	                                                </tr>
												</c:forEach>                
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>

  </table>
  <br>

  <div class="align-L float-L">
      <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="2" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="550"
          parameter="applNo:applNo" formId="form"
          screenUrl="skf/Skf2010Sc010/init" use="popup" tabindex="1" />
</imart:condition>
</div> 

<div class="align-R float-R">
<imart:condition validity="<%= String.valueOf(form.isButtonViewFlag()) %>" >
    <imui:button style="width:150px;" id="reCandidate" name="reCandidate" value="再提示" class="imui-medium-button" onclick="onClickReCandidate()" tabindex="3" />
    <imui:button style="width:150px;" id="complete" name="complete" value="完了" class="imui-medium-button" onclick="onClickComplete()" tabindex="4" />
	<%-- <nfwui:ConfirmButton style="width:150px;" id="complete" name="complete" value="完了"  formId="form" cssClass="imui-medium-button" 
     					title="<%=MessageIdConstant.SKF2060_SC003_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_1001 %>" url="skf/Skf2060Sc003/Complete" tabindex="4" /> --%>
</imart:condition>
</div> 
<br>
<br>
</div>
</div>

<script type="text/javascript">
    /**
     * 一つ前の画面へ戻る
     */
    function back1() {
    	var url = "skf/Skf2060Sc004/init?SKF2060_SC004&tokenCheck=0";
    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
    }
</script>

<!-- 隠し項目 -->
<!-- 前画面からの値取得用 -->
<input type="hidden" name="applNo" id="applNo" value="${form.applNo}" />　<!-- 申請書類管理番号 -->
<!-- 前画面からの値取得用終わり -->
<!-- 遷移先画面への値送る用 -->
<input type="hidden" name="shainNo" id="shainNo" value="${form.shainNo}" />　<!-- 社員番号 -->
<!-- 遷移先画面への値送る用終わり -->
<input type="hidden" name="checkCandidateNo" id="checkCandidateNo" value="${form.checkCandidateNo}" />　<!-- 選択物件番号 -->
<input type="hidden" name="hdnCandidateNo" id="sendCandidateNo" value="" /><!-- 添付ファイルダウンロード用借上候補物件番号 -->
<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo" value="" /><!-- 添付ファイルダウンロード用添付ファイル番号 -->
<!-- 隠し項目終わり -->

<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
(function($) {		
	$(document).ready(function() {	
		var applStatus = '<%= form.getApplStatus() %>';
		var sentakuZumi = '選択済';
		var sentakuShinai = '選択しない';
		var checkCandidateNo = $("#checkCandidateNo").val();
		//選択物件番号の行のラジオボタンをチェックする
		if(applStatus == sentakuZumi || applStatus == sentakuShinai){
			$("#radioCandidateNo_"+checkCandidateNo).prop('checked', true);
		}
		//ラジオボタンを入力不可能にする
		$("[name=radioCandidateNo]").prop('disabled', true);
	});
	
	//「再提示」ボタンクリック時
    onClickReCandidate = function () {
		var dialogTitle = "確認";
		var dialogMessage = "再提示します。よろしいですか？";
		var url = "skf/Skf2060Sc001/init";
		nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
    }
	
	//「完了」ボタンクリック時
    onClickComplete = function () {
		var dialogTitle = "確認";
		var dialogMessage = "完了された借上候補物件の提示を完了します。よろしいですか？";
		var url = "skf/Skf2060Sc003/complete";
		nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "ok", "キャンセル", this, true);
    }
	
	//添付ファイルリンククリック時
	$("a[id^='attached_']").click(function(){
		downloadKariageBukkenFile(this);
		
	});
	
	//添付ファイルリンククリック時呼び出し先
	downloadKariageBukkenFile = function(data) {
		//リンクタグのidから借上候補物件番号と添付ファイル番号を取得
		var id = $(data).attr("id");
		var list = id.split('_');
		var candidateNo = list[1];
		var attachedNo = list[2];
		var url = "skf/Skf2060Sc003/AttachedDownload";
		
		$("#sendCandidateNo").val(candidateNo);
		$("#sendAttachedNo").val(attachedNo);
		
		skf.common.submitForm("form", url, this);
		
	}
})(jQuery);	

</script>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->