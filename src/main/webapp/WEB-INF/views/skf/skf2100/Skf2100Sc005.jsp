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

<%-- コンテンツエリア --%>
<script type="text/javascript">
	/**
	* メニュー画面へ遷移する。
	*/
	function back1() {
		var backMessage = "前の画面へ戻ります。よろしいですか？";
		nfw.common.confirmPopup(backMessage, "戻る確認", "form", "skf/Skf2100Sc005/prevPage", "OK", "キャンセル", this, true);	
	}

	
	/*
	 * リストテーブルの「備品提示」の文字色を取得する。
	 */
	function onCellStatusAttr(rowId, val, rawObject, cm, rdata) {
		var style;
			
		switch (val) {
		case '申請中':
		case '審査中':
		case '修正依頼':
		case '確認依頼':
		case '承認中':
		case '搬入待ち':
		case '搬入済':
		case '搬出待ち':
		case '搬出済':
			style = 'style="color:green;"';
			break;
		case '承認':
			style = 'style="color:blue;"';
			break;
		case '未作成':
		case '未申請':
			style = 'style="color:red;"';
			break;
		default:
			style = 'style="color:black;"';
			break;
		}
		
		return style;
	}
</script>

<!-- コンテンツエリア -->
<div style="width:100%;">
	<div class="imui-form-container-wide" >
		<div class="imui-chapter-title"><h2>検索条件</h2></div>
		<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">
			<!-- hidden項目 -->
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF2100_SC005 %>" />
			<input type="hidden" id="hdnYearSelect" name="hdnYearSelect" value="${form.hdnYearSelect}" />
			<input type="hidden" id="hdnMonthSelect" name="hdnMonthSelect" value="${form.hdnMonthSelect}" />	
			<input type="hidden" id="hdnContractKbnSelect" name="hdnContractKbnSelect" value="${form.hdnContractKbnSelect}" />
			<input type="hidden" id="hdnSelIdx" name="hdnSelIdx" value="${form.hdnSelIdx}" />
			<input type="hidden" id="hdnChkAkiRouterSelect" name="hdnChkAkiRouterSelect" value="${form.hdnChkAkiRouterSelect}" />
			
			<nfwui:Table use="search">
				<tbody>
					<tr>
						<th style="width:7%;">
							<!-- <label style="width:60px;">年</label> -->
							<nfwui:LabelBox id="lblYear" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_YEAR %>" />
						</th>
						<td style="width:80px;">
							<imui:select id="yearDropdown" name="yearDropdown" width="80" list="${form.yearDropDownList}" tabindex="3" />
						</td>
						<th style="width:6%;">
							<!-- <label style="width:60px;">月</label> -->
							<nfwui:LabelBox id="lblMonth" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_MONTH %>" />
						</th>
						<td style="width:60px">
							<imui:select id="monthDropdown" name="monthDropdown" width="60" list="${form.monthDropDownList}" tabindex="4" />
						</td>
						<th style="width:7%;">
							<!-- <label style="width:60px;">締め処理</label> -->
							<nfwui:LabelBox id="lblBoxShimeshori" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_SHIME_SHORI %>" />
						</th>
						<td style="width:60px;">
							<div>
								<label id="labelShimeShori">${form.labelShimeShori}</label>
							</div>
						</td>
						<th style="width:5%;">
							<!-- <label style="width:60px;">給与連携</label> -->
							<nfwui:LabelBox id="lblBoxPositiveRenkei" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_POSITIVE_RENKEI %>" />
						</th>
						<td style="width:60px;">
							<div>
								<label id="labelPositiveRenkei">${form.labelPositiveRenkei}</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<!-- <label>通しNo</label> -->
							<nfwui:LabelBox id="lblKanriKaisha" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_ROUTER_NO %>" />
						</th>
						<td colspan="3" style="width:220px;">
							<imui:textbox id="txtRouterNo" name="txtRouterNo" style="ime-mode: disabled;width:220px;" oninput="value = value.replace(/[^0-9]+/i,'');"
								type="text" value="${f:h(form.txtRouterNo)}" cssClass="${form.txtRouterNoErr }" maxlength="10" placeholder="例 1" tabindex="5"/>
						</td>
						<th>
							<!-- <label>社員番号</label> -->
							<nfwui:LabelBox id="lblShainNo" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_SHAIN_NO %>" />
						</th>
						<td colspan="3">
							<imui:textbox id="txtShainNo" name="txtShainNo" style="ime-mode: disabled;width:220px;"
								type="text" value="${f:h(form.txtShainNo)}" maxlength="8" placeholder="例 00123456（半角）" tabindex="7"/>
						</td>
						<th style="width:7%;">
							<!-- <label style="width:60px;">契約区分</label> -->
							<nfwui:LabelBox id="lblContractKbn" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_CONTRACT_KBN %>" />
						</th>
						<td >
							<imui:select id="contractKbnDropDown" name="contractKbnDropDown" width="220" list="${form.contractKbnDropDownList}" 
								 tabindex="9" />
						</td>
						<th style="width:10%;">
							<!-- <label style="width:60px;">空きモバイルルーター</label> -->
							<nfwui:LabelBox id="lblAkiRouter" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_AKI_ROUTER %>" />
						</th>
						<td>
							<imui:checkbox id="chkAkiRouter" name="chkAkiRouter" value="1" 
								checked="${form.hdnChkAkiRouterSelect }"  tabindex="12"/>
						</td>
					</tr>
					<tr>
						<th>
							<!-- <label>電話番号</label> -->
							<nfwui:LabelBox id="lblTel" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_TEL %>" />
						</th>
						<td colspan="3" style="width:220px">
							<imui:textbox id="txtTel" name="txtTel" class="ime-off" style="width:220px;" oninput="value = value.replace(/[^0-9-]+/i,'');"
								type="text" value="${f:h(form.txtTel)}" maxlength="13" placeholder="例 000-0000-0000" tabindex="6"/>	
						</td>
						<th>
							<!-- <label>社員名</label> -->
							<nfwui:LabelBox id="lblShainName" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_SHAIN_NAME %>" />
						</th>
						<td colspan="3">
							<imui:textbox id="txtShainName" name="txtShainName" style="width:220px;"
								type="text" value="${f:h(form.txtShainName)}" maxlength="255" placeholder="例 中日本　太郎" tabindex="8"/>	
						</td>
						<th>
							<nfwui:LabelBox id="lblContractEndDate" code="<%=MessageIdConstant.SKF2100_SC005_LABEL_CONTRACT_END_DATE %>" />
						</th>
						<td colspan="3">
							<nfwui:DateBox id="txtContractEndDateFrom" name="txtContractEndDateFrom" value="${f:h(form.txtContractEndDateFrom)}"
							 cssStyle="width:180px" cssClass="${form.txtContractEndDateFromErr }" tabindex="10"/>
							&nbsp;～&nbsp;&nbsp;
							<nfwui:DateBox id="txtContractEndDateTo" name="txtContractEndDateTo" value="${f:h(form.txtContractEndDateTo)}"
							 cssStyle="width:180px" cssClass="${form.txtContractEndDateToErr }" tabindex="11"/>
							
						</td>
					</tr>
				</tbody>
			</nfwui:Table>
			<div class="align-L">
				<imui:button id="search" name="search" value="検索" class="imui-small-button" tabindex="13" />
			</div>
		</div>

		<!-- 明細＆細目未満 -->
		<div class="imui-form-container-wide">
			<!-- 明細部 -->
			<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
			<script type="text/javascript">
			  (function($){
			    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
			  })(jQuery);
			</script>
			<imui:listTable id="mainList" process="jssp" autoWidth="true" shrinkToFit="false" rowNumbers="true" height="320" rowNumWidth="35"
				autoResize="true" onCellSelect="onCellSelect" multiSelect="false" data="${form.searchDataList }"
				style="max-height:1000px;" >
				<pager rowNum="100" />
				<cols sortable="false">
					<col name="col1" caption="詳細" width="80" sortable="false" align="center" tabindex="14">
						<showIcon iconClass="im-ui-icon-common-16-update" align="center" />
					</col>
					<col name="col2" caption="通しNo" width="100" sortable="false" wrap="true" align="left"/>
					<col name="col3" caption="電話番号" width="150" sortable="false" wrap="true" align="left"/>
					<col name="col4" caption="契約区分" width="100" sortable="false" wrap="true" align="center"/>
					<col name="col5" caption="契約終了日" width="100" sortable="false" wrap="true" align="left"/>
					<col name="col6" caption="故障" width="100" sortable="false" wrap="true" align="left"/>
					<col name="col7" caption="社員番号" width="150" sortable="false" wrap="true" align="left"/>
					<col name="col8" caption="社員氏名" width="150" sortable="false" wrap="true" align="left"/>
					<col name="col9" caption="申請状況" width="100" sortable="false" wrap="true" align="center" onCellAttr="onCellStatusAttr"/>
					<col name="col10" caption="貸与日" width="150" sortable="false" wrap="true" align="center"/>
					<col name="col11" caption="返却日" width="150" sortable="false" wrap="true" align="center"/>
					<col name="col12" hidden="true"/>
					<col name="col13" hidden="true"/>
				</cols>
			</imui:listTable>
			<br />
			<div class="align-R">
				<imui:button id="outputKanriDaicho" name="outputKanriDaicho" style="width:200px;" value="モバイルルーター管理簿出力" class="imui-medium-button" tabindex="15"/>
			</div>
		</div>
	</nfwui:Form>
</div>

	<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
			$(".imui-toolbar-icon").removeAttr("onclick");
			$(".imui-toolbar-icon").click(function(e) {
				back1();
			});
		
			$('#chkAkiRouter').bind('click', function(){
				//alert(this.checked);
				if(this.checked){
					// チェックされている
					$("#hdnChkAkiRouterSelect").val("true");
				} else {
					// チェックされていない
					$("#hdnChkAkiRouterSelect").val(null);
				}
			});
			
			/*
			 * 「年」ドロップダウン変更
			 */
			$("#yearDropdown").bind('change', function() {
				changeLabel('skf/Skf2100Sc005/changeYearMonthDropDownAsync');
			});
			
			/*
			 * 「月」ドロップダウン変更
			 */
			$("#monthDropdown").bind('change', function() {
				changeLabel('skf/Skf2100Sc005/changeYearMonthDropDownAsync');
			});
			
			// 契約終了日チェンジ
			$("#txtContractEndDateFrom").bind('change', function() {
				// エラークリア
				$("#txtContractEndDateFrom").removeClass("nfw-validation-error");
			});
			$("#txtContractEndDateTo").bind('change', function() {
				// エラークリア
				$("#txtContractEndDateTo").removeClass("nfw-validation-error");
			});
			/*
			 * 「検索」ボタン押下時
			 */
			$("#search").bind('click', function() {
				$("#hdnYearSelect").val($("#yearDropdown").val());
				$("#hdnMonthSelect").val($("#monthDropdown").val());
				$("#hdnContractKbnSelect").val($("#contractKbnDropDown").val());
				
				nfw.common.submitForm("form", "skf/Skf2100Sc005/search");
			});
			
			/*
			 * 「社宅管理台帳リスト出力」ボタン押下時
			 */
			$("#outputKanriDaicho").bind('click', function() {
				$("#hdnYearSelect").val($("#yearDropdown").val());
				$("#hdnMonthSelect").val($("#monthDropdown").val());
				$("#hdnContractKbnSelect").val($("#contractKbnDropDown").val());
				
				var dialogTitle = '確認';
				var dialogMessage = 'モバイルルーター貸出管理簿リストを出力します。<br />よろしいですか？';
				var url = 'skf/Skf2100Sc005/download';
				
				nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
			});
		
			/*
			 * 「締め処理」、「給与連携」ラベルを変更する。
			 */
			function changeLabel(url) {
				var paramMap = new Object();
				paramMap['hdnAsyncYearSelect'] = $("#yearDropdown").val();
				paramMap['hdnAsyncMonthSelect'] = $("#monthDropdown").val();
				
				nfw.common.doAjaxAction(url, paramMap, true, function(data) {
					document.getElementById('labelShimeShori').innerHTML = data.asyncLabelShimeShori;
					document.getElementById('labelPositiveRenkei').innerHTML = data.asyncLabelPositiveRenkei;
				});
			}
			
			/*
			 * boolean変換
			 */
			 function cnvBoolean(targetVal) {
				var result = typeof(targetVal);
				
				if (result === 'string') {
					if (targetVal === 'true') {
						return true;
					} else {
						return false;
					}
				
				} else if (result === 'boolean') {
					return targetVal;
					 
				} else {
					return false;
				}
			}
		});
		
		/*
		 * リストテーブル選択時
		 * 処理がされるのは、「詳細」アイコン押下時のみ（「貸出管理簿登録」画面へ遷移）
		 */
		onCellSelect = function(rowId, iCol, cellcontent, e) {
			
			if($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
				$("#hdnSelIdx").val(rowId);
				
				var url = "skf/Skf2100Sc005/details";
				nfw.common.submitForm('form', url);
			}
		}
		
	})(jQuery);
	</script>
<!-- コンテンツエリア　ここまで -->