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
		var backMessage = "戻ります。よろしいですか？";
		nfw.common.confirmPopup(backMessage, "戻る確認", "form", "skf/Skf3030Sc001/prevPage", "OK", "キャンセル", this, true);	
	}

	/*
	 * リストテーブルの「社宅提示」の文字色を取得する。
	 */
	function onCellTeijiStsAttr(rowId, val, rawObject, cm, rdata) {
		var style;
			
		switch (val) {
		case '作成中':
		case '作成済':
		case '提示中':
		case '同意済':
			style = 'style="color:green;"';
			break;
		case '承認':
			style = 'style="color:blue;"';
			break;
		case '未申請':
			style = 'style="color:red;"';
			break;
		default:
			style = 'style="color:black;"';
			break;
		}
		
		return style;
	}
	
	/*
	 * リストテーブルの「備品提示」の文字色を取得する。
	 */
	function onCellTeijiBihinAttr(rowId, val, rawObject, cm, rdata) {
		var style;
			
		switch (val) {
		case '作成中':
		case '作成済':
		case '提示中':
		case '同意済':
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
			<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3030_SC001 %>" />
			<input type="hidden" id="hdnCompanyAgencySelect" name="hdnCompanyAgencySelect" value="${form.hdnCompanyAgencySelect}" />
			<input type="hidden" id="hdnAgencySelect" name="hdnAgencySelect" value="${form.hdnAgencySelect}" />
			<input type="hidden" id="hdnYearSelect" name="hdnYearSelect" value="${form.hdnYearSelect}" />
			<input type="hidden" id="hdnMonthSelect" name="hdnMonthSelect" value="${form.hdnMonthSelect}" />	
			<input type="hidden" id="hdnShatakuKbnSelect" name="hdnShatakuKbnSelect" value="${form.hdnShatakuKbnSelect}" />
			<input type="hidden" id="hdnMutualuseSelect" name="hdnMutualuseSelect" value="${form.hdnMutualuseSelect}" />
			<input type="hidden" id="hdnSelIdx" name="hdnSelIdx" value="${form.hdnSelIdx}" />
			
			<nfwui:Table use="search">
				<tbody>
					<tr>
						<th style="width:7%;">
							<!-- <label style="width:60px;">年</label> -->
							<nfwui:LabelBox id="lblYear" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_YEAR %>" />
						</th>
						<td style="width:80px;">
							<imui:select id="yearDropdown" name="yearDropdown" width="80" list="${form.yearDropDownList}" tabindex="3" />
						</td>
						<th style="width:6%;">
							<!-- <label style="width:60px;">月</label> -->
							<nfwui:LabelBox id="lblMonth" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_MONTH %>" />
						</th>
						<td style="width:60px">
							<imui:select id="monthDropdown" name="monthDropdown" width="60" list="${form.monthDropDownList}" tabindex="4" />
						</td>
						<th style="width:7%;">
							<!-- <label style="width:60px;">締め処理</label> -->
							<nfwui:LabelBox id="lblBoxShimeshori" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_SHIME_SHORI %>" />
						</th>
						<td style="width:60px;">
							<div>
								<label id="labelShimeShori">${form.labelShimeShori}</label>
							</div>
						</td>
						<th style="width:5%;">
							<!-- <label style="width:60px;">給与連携</label> -->
							<nfwui:LabelBox id="lblBoxPositiveRenkei" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_POSITIVE_RENKEI %>" />
						</th>
						<td style="width:60px;">
							<div>
								<label id="labelPositiveRenkei">${form.labelPositiveRenkei}</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<!-- <label>管理会社</label> -->
							<nfwui:LabelBox id="lblKanriKaisha" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_KANRI_KAISHA %>" />
						</th>
						<td colspan="3" style="width:220px;">
							<imui:select id="companyAgencyDropdown" name="companyAgencyDropdown" width="220" list="${form.companyAgencyDropDownList}" tabindex="5" />
						</td>
						<th>
							<!-- <label>社員番号</label> -->
							<nfwui:LabelBox id="lblShainNo" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_SHAIN_NO %>" />
						</th>
						<td colspan="3">
							<imui:textbox id="txtShainNo" name="txtShainNo" style="ime-mode: disabled;width:220px;"
								type="text" value="${f:h(form.txtShainNo)}" maxlength="30" placeholder="例 00123456（半角）" tabindex="7"/>
						</td>
						<th style="width:7%;">
							<!-- <label style="width:60px;">社宅名</label> -->
							<nfwui:LabelBox id="lblShatakName" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_SHATAK_NAME %>" />
						</th>
						<td style="width:200px;">
							<imui:textbox id="txtShatakuName" name="txtShatakuName" class="ime-off" style="width:200px;"
								type="text" value="${form.txtShatakuName}" maxlength="255" placeholder="例 社宅名" tabindex="9"/>
						</td>
						<th style="width:0%;">
							<!-- <label style="width:60px;">相互利用</label> -->
							<nfwui:LabelBox id="lblSogoriyo" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_SOGORIYO %>" />
						</th>
						<td>
							<imui:select id="mutualuseDropdown" name="mutualuseDropdown" width="120" list="${form.mutualuseDropDownList}" tabindex="11"/>
						</td>
					</tr>
					<tr>
						<th>
							<!-- <label>管理機関</label> -->
							<nfwui:LabelBox id="lblKanriKikan" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_KANRI_KIKAN %>" />
						</th>
						<td colspan="3" style="width:220px">
							<imui:select id="agencyDropdown" name="agencyDropdown" width="220" list="${form.agencyDropDownList}" 
								disabled="${form.hdnAgencyDisabled}" tabindex="6" />
						</td>
						<th>
							<!-- <label>社員名</label> -->
							<nfwui:LabelBox id="lblShainName" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_SHAIN_NAME %>" />
						</th>
						<td colspan="3">
							<imui:textbox id="txtShainName" name="txtShainName" class="ime-off" style="width:220px;"
								type="text" value="${form.txtShainName}" maxlength="255" placeholder="例 中日本　太郎" tabindex="8"/>	
						</td>
						<th>
							<nfwui:LabelBox id="lblShatakKbn" code="<%=MessageIdConstant.SKF3030_SC001_LABEL_SHATAK_KBN %>" />
						</th>
						<td colspan="3">
							<imui:select id="shatakuKbnDropdown" name="shatakuKbnDropdown" width="120" list="${form.shatakuKbnDropDownList}" tabindex="10" />
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
					<col name="col1" caption="詳細" width="40" sortable="false" align="center" tabindex="14">
						<showIcon iconClass="im-ui-icon-common-16-update" align="center" />
					</col>
					<col name="col2" caption="管理会社" width="115" sortable="false" wrap="true" align="left"/>
					<col name="col3" caption="管理機関" width="115" sortable="false" wrap="true" align="left"/>
					<col name="col4" caption="社宅区分" width="60" sortable="false" wrap="true" align="center"/>
					<col name="col5" caption="社宅名" width="189" sortable="false" wrap="true" align="left"/>
					<col name="col6" caption="部屋番号" width="60" sortable="false" wrap="true" align="left"/>
					<col name="col7" caption="社員番号" width="85" sortable="false" wrap="true" align="left"/>
					<col name="col8" caption="社員氏名" width="100" sortable="false" wrap="true" align="left"/>
					<col name="col9" caption="社宅提示" width="60" sortable="false" wrap="true" align="center" onCellAttr="onCellTeijiStsAttr"/>
					<col name="col10" caption="備品提示" width="60" sortable="false" wrap="true" align="center" onCellAttr="onCellTeijiBihinAttr"/>
					<col name="col11" caption="社宅使用料" width="70" sortable="false" wrap="true" align="right"/>
					<col name="col12" caption="共益費" width="70" sortable="false" wrap="true" align="right"/>
					<col name="col13" caption="駐車場料金" width="70" sortable="false" wrap="true" align="right"/>
					<col name="col14" caption="入居日" width="80" sortable="false" wrap="true" align="center"/>
					<col name="col15" caption="退居日" width="80" sortable="false" wrap="true" align="center"/>
					<col name="col16" caption="管理事業領域" width="115" sortable="false" wrap="true" align="left"/>
					<col name="col17" caption="相互利用" width="60" sortable="false" wrap="true" align="center"/>
					<col name="col18" hidden="true"/>
					<col name="col19" hidden="true"/>
					<col name="col20" hidden="true"/>
					<col name="col21" hidden="true"/>
				</cols>
			</imui:listTable>
			<br />
			<div class="align-R">
				<imui:button id="outputPreMonthCompareData" name="outputPreMonthCompareData" style="width:200px;" value="前月比較確認リスト出力" class="imui-medium-button" tabindex="16"/>
				<imui:button id="outputKanriDaicho" name="outputKanriDaicho" style="width:200px;" value="社宅管理台帳リスト出力" class="imui-medium-button" tabindex="17"/>
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
		
			/*
			 * 「年」ドロップダウン変更
			 */
			$("#yearDropdown").bind('change', function() {
				changeLabel('skf/Skf3030Sc001/changeYearDropDownAsync');
			});
			
			/*
			 * 「月」ドロップダウン変更
			 */
			$("#monthDropdown").bind('change', function() {
				changeLabel('skf/Skf3030Sc001/changeMonthDropDownAsync');
			});
			
			/*
			 * 「管理会社」ドロップダウン変更
			 */
			$("#companyAgencyDropdown").bind('change', function() {
				var paramMap = new Object();
				paramMap['hdnAsyncCompanyAgencySelect'] = $("#companyAgencyDropdown").val();
				
				nfw.common.doAjaxAction('skf/Skf3030Sc001/changeCompanyDropDownAsync', paramMap, true, function(data) {
					$("#agencyDropdown").imuiSelect('replace', data.agencyDropDownList);
					
					var isDisabled = cnvBoolean(data.hdnAsyncAgencyDisabled);
					$("#agencyDropdown").attr('disabled', isDisabled);
				});
			});
			
			/*
			 * 「検索」ボタン押下時
			 */
			$("#search").bind('click', function() {
				$("#hdnYearSelect").val($("#yearDropdown").val());
				$("#hdnMonthSelect").val($("#monthDropdown").val());
				$("#hdnCompanyAgencySelect").val($("#companyAgencyDropdown").val());
				$("#hdnMutualuseSelect").val($("#mutualuseDropdown").val());
				$("#hdnAgencySelect").val($("#agencyDropdown").val());
				$("#hdnShatakuKbnSelect").val($("#shatakuKbnDropdown").val());
				
				nfw.common.submitForm("form", "skf/Skf3030Sc001/search");
			});
			
			/*
			 * 「社宅管理台帳リスト出力」ボタン押下時
			 */
			$("#outputKanriDaicho").bind('click', function() {
				$("#hdnYearSelect").val($("#yearDropdown").val());
				$("#hdnMonthSelect").val($("#monthDropdown").val());
				$("#hdnCompanyAgencySelect").val($("#companyAgencyDropdown").val());
				$("#hdnMutualuseSelect").val($("#mutualuseDropdown").val());
				$("#hdnAgencySelect").val($("#agencyDropdown").val());
				$("#hdnShatakuKbnSelect").val($("#shatakuKbnDropdown").val());
				
				var dialogTitle = '確認';
				var dialogMessage = '社宅管理台帳リストを出力します。<br />出力に20秒～30秒くらいかかります。<br />よろしいですか？';
				var url = 'skf/Skf3030Sc001/downloadRp002';
				
				nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "キャンセル", this, true);
			});
			
			/*
			 * 「前月比較確認リスト出力」ボタン押下時
			 */
			$("#outputPreMonthCompareData").bind('click', function() {
				$("#hdnYearSelect").val($("#yearDropdown").val());
				$("#hdnMonthSelect").val($("#monthDropdown").val());
				$("#hdnCompanyAgencySelect").val($("#companyAgencyDropdown").val());
				$("#hdnMutualuseSelect").val($("#mutualuseDropdown").val());
				$("#hdnAgencySelect").val($("#agencyDropdown").val());
				$("#hdnShatakuKbnSelect").val($("#shatakuKbnDropdown").val());
				
				var dialogTitle = '確認';
				var dialogMessage = '前月比較確認リストを出力します。<br />出力に20秒～30秒くらいかかります。<br />よろしいですか？';
				var url = 'skf/Skf3030Sc001/downloadRp003';
				
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
		 * 処理がされるのは、「詳細」アイコン押下時のみ（「入退去情報登録」画面へ遷移）
		 */
		onCellSelect = function(rowId, iCol, cellcontent, e) {
			
			if($(cellcontent).hasClass('im-ui-icon-common-16-update')) {
				$("#hdnSelIdx").val(rowId);
				
				var url = "skf/Skf3030Sc001/details";
				nfw.common.submitForm('form', url);
			}
		}
		
	})(jQuery);
	</script>
<!-- コンテンツエリア　ここまで -->