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
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />
<script src="scripts/skf/skfCommon.js"></script>

<style type="text/css">
.ui-jqgrid .ui-jqgrid-bdiv {
  overflow-x:hidden; 
}
</style>
<script type="text/javascript">
// リストテーブルの貸与区分の文字色変更
function onCellAttr(rowId,val,rawObject,cm,rdata){
	  var style;
	  switch (val) {
	  case '設定':
	      style = 'style="color:blue;"';
	      break;
	  case '未設定':
	      style = 'style="color:red;"';
	      break;
	  case '-':
	      style = 'style="color:black;"';
	      break;
	  default:
	      style = 'style="color:green;"';
    break;
	  }
    return style;
}
function onCellAttrNtk(rowId,val,rawObject,cm,rdata){
	  var style;
	  switch (val) {
	  case '承認':
	      style = 'style="color:blue;"';
	      break;
	  case '修正依頼':
	  case '見直し依頼':
	  case '差戻し':
	  case '取下げ':
	      style = 'style="color:red;"';
	      break;
	  case '-':
	      style = 'style="color:black;"';
	      break;
	  default:
	      style = 'style="color:green;"';
  break;
	  }
  return style;
}
</script>
	<!-- コンテンツエリア -->
	<nfwui:Form id="form" name="form" modelAttribute="form">
	<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3021_SC001%>" />
		<input type="hidden" name="backUrl" id="backUrl" value="skf/Skf3021Sc001/init"/>
		
		<input type="hidden" name="teijiListData" id="teijiListData" value="" /><!-- 提示リスト -->
		<input type="hidden" name="mailListData" id="mailListData" value="" /><!-- メール送信リスト -->
		<input type="hidden" name="hdnListSelectState" id="hdnListSelectState" value="" /><!-- リスト選択状態 -->
		<input type="hidden" name="hdnPageMax" id="hdnPageMax" value="${form.listTableMaxRowCount}" /><!-- ページ最大数 -->
		<input type="hidden" name="delShainNo" id="delShainNo" value="" /><!-- 削除パラメータ -->
		<input type="hidden" name="delNyuTaikyoKbn" id="delNyuTaikyoKbn" value="" /><!-- 削除パラメータ -->
		<input type="hidden" name="delApplNo" id="delApplNo" value="" /><!-- 削除パラメータ -->
		<input type="hidden" name="hdnNyutaikyoYoteiUpdateDate" id="hdnNyutaikyoYoteiUpdateDate" value="" /><!-- 削除パラメータ -->
		<input type="hidden" name="hdnTenninshaChoshoUpdateDate" id="hdnTenninshaChoshoUpdateDate" value="" /><!-- 削除パラメータ -->
		<input type="hidden" name="hdnRowShainNo" id="hdnRowShainNo" value="" /><!-- 選択行社員番号 -->
		<input type="hidden" name="hdnRowApplNo" id="hdnRowApplNo" value="" /><!-- 選択行申請書類管理番号 -->
		<input type="hidden" name="hdnRowNyutaikyoKbn" id="hdnRowNyutaikyoKbn" value="" /><!-- 選択行入退居区分 -->
		<div class="imui-form-container-wide" >
			<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<table class="imui-form-search-condition">
					<tbody>
						<tr>
							<th>
<!-- 								<label style="width:60px;">社員番号</label> -->
								<nfwui:LabelBox id="lblShainNo" code="<%=MessageIdConstant.SKF3021_SC001_SHAIN_NUMBER %>" />
							</th>
							<td>
								<imui:textbox id="shainNo" name="shainNo" style="ime-mode: disabled;width:200px;" value="${f:h(form.shainNo)}" placeholder="例　00123456（半角）" maxlength="8" tabindex="3"/>
							</td>
							<th>
<!-- 								<label style="width:60px;">入退居区分</label> -->
								<nfwui:LabelBox id="lblNyutaikyoKbn" code="<%=MessageIdConstant.SKF3021_SC001_NTKYO_KBN %>" />
							</th>
							<td>
								<imui:select id="nyutaikyoKbn" name="nyutaikyoKbn" 
									width="120px" list="${form.nyutaikyoKbnList}" tabindex="5" />
							</td>
							<th>
<!-- 								<label style="width:100px;">入退居申請状況</label> -->
								<nfwui:LabelBox id="lblNyuTaikyoShinseiJokyo" code="<%=MessageIdConstant.SKF3021_SC001_NTKYO_SHINSEI_JOKYO %>" />
							</th>
							<td>
								<imui:select id="nyuTaikyoShinseiJokyo" name="nyuTaikyoShinseiJokyo" 
									width="120px" list="${form.nyuTaikyoShinseiJokyoList}" tabindex="7" />
							</td>
							<th>
<!-- 								<label style="width:80px;">特殊事情</label> -->
								<nfwui:LabelBox id="lblTokushuJijo" code="<%=MessageIdConstant.SKF3021_SC001_TOKUSHUJIJO %>" />
							</th>
							<td colspan="2">
								<imui:select id="tokushuJijo" name="tokushuJijo" 
									width="120px" list="${form.tokushuJijoList}" tabindex="9" />
							</td>
						</tr>
						<tr>
							<th>
<!-- 								<label>社員氏名</label> -->
								<nfwui:LabelBox id="lblShainName" code="<%=MessageIdConstant.SKF3021_SC001_SHAIN_NAME %>" />
							</th>
							<td>
								<imui:textbox id="txtShainName" name="shainName" style="width:200px;" value="${form.shainName}" placeholder="例　中日本　太郎" maxlength="20" tabindex="4"/>
							</td>
							<th>
<!-- 								<label style="width:120px;">提示対象</label> -->
								<nfwui:LabelBox id="lblTeijiDetaSakuseiKubun" code="<%=MessageIdConstant.SKF3021_SC001_TEIJIDATA_KBN %>" />
							</th>
							<td>
								<imui:select id="teijiDetaSakuseiKbn" name="teijiDetaSakuseiKbn" 
									width="120px" list="${form.teijiDetaSakuseiKbnList}" tabindex="6" />
							</td>
							<th>
<!-- 								<label>入退居申請督促</label> -->
								<nfwui:LabelBox id="lblNyuTaikyoShinseiTokusoku" code="<%=MessageIdConstant.SKF3021_SC001_NTKYO_SHINSI_TOKUSOKU %>" />
							</th>
							<td colspan="4">
								<imui:select id="nyuTaikyoShinseiTokusoku" name="nyuTaikyoShinseiTokusoku" 
									width="120px" list="${form.nyuTaikyoShinseiTokusokuList}" tabindex="8" />
							</td>
						</tr>
					</tbody>
				</table>
			<div class="align-L">	
				<nfwui:Button id="search" name="search" code="<%=MessageIdConstant.SKF3021_SC001_BTN_SEARCH %>" cssClass="imui-small-button" 
					url="skf/Skf3021Sc001/search" formId="form" tabindex="10" />
			</div>
		</div>
		<!-- 明細＆細目未満 -->
		<div class="imui-form-container-wide">
			<!-- 明細部 -->
			<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
				<script type="text/javascript">
					(function($){
					$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
					})(jQuery);
				</script>
				<div id="listTableArea">
					<imui:listTable id="mainList" process="jssp" autoEncode="false" autoWidth="true" rowNumbers="true" rowNumWidth="35"
						autoResize="true" onCellSelect="onCellSelect" onGridComplete="gridComplete" height="300"
						multiSelect="true" data="${form.listTableData}"
						onBeforeSelectRow="onBeforeSelectRow" onSelectAll="onSelectAll" tabindex="11">
						<pager rowNum="${form.listTableMaxRowCount }" />
						<cols sortable="false">
						<col name="colChkSelect" caption="提示" hidden="true"/>
						<col name="colNyutaikyoKbn" caption="入退居区分" width="50" sortable="false" align="center" wrap="true"/>
						<col name="colShainNo" caption="社員番号" width="75" sortable="false" align="left" wrap="true"/>
						<col name="colShainName" caption="社員氏名" width="95" sortable="false" align="left" wrap="true"/>
						<col name="colSinseiKbn" caption="申請区分"　width="55" sortable="false" align="center" wrap="true"/>
						<col name="colNyukyoDate" caption="入居予定日" width="85" sortable="false" align="center" wrap="true"/>
						<col name="colTaikyoDate" caption="退居予定日"  width="85" sortable="false" align="center" wrap="true"/>
						<col name="colYouto" caption="用途" width="35" sortable="false" align="center" wrap="true"/>
						<col name="colParkingReqest" caption="駐車場希望" width="35" sortable="false" align="center" wrap="true"/>
						<col name="colShinseiJyokyo" caption="申請状況" width="60" sortable="false" align="center" wrap="true" onCellAttr="onCellAttrNtk"/>
						<col name="colmail" caption="メール" width="35" sortable="false" align="center" wrap="true"/>
						<col name="colNtkyoShinseiTokusoku" caption="申請督促" width="85" sortable="false" align="center" wrap="true"/>
						<col name="colTokushuJijo" caption="特殊事情" width="30" sortable="false" align="center" wrap="true" />
						<col name="colTeijiDataKbn" caption="提示対象" width="50" sortable="false" align="center" wrap="true" onCellAttr="onCellAttr"/>
						<col name="colDetail" caption="申請内容" width="35" sortable="false" align="center" >
							<showIcon iconClass="im-smart-icon-common-16-information" />
						</col>
						<col name="colDelete" caption="削除" width="35" sortable="false" align="center" >
							<showIcon iconClass="im-ui-icon-common-16-trashbox" />
						</col>
						<col name="hdnTeijiNo" caption="" hidden="true"/>
						<col name="hdnShainChangeFlg" caption="" hidden="true"/>
						<col name="hdnUpdateDateNtkyo" caption="" hidden="true"/>
						<col name="hdnUpdateDateTenninsha" caption="" hidden="true"/>
						<col name="hdnApplNo" caption="" hidden="true"/>
						<col name="hdnParking1StartDate" caption="" hidden="true"/>
						<col name="hdnParking2StartDate" caption="" hidden="true"/>
						<col name="hdnPreShainNo" caption="" hidden="true"/>
<!-- AS 結合1041対応 -->
						<col name="hdnNowAffiliation" caption="現所属" hidden="true"/>
						<col name="hdnNewAffiliation" caption="新所属" hidden="true"/>
<!-- AE 結合1041対応 -->
						<col name="hdnNyutaikyoKbnCd" caption="" hidden="true"/>
						<col name="hdnSinseiKbn" caption="" hidden="true"/>
						<col name="hdnShinseiJyokyo" caption="" hidden="true"/>
						<col name="hdnTeijiDataKbn" caption="" hidden="true"/>
						
						<col name="chkSelect" caption="提示チェックボックス可否" hidden="true"/>
						<col name="chkSelectChecked" caption="提示チェックボックスONOFF" hidden="true"/>
						<col name="chkMailSelect" caption="メールチェックボックス可否" hidden="true"/>
						<col name="hdnSinseiKbn" caption="入退居申請区分" hidden="true"/>
						<col name="hdnShinseiJyokyo" caption="入退居申請状況" hidden="true"/>
						<col name="hdnTokushuJijo" caption="特殊事情" hidden="true"/>
						
						<col name="hdnDeleteText" caption="削除時メッセージ" hidden="true"/>
						</cols>
					</imui:listTable>
				</div>

				<script type="text/javascript">
					(function($) {
						
						//選択行チェック
						onBeforeSelectRow = function(rowId,e) {
							//チェックボックス可かアイコン列がクリックされた場合のみTrueにする
							// リストテーブル情報取得
							var grid = $("#mainList");
							i =  $.jgrid.getCellIndex($(e.target).closest('td')[0]);
							cm = grid.getGridParam('colModel');
							var row = grid.getRowData(rowId);
							//詳細列は照会画面表示
							if(cm[i].name === 'colDetail'){
								var hdnRowShainNo = row.colShainNo;
								var hdnRowApplNo = row.hdnApplNo;
								var hdnRowNyutaikyoKbn = row.hdnNyutaikyoKbnCd;
								$("#hdnRowShainNo").val(hdnRowShainNo);
								$("#hdnRowApplNo").val(hdnRowApplNo);
								$("#hdnRowNyutaikyoKbn").val(hdnRowNyutaikyoKbn);

								document.getElementById('shinseiNaiyo').click();
								return false;
							}
							//削除列は許可
							else if( cm[i].name === 'colDelete'){
								return true;
							}
							else if( cm[i].name === 'colmail'){
								if(row.chkMailSelect == 'true'){
									var prop = $('#mailListCheck').prop('checked');
									if(prop){
										//チェックボックスがONの場合、OFFにする
										$('#mailListCheck').prop('checked',false);
									}
								}
								return false;
							}else if(cm[i].name === 'cb'){
								//チェックボックス選択可のみ許可
								if(row.chkSelect == 'true'){
									//選択不可
									return true;
								}
							}
							//他は選択不可
							return false;
						}
						
						
						onCellSelect = function(rowId,iCol,cellcontent,e) {
							// リストテーブル情報取得
							var grid = $("#mainList");
							// 行番号から選択した行の情報を取得
							var row = grid.getRowData(rowId);

							if ($(cellcontent).hasClass('im-smart-icon-common-16-information')) {
								//連携パラメータ
// 								var hdnRowShainNo = row.colShainNo;
// 								var hdnRowApplNo = row.hdnApplNo;
// 								var hdnRowNyutaikyoKbn = row.hdnNyutaikyoKbnCd;
// 								$("#hdnRowShainNo").val(hdnRowShainNo);
// 								$("#hdnRowApplNo").val(hdnRowApplNo);
// 								$("#hdnRowNyutaikyoKbn").val(hdnRowNyutaikyoKbn);
// 								if(row.chkSelect == 'true'){
// 									$('#mainList').setSelection(rowId,false);
// 								}
// 								document.getElementById('shinseiNaiyo').click();

							}else if($(cellcontent).hasClass('im-ui-icon-common-16-trashbox')) {
									// 削除パラメータ
									var delShainNo = row.colShainNo;
									var delNyuTaikyoKbn = row.hdnNyutaikyoKbnCd;
									var delApplNo = row.hdnApplNo;
									var hdnNyutaikyoYoteiUpdateDate = row.hdnUpdateDateNtkyo;
									var hdnTenninshaChoshoUpdateDate = row.hdnUpdateDateTenninsha;
								
									$("#delShainNo").val(delShainNo);
									$("#delNyuTaikyoKbn").val(delNyuTaikyoKbn);
									$("#delApplNo").val(delApplNo);
									$("#hdnNyutaikyoYoteiUpdateDate").val(hdnNyutaikyoYoteiUpdateDate);
									$("#hdnTenninshaChoshoUpdateDate").val(hdnTenninshaChoshoUpdateDate);
									
									$('#mainList').setSelection(rowId,false);
									
								var dialogTitle = "確認";
								var dialogMessage = row.hdnDeleteText;
								nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", "skf/Skf3021Sc001/delete", "ok", "キャンセル", this, true);

							}
							var prop = $('#allListCheck').prop('checked');
							if(prop){
								//督促チェックボックスがONの場合、OFFにする
								$('#allListCheck').prop('checked',false);
							}
						}
						
						
					})(jQuery);
					
					//提示チェックボックス処理
					function allCheckBoxSelect(e){
						//チェックボックス状態取得
						var prop = $('#allListCheck').prop('checked');
						//リスト選択全解除
						$("#mainList").jqGrid('resetSelection');
						//選択処理状態all
						$('#hdnListSelectState').val("all");
						//選択状態で選択処理
						if(prop){
							var grid = $('#mainList');
							var rows = grid.getRowData(); //get data
							//nfw.common.showReserveMessage("warning", "選択");
							for (var idx in rows) {
								var row = rows[idx];
								var page = $('#mainList').getGridParam('page');
								var pagem = $('#hdnPageMax').val();
								var pagemax =  Number(pagem);
								var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
								if(row.chkSelect == 'true'){
									$('#mainList').setSelection(rowidx,true);
								}
							}
						}
						$('#hdnListSelectState').val("solo");
						
					}
					//メールチェックボックス
					function allMailCheckBoxSelect(e){
						//チェックボックス状態取得
						var prop = $('#mailListCheck').prop('checked');
						//選択状態で選択処理

						var grid = $('#mainList');
						var rows = grid.getRowData(); //get data
						for (var idx in rows) {
							var row = rows[idx];
							var page = $('#mainList').getGridParam('page');
							var pagem = $('#hdnPageMax').val();
							var pagemax =  Number(pagem);
							var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
							var mailCheck = "mailCheck"+rowidx;
							var mailCheckBox = document.getElementById(mailCheck);
							if(row.chkMailSelect == 'true'){
								//選択状態変更
								mailCheckBox.checked = prop;
							}
						}

					}
					 
					//リスト生成後イベント
					 function gridComplete(){
						var grid = $('#mainList');
						var rows = grid.getRowData(); //get data
						for (var idx in rows) {
							var row = rows[idx];
							var page = $('#mainList').getGridParam('page');
							var pagem = $('#hdnPageMax').val();
							var pagemax =  Number(pagem);
							var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
							if(row.chkSelect == 'false'){
								//チェックボックスを非活性にする
								var cbsdis = $("tr#"+rowidx+".jqgrow > td > input.cbox", grid);
								if (cbsdis.length != 0) {
									cbsdis.attr("disabled", true);
						        }
							}
							if(row.chkSelectChecked == 'true'){
								//チェックボックスを選択状態にする
								var cbsdis = $("tr#"+rowidx+".jqgrow > td > input.cbox", grid);
								if (cbsdis.length != 0) {
									cbsdis.attr("checked", true);
						        }
							}
							var mailCheck = "mailCheck"+rowidx;
							var mailCheckBox = document.getElementById(mailCheck);
							if(row.chkMailSelect == 'false'){
								//非活性にする
								mailCheckBox.disabled = true;
							}
							
						}
						

						var $list = $('#mainList');
						// 項目に指定した幅を設定する
						//var $col = $('#mainList_cb');
						//$col[0].style.width = "35px";
						// ヘッダ項目に指定した幅を設定する
						$(".jqgfirstrow > td")[1].style.width = "25px";
						// JqGridの項目の幅情報の上書き.
						var befHtml = $list[0].grid.headers[1].el.innerHTML;
						$list[0].grid.headers[1].el.innerHTML="<span>提示<br /><input type=\"checkbox\" name=\"listCheck\" id=\"allListCheck\" onclick=\"allCheckBoxSelect(event)\"></span>";
						//$list[0].grid.headers[1].el.innerHTML="<div id=\"jqgh_mainList_cb\">督促<input class=\"cbox\" id=\"cb_mainList\" role=\"checkbox\" type=\"checkbox\"></div>";
						$list[0].grid.headers[1].el.style.width="25px";
						$list[0].grid.headers[1].el.style.textAlign = "center";
						$list[0].grid.headers[12].el.innerHTML="<span>メール<br /><input type=\"checkbox\" name=\"mailListCheck\" id=\"mailListCheck\" onclick=\"allMailCheckBoxSelect(event)\"></span>";
						$list[0].grid.headers[12].el.style.textAlign = "center";
						$list[0].grid.headers[3].el.innerText = "入退居\n区分";
						$list[0].grid.headers[6].el.innerText = "申請\n区分";
						$list[0].grid.headers[10].el.innerText = "駐車場\n希望";
						$list[0].grid.headers[11].el.innerText = "申請\n状況";
						$list[0].grid.headers[14].el.innerText = "特殊\n事情";
						$list[0].grid.headers[16].el.innerText = "申請\n内容";
						$list[0].grid.headers[3].el.style.textAlign = "center";
					    $list[0].grid.headers[6].el.style.textAlign = "center";
						$list[0].grid.headers[10].el.style.textAlign = "center";
						$list[0].grid.headers[11].el.style.textAlign = "center";
						$list[0].grid.headers[14].el.style.textAlign = "center";
						$list[0].grid.headers[16].el.style.textAlign = "center";
						$list[0].grid.headers[17].el.style.textAlign = "center";

					};
					

					
					//メール送信情報生成
					function setDunningMailInfo(){
						//選択行
						var chkFlg = false;
						var mailList=[];
						var grid = $('#mainList');
						var rows = grid.getRowData(); //get data
						for (var idx in rows) {
							var row = rows[idx];
							var page = $('#mainList').getGridParam('page');
							var pagem = $('#hdnPageMax').val();
							var pagemax =  Number(pagem);
							var rowidx = Number(idx) + 1 + ((page - 1) * pagemax);
							
							var mailCheck = "mailCheck"+rowidx;
							var mailCheckBox = document.getElementById(mailCheck);
							if(row.chkMailSelect == 'true'){
								//非活性にする
								if(mailCheckBox.checked){
									//選択状態なら
									var tempStr = [];
									var shainNo = row.colShainNo;//社員番号
									var shainName = row.colShainName;//社員名
									var nyutaikyoKbn = row.hdnNyutaikyoKbnCd;//入退居区分
									var nyukyoDate = row.colNyukyoDate;//入居予定日
									var taikyoDate = row.colTaikyoDate//退居予定日
									var updateDateNtkyo = row.hdnUpdateDateNtkyo;//入退居予定更新日時
									
									tempStr.push(shainNo);
									tempStr.push(shainName);
									tempStr.push(nyutaikyoKbn);
									tempStr.push(nyukyoDate);
									tempStr.push(taikyoDate);
									tempStr.push(updateDateNtkyo);
									
									mailList.push(tempStr.join(","));		//配列で格納
									//選択有
									chkFlg=true;
								}
							}
						}
						if(chkFlg==false){
							//選択無しの場合error.skf.e_skf_3017=入退居申請督促の電子メールを送信する社員が選択されていません。
							//nfw.common.showReserveMessage("error", "入退居申請督促の電子メールを送信する社員が選択されていません。");
							var map = new Object();
							map['errCode'] = 'error.skf.e_skf_3017';
							nfw.common.doAjaxAction("skf/Skf3021Sc001/selectErrAsync", map, true, function(data){});
							return false;
						}

						//送信データ設定
						$("#mailListData").val(mailList.join(";"));
						return true;
					};
					//提示情報生成
					function setDunningTeijiInfo(){
						//選択行
						var chkFlg = false;
						var mailList=[];
						var selrows = $('#mainList').getGridParam('selarrrow');
						for (var i = 0; i < selrows.length; i++)
						{
							// 選択行
							var row = $('#mainList').getRowData(selrows[i]);
							
							var tempStr = [];
							var shainNo = row.colShainNo;//社員番号
							var nyutaikyoKbn = row.hdnNyutaikyoKbnCd;//入退居区分
							var shainName = row.colShainName;//社員氏名
							var applKbn = row.hdnSinseiKbn;//申請区分
							var applNo = row.hdnApplNo;//申請書類管理番号
							var taikyoYoteiDate = row.colTaikyoDate.replace(/\//g, "");//退居予定日
							var parking1StartDate = row.hdnParking1StartDate;//駐車場区画１開始日
							var parking2StartDate = row.hdnParking2StartDate;//駐車場区画２開始日
							var hdnUpdateDate = row.hdnUpdateDateNtkyo;//更新日時hidden変数
							/* AS 結合1041対応 */
							var hdnNowAffiliation = row.hdnNowAffiliation;	// 現所属
							var hdnNewAffiliation = row.hdnNewAffiliation;	// 新所属
							/* AE 結合1041対応 */
							//引数がない場合リストに入れない
							if(shainNo == null || shainNo == ""){
								continue;
							}
							if(nyutaikyoKbn == null || nyutaikyoKbn == ""){
								continue;
							}
							
							tempStr.push(shainNo);
							tempStr.push(nyutaikyoKbn);
							tempStr.push(shainName);
							tempStr.push(applKbn);
							tempStr.push(applNo);
							tempStr.push(taikyoYoteiDate);
							tempStr.push(parking1StartDate);
							tempStr.push(parking2StartDate);
							tempStr.push(hdnUpdateDate);
							/* AS 結合1041対応 */
							tempStr.push(hdnNowAffiliation);
							tempStr.push(hdnNewAffiliation);
							/* AE 結合1041対応 */
							
							mailList.push(tempStr.join(","));		//配列で格納
							//選択有
							chkFlg=true;
							
						}
						if(chkFlg==false){
							//選択無しの場合error.skf.e_skf_3018=提示データ作成対象が選択されていません。
							//nfw.common.showReserveMessage("error", "提示データ作成対象が選択されていません。");
							var map = new Object();
							map['errCode'] = 'error.skf.e_skf_3018';
							nfw.common.doAjaxAction("skf/Skf3021Sc001/selectErrAsync", map, true, function(data){});
							return false;
						}
						//送信データ設定
						$("#teijiListData").val(mailList.join(";"));

						return true;
					};
				</script>	
				<script type="text/javascript">
				(function($) {
					// 画面表示時に定義される処理
				    $(document).ready(function(){
				    	//リサイズ時イベント
				    	$(window).bind('resize', function(){
				    		$('#mainList').setGridWidth($('#listTableArea').width(), true);	
				    	}).trigger('resize');
				    				
				    });
					
				})(jQuery);
				</script>


			<br />
			<div class="align-R">
				<nfwui:PopupButton id="shinseiNaiyo" style="visibility:hidden" 
					value="a" cssClass="imui-medium-button" modalMode="true" popupWidth="850" 
					popupHeight="740" parameter="hdnRowShainNo:hdnRowShainNo,hdnRowApplNo:hdnRowApplNo,hdnRowNyutaikyoKbn:hdnRowNyutaikyoKbn" 
					screenUrl="skf/Skf3021Sc002/init" use="popup" />
<!-- 				<input style="width:150px;" type="button" value="空き社宅リスト出力" class="imui-medium-button" onclick=""/> -->
				<nfwui:ConfirmButton id="btnShatakuTeiji" name="btnAkiShatakuList" 
							code="<%=MessageIdConstant.SKF3021_SC001_BTN_AKISHATAKU%>"  
 							cssStyle="width:160px;" cssClass="imui-medium-button" 
							formId="form" 
 							title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>"  
 							message="<%= MessageIdConstant.I_SKF_3067 %>" 
 							url="skf/Skf3021Sc001/akiShatakuListDownload" tabindex="11"/> 
<!-- 				<input style="width:150px;" type="button" value="入退居申請督促" class="imui-medium-button" onclick=""/> -->
				<nfwui:ConfirmButton id="btnNtkyoShinsei" name="btnNtkyoShinsei" 
							code="<%=MessageIdConstant.SKF3021_SC001_BTN_NTKYOSHINSEI%>"  
 							cssStyle="width:160px;" cssClass="imui-medium-button" 
							formId="form" 
 							title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>"  
 							message="<%= MessageIdConstant.I_SKF_3021 %>"  
 							preOnclick="if(!setDunningMailInfo(1)){retrun(false)};" 
 							url="skf/Skf3021Sc001/sendMail" tabindex="12"/> 
<!-- 				<input style="width:160px;" type="button" value="入退居予定リスト出力" class="imui-medium-button" onclick=""/> -->
				<nfwui:ConfirmButton id="btnNtkyoYoteiList" name="btnNtkyoYoteiList" 
							code="<%=MessageIdConstant.SKF3021_SC001_BTN_NTKYOYOTEILIST%>"  
 							cssStyle="width:160px;" cssClass="imui-medium-button" 
							formId="form" 
 							title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>"  
 							message="<%= MessageIdConstant.I_SKF_3066 %>" 
 							url="skf/Skf3021Sc001/nyutaikyoYoteiListDownload" tabindex="13"/> 
<!-- 				<input style="width:150px;" id="createData" type="button" value="提示データ作成" class="imui-medium-button"/> -->
				<nfwui:ConfirmButton id="btnTeijiData" name="btnTeijiData" 
							code="<%=MessageIdConstant.SKF3021_SC001_BTN_TEIJIDATA%>"  
 							cssStyle="width:160px;" cssClass="imui-medium-button" 
							formId="form" 
 							title="<%= MessageIdConstant.SKF2020_SC002_CONFIRM_TITLE %>"  
 							message="<%= MessageIdConstant.I_SKF_3019 %>"  
 							preOnclick="if(!setDunningTeijiInfo()){retrun(false)};" 
 							url="skf/Skf3021Sc001/createTeijiData" tabindex="14"/> 
			</div>
		</div>
	</nfwui:Form>
<!-- コンテンツエリア　ここまで -->