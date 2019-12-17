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
<%@ page import="jp.co.c_nexco.skf.skf2060.app.skf2060sc001.Skf2060Sc001Form" %>

<%  Skf2060Sc001Form form = (Skf2060Sc001Form)request.getAttribute("form"); %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>


<!-- コンテンツエリア -->
<div style ="width:100%; ">
<nfwui:Form id="form" name="form" modelAttribute="form" encType="multipart/form-data" >
<table align="center" style="width:100%;">
    <tr>
        <td>
            <div class="imui-form-container-wide" style="width:95%;">
                <table>
                    <td class="imui-form-container-wide" style="width:35%; border:none;" >
                       <div class="imui-chapter-title" style="margin-bottom: 10px;" >
                            <h2>借上提示先情報</h2>
                        </div>
                                <table class="imui-form-search-condition">
                                    <tr>
                                        <th >
                                   	    <nobr>
                                        &thinsp;&thinsp;
                                        <nfwui:LabelBox id="presentedNamelbl" code="<%= MessageIdConstant.SKF2060_SC001_PRESENTED_NAME %>" style="float:left" />
                                            <nfwui:PopupButton id="support" name="support" value="支援"
                                            cssClass="imui-small-button" use="popup"
                                            screenUrl="skf/Skf2010Sc001/init"
                                            popupWidth="650" popupHeight="700"
                                            modalMode="true" disabled="${form.supportDisabled}" tabindex="3" />
                                        </nobr>   
                                        </th>
                                        <td colspan="2">
                                        <imui:textbox style="width:95%;" id="presentedName" name="presentedName" value="${f:h(form.presentedName)}" readonly="readonly" tabindex="4" />
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th >
                                            <nfwui:LabelBox id="presentedStatuslbl" code="<%= MessageIdConstant.SKF2060_SC001_PRESENTED_STATUS %>" style="float:left" />
                                            
                                        </th>
                                        <td colspan="2">
                                        ${f:h(form.presentedStatus)}
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th >
                                            <nfwui:LabelBox id="presentedDatelbl" code="<%= MessageIdConstant.SKF2060_SC001_PRESENTED_DATE %>" style="float:left" />
                                            
                                        </th>
                                        <td colspan="2">
                                        ${f:h(form.presentedDate)}
                                        </td>
                                    </tr>   

                                </table>

                    <td class="imui-form-container-wide" style="width: 60%; border:none;" >
                       <div class="imui-chapter-title" style="margin-bottom: 10px;" >
                            <h2>借上候補物件登録</h2>
                        </div>
                            <!--<form id="form" class="target_form mt-10" action="" method="POST">-->
                                <table class="imui-form-search-condition">
                    
                                    <tr>
                                        <th style="width: 17.5%;" colspan="2">
                                            <nfwui:LabelBox id="shatakuNamelbl" code="<%= MessageIdConstant.SKF2060_SC001_SHATAKU_NAME %>" style="float:left" />
                                        </th>
                                        <td>
                                        <imui:textbox style="width:30%;" id="shatakuName" name="shatakuName" value="${form.shatakuName}" class="${form.shatakuNameError}" tabindex="5" />
                                        </td>
                                    </tr>   

                                    <tr>
                                        <th style="width: 7.5%;" rowspan="2">
                                            <nfwui:LabelBox id="shatakuLocationlbl" code="<%= MessageIdConstant.SKF2060_SC001_SHATAKU_LOCATION %>" style="float:left" />
                                        </th>
                                        <th style="width: 10%;">
                                            <nfwui:LabelBox id="postalCdlbl" code="<%= MessageIdConstant.SKF2060_SC001_POSTAL_CD %>" style="float:left" />
                                            
                                        </th>
                                        <td>
                                        <imui:textbox style="width:30%;" id="postalCd" name="postalCd" value="${f:h(form.postalCd)}" class="${form.postalCdError}" tabindex="6" />
                                       <nfwui:Button id="searchAddress" name="searchAddress" formId="form" value="住所検索" cssClass="imui-small-button" url="skf/Skf2060Sc001/searchAddress" tabindex="7" />
                                        </td>

                                   </tr>   

                                    <tr>
                                        <th style="width: 10%;">
                                            <nfwui:LabelBox id="adresslbl" code="<%= MessageIdConstant.SKF2060_SC001_ADRESS %>" style="float:left" />
                                            
                                        </th>
                                        <td>
                                        <imui:textArea style="width:100%;" rows="3" id="address" name="address" value="${f:h(form.address)}" class="${form.addressError}" tabindex="8" /></input>
                                        </td>

                                    </tr>   


                                </table>
                            <!--</form>-->

                         <div class="align-L">	
                             <!--<nfwui:Button id="insert" name="insert" formId="form" value="追加" cssClass="imui-small-button" url="skf/Skf2060Sc001/insertKariage"/>-->
                             <imui:button id="insert" name="insert" value="追加" class="imui-small-button" tabindex="9" />
                         </div>
                         </td>
</table>
</div>

<script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>



<!-- テーブル一覧箇所 -->
<div class="imui-form-container" style="width:95%;">
<!-- 明細＆細目未満 -->
  <!-- 明細部 -->
  <!--<form id="sampleList1">-->
    <div class="imui-chapter-title">
    <h2>借上候補物件一覧</h2></div>
 <script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>
				<div id="listTableArea">
				<nfwui:CheckBoxGroupTag id="teijiVal">
					 <imui:listTable id="kariageCandidateList" process="java" autoEncode="false" autoWidth="true" rowNumbers="true"
						autoResize="true" onCellSelect="onCellSelect"
						multiSelect="false" data="${form.listTableData }"
						style="max-height: 800px" >
						<pager rowNum="30" />
						<cols sortable="false">
						<col name="teiji" caption="提示" width="35" sortable="false" align="center" />
						<col name="insertDate" caption="登録日" width="90" sortable="false" />
						<col name="candidateDate" caption="提示日" width="90" sortable="false" />
						<col name="shatakuName" caption="借上社宅名" width="150" sortable="false" wrap="true" />
						<col name="address" caption="社宅所在地" width="250" sortable="false" wrap="true" />
						<col name="attachedName" caption="添付ファイル"　width="150" sortable="false" />
						<col name="attachedFile" caption="ファイルの添付/削除" width="100" sortable="false" align="center" >
						<showIcon iconClass="im-ui-icon-common-16-attachment" />
						</col>
						<col name="deleteBukken" caption="物件削除" width="50" sortable="false" align="center" />
						<col name="companyCd" caption="会社コード" hidden="true" />
						<col name="candidateNo" caption="借上候補物件番号" hidden="true" />
						<col name="lastUpdateDate" caption="更新日時" hidden="true" />
						</cols>
					</imui:listTable> 
				</nfwui:CheckBoxGroupTag>
				</div>
<br>
  <!--</form> -->


<div class="align-R">
<!--<input type='button' value='複製' class='imui-small-button' onclick="" style="width:100px">-->
</div>

</div>

    <!-- コメント欄 -->
    <div class="imui-form-container-wide" style="width:95%;">
        <div class="imui-chapter-title" style="margin-bottom: 10px;">
            <h2>コメント</h2>
        </div>

        <table class="imui-form-search-condition">
            <tr  >
                <th style="width: 20%"><nfwui:LabelBox id="applicantCommentlbl" code="<%= MessageIdConstant.SKF2060_SC001_APPLICANT_COMMENT %>" style="float:left" /></th>
            <td>
            	<imui:textArea style="width:100%;" rows="3" id="comment" name="comment" value="${f:h(form.comment)}" placeholder="例 物件の再提示を行います。" tabindex="10" />
           </td>
           </tr>
        </table>
        <br>
        <div class="align-L float-L">
      <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="11" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="550"
          parameter="applNo:applNo" formId="form"
          screenUrl="skf/Skf2010Sc010/init" use="popup" tabindex="12" />
</imart:condition>
</div> 



<div class="align-R">
     <nfwui:ConfirmButton style="width:150px;" id="download" name="download" value="CSV出力"  formId="form" cssClass="imui-medium-button" 
     					title="<%=MessageIdConstant.SKF2060_SC001_CONFIRM_TITLE %>" message="<%=MessageIdConstant.I_SKF_2008 %>" url="skf/Skf2060Sc001/download" tabindex="13" />
      <imui:button style="width:150px;" id="candidate" name="candidate" value="提示" class="imui-medium-button" tabindex="14" />
</div> 
    </div>


</div>
</td>
</tr>
</table>

<br>

<!-- 隠し項目 -->
<input type="hidden" name="insertFormName" id="insertFormName" value="presentedName" /> <!-- 支援ポップアップ社員名受け取り用 -->
<input type="hidden" name="callbackFlag" id="callbackFlag" value="true" /> <!-- 支援ポップアップコールバックフラグ -->
<input type="hidden" name="shainNo" id="shainNo" value="${form.shainNo}" /> <!-- 提示対象者の社員番号 -->
<input type="hidden" name="updateDate" id="updateDate" value="${form.updateDate}" /> <!-- 更新日時 -->
<input type="hidden" name="applNo" id="applNo" value="${form.applNo}" />　<!-- 申請書類管理番号 -->
<!-- 隠し項目終わり -->

</nfwui:Form>

　<script type="text/javascript">
    /**
     * 一つ前の画面へ戻る
     */
    function back1() {
    	var url = "skf/Skf2060Sc004/init?SKF2060_SC004&tokenCheck=0";
    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
    }
    
    

</script>

<nfwui:Form id="form2" name="form2" modelAttribute="form">

					<input type="hidden" name="hdnCompanyCd" id="sendCompanyCd" value="" />
					<input type="hidden" name="hdnCandidateNo" id="sendCandidateNo" value="" />
					<input type="hidden" name="hdnAttachedNo" id="sendAttachedNo" value="" />
					<input type="hidden" name="rowId" id="rowId" value="" />

					<script src="scripts/skf/skfCommon.js"></script>
					<script type="text/javascript">
					(function($) {
						//画面表示時
						$(document).ready(function(){
							
							//添付ファイルリンククリック時
							$("a[id^='attached_']").click(function(){
								downloadKariageBukkenFile(this);
								
							});
							
							//ウィンドウリサイズ時
							$(window).bind('resize',function(){
								$('#kariageCandidateList').setGridWidth($('#listTableArea').width(),true);
							}).trigger('resize');
						
						onCellSelect = function(rowId,iCol,cellcontent,e) {
							//削除アイコンクリック時
							if ($(cellcontent).hasClass('im-ui-icon-common-16-trashbox')) {
								// リストテーブル情報取得
								var grid = $("#kariageCandidateList");
								// 行番号から選択した行の情報を取得
								var row = grid.getRowData(rowId);

								// candidateNo:借上候補物件番号
								var candidateNo = row.candidateNo;
								
								$("#sendCandidateNo").val(candidateNo);
								
								var dialogMessage = '<%=MessageIdConstant.I_SKF_3005 %>';
								var dialogTitle = '<%=MessageIdConstant.SKF2060_SC001_CONFIRM_TITLE %>';
								var formId = "form2";
								var url = "skf/Skf2060Sc001/delete";
								
								nfw.common.confirmPopup("削除します。よろしいですか？", "確認", formId, url, "ok", "キャンセル", this, true);
							}
							
							//添付ファイルアイコンクリック時
							if ($(cellcontent).hasClass('im-ui-icon-common-16-attachment')) {
								// リストテーブル情報取得
								var grid = $("#kariageCandidateList");
								// 行番号から選択した行の情報を取得
								var row = grid.getRowData(rowId);
								
								var map = new Object();
								
								// companyCd:会社コード
								var companyCd = row.companyCd;
								// candidateNo:借上候補物件番号
								var candidateNo = row.candidateNo;
								
								$("#sendCompanyCd").val(companyCd);
								$("#sendCandidateNo").val(candidateNo);
								$("#rowId").val(rowId);
								
								map['applId'] = "R0106";
								map['candidateNo'] = candidateNo;
								
								var popupUrl = "skf/Skf2010Sc009/init";
								nfw.common.modelessPopup(popupUrl, null, map, 750, 600);
							}
						}
						});
						//添付資料入力支援ポップアップ画面閉じたとき
						updateAttachedFileArea = function(res) {
							var map = new Object();
							map['candidateNo'] = $("#sendCandidateNo").val();
							
							nfw.common.doAjaxAction("skf/Skf2060Sc001/AttachedAsync", map, true, function(data){
								if(data.attachedFileLink != null){
									var rowId = $("#rowId").val();
									
									// リストテーブル情報取得
									var grid = $("#kariageCandidateList");
									grid.setRowData(rowId, {attachedName:data.attachedFileLink});
									
									//添付ファイルリンククリック時
									$("a[id^='attached_']").bind("click",function(){
										downloadKariageBukkenFile(this);
										
									});
									
								}
							});
						}
						//添付ファイルリンククリック時呼び出し先
						downloadKariageBukkenFile = function(data) {
							//リンクタグのidから借上候補物件番号と添付ファイル番号を取得
							var id = $(data).attr("id");
							var url = "skf/Skf2060Sc001/AttachedDownload";
							var list = id.split('_');
							var candidateNo = list[1];
							var attachedNo = list[2];
							
							$("#sendCandidateNo").val(candidateNo);
							$("#sendAttachedNo").val(attachedNo);
							
							skf.common.submitForm("form2", url, this);
							
						}
						
						$("#insert").click(function(){
							var map = new Object();
							map['shatakuName'] = $("#shatakuName").val();
							map['address'] = $("#address").val();
							
							nfw.common.doAjaxAction("skf/Skf2060Sc001/CheckAsync", map, true, function(data){
								var formId = "form";
								var url = "skf/Skf2060Sc001/insertKariage";
								if(data.dialogFlg){
									var shainName = data.dialogShainName;
									var message = "入力した借上候補物件は"+shainName+"さんに提示し完了しています。登録してもよろしいですか？";
									
									nfw.common.confirmPopup(message, "確認", formId, url, "ok", "キャンセル", this, true);
								}else{
									nfw.common.submitForm(formId, url, this);
								}
									
							});
							
						});
						
						//提示ボタンクリック時
						$("#candidate").click(function(){
							nfw.common.confirmPopup("選択した借上候補物件を提示します。よろしいですか?", "確認", "form", "skf/Skf2060Sc001/Candidate", "ok", "キャンセル", this, true);
						});
						
						//支援ポップアップコールバック時
						shainInfoCallback = function() {
							nfw.common.submitForm("form", "skf/Skf2060Sc001/Support", this);
						}
						
						
					})(jQuery);	
					</script>
</nfwui:Form>

</div>

<!-- コンテンツエリア　ここまで -->