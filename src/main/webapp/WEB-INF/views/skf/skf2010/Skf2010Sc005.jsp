<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<script src="scripts/skf/skfCommon.js"></script>
<link rel="stylesheet" type="text/css" href="styles/skf/listTableStyle.css" />

<script type="text/javascript">
  // リストテーブルの申請状況の文字色変更
  function onCellAttr(rowId,val,rawObject,cm,rdata){
	  var style;
	  switch (val) {
	  case '審査中':
	  case '承認':
	  case '承認中':
	      style = 'style="color:green;"';
	      break;
	  case '修正依頼':
	  case '差戻し':
	      style = 'style="color:red;"';
	      break;	  
	  default:
	      style = 'style="color:blue;"';
      break;
	  }
      return style;
  }

  (function($){
    // 画面表示時に定義される処理
    $(document).ready(function(){
        // 機関ドロップダウン変更時のイベント
        $("#agency").change(function() {
        	var map = new Object();
        	map['agency'] = $("#agency").val();
        	
        	nfw.common.doAjaxAction("skf/Skf2010Sc005/ChangeDropDownAsync", map, true, function(data) {
        		$("#affiliation1").imuiSelect("replace", data.ddlAffiliation1List);
        		$("#affiliation2").imuiSelect("replace", data.ddlAffiliation2List);
        	});
        });
        // 部等ドロップダウン変更時のイベント
        $("#affiliation1").change(function() {
        	var map = new Object();
        	map['agency'] = $("#agency").val();
        	map['affiliation1'] = $("#affiliation1").val();
        	
        	nfw.common.doAjaxAction("skf/Skf2010Sc005/ChangeDropDownAsync", map, true, function(data) {
        		$("#affiliation2").imuiSelect("replace", data.ddlAffiliation2List);
        	});
        });
        
        // 申請状況の「全選択」ボタン押下時のイベント
        $("#allCheck").click(function() {
        	$("input[name='applStatus']").prop("checked", true);
        });
        // 申請状況の「全解除」ボタン押下時のイベント
        $("#allNoCheck").click(function() {
        	$("input[name='applStatus']").prop("checked", false);
        });
        
	    // 「一括承認」ボタン押下時のイベント
	    preUpdateEvent = function () {
	        var ids = $("input[id^='applNo_']:not(:disabled):checkbox:checked");
	        // 承認対象チェック
	        if (ids.length <= 0) {
	        	nfw.common.showReserveMessage("warning", "承認対象がありません");
				return false;
	        }
			var strs = [];
			for( var i=0; i<ids.length; ++i )
			{
				var id = ids[i].id;
				var applNo = id.replace("applNo_", "");
				strs.push(applNo);
			}
			var submitStr = strs.join(",");
			$("#submitApplNo").val(submitStr);
			skf.common.confirmPopup("選択された申請書を一括で承認します。よろしいですか？", 
					"確認", "resultListForm", "skf/Skf2010Sc005/Update", 
					"ok", "キャンセル", this, false);
			
			return true;
	    }
	    
	    $("#supportName").click(function(){
	    	var id = $(this).attr("id");
	    	var formName = id.replace(/^support/g, "").replace(/^[A-Z]/g, function(val) {
	    		return val.toLowerCase();
	    	});
	    	$("#insertFormName").val(formName);
		});


	});
    
    // リストテーブル完成時に実行する関数
    gridComplete = function() {
    	var grid = $("#ltResultListTable");
    	// チェックボックスをカラム名に追加
    	grid[0].grid.headers[3].el.innerHTML = "<input type=\"checkbox\" id=\"allCheckListTable\" />";
    	grid[0].grid.headers[10].el.innerHTML = "承認日/<br />　修正依頼日";
    	grid[0].grid.headers[11].el.innerHTML = "承認者名1／<br />　　修正依頼者名 ";
    	grid[0].grid.headers[12].el.innerHTML = "承認者名2／<br />　　修正依頼者名 ";
    	
    	// カラム名のチェックボックスのセンタリング
    	$("#ltResultListTable_chkBox").css("text-align","center");
    	// リストテーブル全選択チェックのイベントを設定する
    	$("#allCheckListTable").bind('click', function() {
	    	if ($(this).prop("checked") == true) {
	    		// inputタグのidが「applNo_」で始まり、且つ活性状態のもののチェックをTRUEにする
	    		$("input[id^='applNo_']:not(:disabled)").prop("checked", true);
	    	} else {
	    		// inputタグのidが「applNo_」で始まり、且つ活性状態のもののチェックをFALSEにする
	    		$("input[id^='applNo_']:not(:disabled)").prop("checked", false);
	    	}
	    });
    }
    
    // リストテーブルの確認欄のアイコンをクリックした時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {
    	if ($(cellContent).hasClass('im-ui-icon-common-16-document')) {
    		var grid = $("#ltResultListTable");
    		var rowData = grid.getRowData(rowId);
    		
    		var applNo = rowData.applNo;
    		var applStatus = rowData.applStatus;
    		
    		var shainNo = rowData.shainNo;
    		var applId = rowData.applId;
    		var applStatusCd = rowData.applStatusCd;
    		var agreName1 = rowData.agreName1;
    		var agreName2 = rowData.agreName2;
    		
   			var nextPageUrl = "skf/Skf2010Sc005/Transfer";
    		
    		$("#putApplNo").val(applNo);
    		$("#putApplId").val(applId);
    		$("#putShainNo").val(shainNo);
    		$("#putApplStatus").val(applStatusCd);
    		$("#putShonin1").val(agreName1);
    		$("#putShonin2").val(agreName2);
    		
    		nfw.common.submitForm("resultListForm", nextPageUrl);
    		
    	}
    }
    
    
  })(jQuery);

</script>

<style>
#lblApplName, #txtApplDateFrom, #txtAgreDateFrom {
	float: left;
}

.ui-jqgrid .ui-jqgrid-htable th div{
	height: 30px;
    white-space:normal;
}

</style>

<!-- コンテンツエリア -->
<div style="width: 100%;">
		<div class="imui-form-container-wide">
                <table class="imui-form-search-condition">
                <tr>
                    <td style="width: 60%; border: none;background-color: #fdfdff;" >
                     <div style="margin-left: 10px; width: 95%;">
                       <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2010_SC005_SEARCH_TITLE %>" titleLevel="2" />
                            <nfwui:Form id="form" name="form" modelAttribute="form" encType="multipart/form-data">
                             <input type="hidden" id="nyukyoFlag" name="nyukyoFlag" value="false" />
                             <input type="hidden" id="insertFormName" value="" />
                                <table class="imui-form-search-condition" >
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="lblApplDater" code="<%= MessageIdConstant.SKF2010_SC005_APPL_DATER %>" />
                                        </th>
                                        <td colspan="2">
                                            <nfwui:DateBox name="applDateFrom" id="applDateFrom" cssStyle="width:100px" />&nbsp;～&nbsp;<nfwui:DateBox name="applDateTo" id="applDateTo" cssStyle="width:100px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="lblAgreDate" code="<%= MessageIdConstant.SKF2010_SC005_AGRE_DATE %>" />
                                        </th>
                                        <td colspan="2">
                                            <nfwui:DateBox name="agreDateFrom" id="agreDateFrom" cssStyle="width:100px"/>&nbsp;～&nbsp;<nfwui:DateBox name="agreDateTo" id="agreDateTo" cssStyle="width:100px"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2010_SC005_SHOZOKU %>" />
                                        </th>
                                        <td colspan="2">
                                        <nfwui:RadioButtonGroup id="shozokuKikan">
                                        	<nfwui:RadioButton id="shozokuKikanShinsei" name="shozokuKikan" value="<%= CodeConstant.SHOZOKU_SHINSEI %>" label="申請時の所属" />
                                        	&nbsp;<nfwui:RadioButton id="shozokuKikanHatsurei" name="shozokuKikan" value="<%= CodeConstant.SHOZOKU_HATSUREI %>" label="発令後の所属" />
                                        </nfwui:RadioButtonGroup>
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 100px;">
                                            <nfwui:LabelBox id="lblAgencyLabel" code="<%= MessageIdConstant.SKF2010_SC005_AGENCY %>" />
                                        </th>
                                        <td style="width: 150px;" colspan="2">
                                        	<imui:select id="agency" name="agency"
                                        	list="${form.ddlAgencyList}" width="100%" />
                                            
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 100px;">
                                            <nfwui:LabelBox id="lblAffiliation1Label" code="<%= MessageIdConstant.SKF2010_SC005_AFFILIATION1 %>" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                            <imui:select id="affiliation1" name="affiliation1"
                                        	list="${form.ddlAffiliation1List}" width="100%" />
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 100px;">
                                            <nfwui:LabelBox id="lblAffiliation2Label" code="<%= MessageIdConstant.SKF2010_SC005_AFFILIATION2 %>" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                            <imui:select id="affiliation2" name="affiliation2"
                                        	list="${form.ddlAffiliation2List}" width="100%" />
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="lblApplName" code="<%= MessageIdConstant.SKF2010_SC005_APPLICANT_NAME %>" style="float:left" />
                                            &nbsp;&nbsp;
                                            <nfwui:PopupButton id="supportName" name="supportName" value="支援"
                                            cssClass="imui-small-button" use="popup"
                                            screenUrl="skf/Skf2010Sc001/init"
                                            popupWidth="640" popupHeight="800"
                                            modalMode="true" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <imui:textbox id="name" name="name" value="${form.name}" />
                                        </td>
                                    </tr>            
                    
                                    <tr>
                                        <th style="width: 100px;">
                                            <nfwui:LabelBox id="lblApplName2" code="<%= MessageIdConstant.SKF2010_SC005_APPL_NAME %>" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <imui:textbox id="applName" name="applName" value="${form.applName}" placeholder="例 入居" />
                                        </td>
                                    </tr>   
                    
                                    <tr>
                                        <th style="width: 120px;">
                                            <nfwui:LabelBox id="lblAgreementName" code="<%= MessageIdConstant.SKF2010_SC005_AGREEMENT_NAME %>" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <imui:textbox id="agreementName" name="agreementName" value="${form.agreementName}" />
                                        </td>
                                    </tr>   
                    
                                    <tr>
                                        <th style="width: 100px;" rowspan="2">
                                        	<nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2010_SC005_APPL_STATUS %>" />
                                            &nbsp;&nbsp;<imui:button tabindex="19" name="imui-8euruuk15dn9qtq" id="allCheck" value="全選択" class="imui-small-button" align="right"/>&nbsp;&nbsp;<imui:button tabindex="19" name="imui-8euruuk15dn9qtq" id="allNoCheck" value="全解除" class="imui-small-button" align="right"/>
                                        </th>
                                        <td style="width: 190px;" colspan="2" id="applStatusArea" class="${form.applStatusErr}">
                                        	<nfwui:CheckBoxGroupTag id="applStatus">
                                            <table>
                                                <tr style="height: 25px;">
                                                    <td>
                                                    	<nfwui:CheckBox id="applStatus01" name="applStatus"
                                                    	value="01" label="申請中" />
                                                    </td>
                                                    <td>
                                                    	<nfwui:CheckBox id="applStatus10" name="applStatus"
                                                    	value="10" label="審査中" />
                                                    </td>
                                                    <td>
                                                    	<nfwui:CheckBox id="applStatus31" name="applStatus"
                                                    	value="31" label="承認中" />
                                                    </td>
                                                    <td>
                                                     	<nfwui:CheckBox id="applStatus40" name="applStatus"
                                                    	value="40" label="承認" />
                                                    </td>
                                                    <td>
                                                     	<nfwui:CheckBox id="applStatus50" name="applStatus"
                                                    	value="50" label="修正依頼" />
                                                    </td>
                                                </tr>

                                                <tr style="height: 25px;">
                                                    <td>
                                                     	<nfwui:CheckBox id="applStatus99" name="applStatus"
                                                    	value="99" label="差戻し" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus20" name="applStatus"
                                                    	value="20" label="確認依頼" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus22" name="applStatus"
                                                    	value="22" label="同意済" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus21" name="applStatus"
                                                    	value="21" label="同意しない" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus00" name="applStatus"
                                                    	value="00" label="一時保存" />
                                                    </td>
                                                </tr>

                                                <tr style="height: 25px;">
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus23" name="applStatus"
                                                    	value="23" label="搬入待ち" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus24" name="applStatus"
                                                    	value="24" label="搬入済" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus25" name="applStatus"
                                                    	value="25" label="搬出待ち" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus26" name="applStatus"
                                                    	value="26" label="搬出済" />
                                                    </td>
                                                </tr>
                                            </table>
                                            </nfwui:CheckBoxGroupTag>
                                        </td>
                                        
                                    </tr>   
                                </table>
                            </nfwui:Form>
        
                         <div class="align-L">	
                         	<nfwui:Button id="submit" formId="form" value="申請書類を検索" cssClass="imui-medium-button" url="skf/Skf2010Sc005/Search" />
                         </div>
                   </div>

			</td>
            <td style="width: 45%; border: none;background-color: #fdfdff;">
            <!-- 個人に関するお知らせ -->
                <div style="width: 100%; max-height:450px;">
                 <nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF2010_SC005_CONTROL_GUIDE %>" titleLevel="2" />
                <div style="overflow-y:scroll;max-height:375px;height:450px;background-color:#eeeeee;">
                    ${form.operationGuide}
                </div>
				</div>
            </td>
            </tr>
</table>
</div>


<!-- テーブル一覧箇所 -->
<div class="imui-form-container-wide" style="top: 660px;">
<!-- 明細＆細目未満 -->
  <!-- 明細部 -->
  <nfwui:Form id="resultListForm" name="resultListForm" modelAttribute="form" secureToken="false">
    <div class="imui-chapter-title"><h2>検索結果一覧</h2></div>
<input type="hidden" id="putApplNo" name="applNo" value="" />
<input type="hidden" id="putApplId" name="applId" value="" />
<input type="hidden" id="putApplStatus" name="sendApplStatus" value="" />
<input type="hidden" id="putShonin1" name="shonin1" value="" />
<input type="hidden" id="putShonin2" name="shonin2" value="" />
<input type="hidden" id="putShainNo" name="applShainNo" value="" />
<input type="hidden" id="submitApplNo" name="submitApplNo" value="" />
<input type="hidden" name="backUrl" value="skf/Skf2010Sc005/init" />
<input type="hidden" name="prePageId" value="Skf2010Sc005" />
<imui:listTable data="${form.ltResultList}"
id="ltResultListTable" name="ltResultListTable"
autoResize="true" autoWidth="true"
onCellSelect="onCellSelect" rowNumbers="true"
 height="232" onGridComplete="gridComplete"
>
<pager num="30" />
<cols>
  <col name="applId" hidden="true" />
  <col name="applStatusCd" hidden="true" />
  <col name="chkBox" caption="" width="30" align="center" /><!-- チェックボックス -->
  <col name="applStatus" caption="申請状況" width="60" align="center" onCellAttr="onCellAttr" /><!-- 申請状況 -->
  <col name="applNo" caption="申請書番号" width="150" align="left" wrap="true" /><!-- 申請書番号 -->
  <col name="applDate" caption="申請日" width="80" align="center" wrap="true" /><!-- 申請日 -->
  <col name="shainNo" caption="社員番号" width="80" align="left" wrap="true" /><!-- 社員番号 -->
  <col name="name" caption="申請者名" width="110" align="left" wrap="true" /><!-- 申請者名 -->
  <col name="applName" caption="申請書類名" width="200" align="left" wrap="true" /><!-- 申請書類名 -->
  <col name="agreDate" caption="承認日／修正依頼日" width="80" align="center" wrap="true" /><!-- 承認日／修正依頼日 -->
  <col name="agreName1" caption="承認者名1／修正依頼者名 "  width="110" wrap="true" align="left" /><!-- 承認者名1／修正依頼者名 -->
  <col name="agreName2" caption="承認者名2／修正依頼者名"  width="110" wrap="true" align="left" /><!-- 承認者名2／修正依頼者名 -->
  <col name="detail" caption="確認" width="50" align="center">
  
    <showIcon iconClass="im-ui-icon-common-16-document" />
  </col><!-- 確認 -->
</cols>
</imui:listTable>

<br>
  </nfwui:Form>
  
<nfwui:Form id="updateForm" name="updateForm" modelAttribute="form" secureToken="false">
<nfwui:Hidden id="backUrl" name="backUrl" />
          <div class="align-R">
            <imui:button id="update" name="update"
            value="一括承認する" class="imui-medium-button" onclick="preUpdateEvent()" />
        </div>
</nfwui:Form>
  
</div>
 <br><br>
 

<div class="align-R" style="margin-right: 45px; margin-top: -25px;">
  <nfwui:ConfirmButton id="csvDownload" name="csvDownload" value="CSV出力"
    cssStyle="width:150px;" cssClass="imui-medium-button check"
  formId="form" title="<%= MessageIdConstant.SKF2010_SC005_CSV %>" message="<%= MessageIdConstant.I_SKF_2008 %>"
  url="skf/Skf2010Sc005/Download" />
</div> 
</div>