<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<script src="scripts/skf/skfCommon.js"></script>

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
</script>

<style>
#applName, #txtApplDateFrom, #txtAgreDateFrom {
	float: left;
}
.imui-box-warning .imui-box-caution {
  min-width: 70%;
  position: absolute!important;
  z-index: 1;
  margin-left: 12%;
}
.ui-jqgrid .ui-jqgrid-htable th div{
	height: 34px;
    white-space:normal;
}
</style>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" style="width: 100%; min-width:1350px; max-width: 1350px;">
<table align="center">
    <tr>
        <td>
            <div>
                <table class="imui-form-search-condition" width="100%">
                <tr>
                    <td class="imui-form-container-wide" style="width: 50%; border: none;background-color: #fdfdff;" >
                     <div class="imui-form-container-wide" style="max-width: 650px;min-width: 650px; max-height: 450px; height: 500px;">
                       <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2010_SC005_SEARCH_TITLE %>" titleLevel="2" />
                            <nfwui:Form id="form" name="form" modelAttribute="form" encType="multipart/form-data">
                             <input type="hidden" id="submitApplNo" name="submitApplNo" value="" />
                             <input type="hidden" id="nyukyoFlag" name="nyukyoFlag" value="false" />
                                <table class="imui-form-search-condition" >
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="applDater" code="<%= MessageIdConstant.SKF2010_SC005_APPL_DATER %>" />
                                        </th>
                                        <td colspan="2">
                                            <imui:textbox name="applDateFrom" id="applDateFrom" value="${form.applDateFrom}" class="${form.applDateFromErr}" style="width:100px" />&nbsp;～&nbsp;<imui:textbox name="applDateTo" id="applDateTo" value="${form.applDateTo}" style="width:100px" class="${form.applDateToErr}" />
                                        </td>
                                    </tr>
                                    <im:calendar floatable="true" altField="#applDateFrom" />
                                    <im:calendar floatable="true" altField="#applDateTo" />
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="agreDate" code="<%= MessageIdConstant.SKF2010_SC005_AGRE_DATE %>" />
                                        </th>
                                        <td colspan="2">
                                            <imui:textbox name="agreDateFrom" id="agreDateFrom" value="${form.agreDateFrom}" style="width:100px" class="${form.agreDateFromErr}"/>&nbsp;～&nbsp;<imui:textbox name="agreDateTo" id="agreDateTo" value="${form.agreDateTo}" class="${form.agreDateToErr}" style="width:100px"/>
                                        </td>
                                    </tr>
                    				<im:calendar floatable="true" altField="#agreDateFrom" />
                                    <im:calendar floatable="true" altField="#agreDateTo" />
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="shozoku" code="<%= MessageIdConstant.SKF2010_SC005_SHOZOKU %>" />
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
                                            <nfwui:LabelBox id="agencyLabel" code="<%= MessageIdConstant.SKF2010_SC005_AGENCY %>" />
                                        </th>
                                        <td style="width: 150px;" colspan="2">
                                        	<imui:select id="agency" name="agency"
                                        	list="${form.ddlAgencyList}" width="100%" />
                                            
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 100px;">
                                            <nfwui:LabelBox id="affiliation1Label" code="<%= MessageIdConstant.SKF2010_SC005_AFFILIATION1 %>" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                            <imui:select id="affiliation1" name="affiliation1"
                                        	list="${form.ddlAffiliation1List}" width="100%" />
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 100px;">
                                            <nfwui:LabelBox id="affiliation2Label" code="<%= MessageIdConstant.SKF2010_SC005_AFFILIATION2 %>" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                            <imui:select id="affiliation2" name="affiliation2"
                                        	list="${form.ddlAffiliation2List}" width="100%" />
                                        </td>
                                    </tr>
                    
                                    <tr>
                                        <th style="width: 100px;">
                                        	<nfwui:LabelBox id="applName" code="<%= MessageIdConstant.SKF2010_SC005_APPLICANT_NAME %>" style="float:left" />
                                            &nbsp;&nbsp;
                                            <nfwui:PopupButton id="support" name="support" value="支援"
                                            cssClass="imui-small-button" use="popup"
                                            screenUrl="skf/Skf2010Sc001/init"
                                            parameter="nyukyoFlag:nyukyoFlag"
                                            popupWidth="650" popupHeight="700"
                                            modalMode="false" />
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <imui:textbox id="name" name="name" value="${form.name}" />
                                        </td>
                                    </tr>            
                    
                                    <tr>
                                        <th style="width: 100px;">
                                            <nfwui:LabelBox id="lblApplName" code="<%= MessageIdConstant.SKF2010_SC005_APPL_NAME %>" />
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
                                        	<nfwui:LabelBox id="applStatus" code="<%= MessageIdConstant.SKF2010_SC005_APPL_STATUS %>" />
                                            &nbsp;&nbsp;<imui:button tabindex="19" name="imui-8euruuk15dn9qtq" id="allCheck" value="全選択" class="imui-small-button" align="right"/>&nbsp;&nbsp;<imui:button tabindex="19" name="imui-8euruuk15dn9qtq" id="allNoCheck" value="全解除" class="imui-small-button" align="right"/>
                                        </th>
                                        <td style="width: 190px;" colspan="2" class="${form.applStatusErr}">
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
                                                    	<nfwui:CheckBox id="applStatus30" name="applStatus"
                                                    	value="30" label="承認中" />
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
                <div class="imui-form-container-wide" width="100%" style="max-width: 600px; min-width: 450px; max-height:450px;">
                <div style="overflow-y:scroll;max-height:500px;height:450px">
                        <nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF2010_SC005_CONTROL_GUIDE %>" titleLevel="2" />
                    ${form.operationGuide}
                </div>
				</div>
            </td>
            </tr>
</table>
</div>

<script type="text/javascript">
  (function($){
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

    // 画面表示時に定義される処理
    $(document).ready(function(){
	    // 「一括承認」ボタン押下時のイベント
	    preUpdateEvent = function () {
	        // 行データを取得する
	        var grid = jQuery("#ltResultListTable");
			var ids = grid.getGridParam("selarrrow");
			// 選択項目が無い場合
			if( ids.length <= 0 )
			{
				nfw.common.showReserveMessage("warning", "選択してください");
				return false;
			}
			
			var strs = [];
			for( var i=0; i<ids.length; ++i )
			{
				var id = ids[i];
				var row = grid.getRowData(id);
				
				// 承認対象外かチェック
				if (row.chkAgree == "-") {
					continue;
				}
				
				strs.push(row.applNo);
			}
			var submitStr = strs.join(",");
			
			// 承認可能対象が無い場合
			if (submitStr == "") {
				nfw.common.showReserveMessage("warning", "承認対象がありません");
				return false;
			}
	
			skf.common.confirmPopup("選択された申請書を一括で承認します。よろしいですか？", 
					"確認", "resultListForm", "skf/Skf2010Sc005/Update", 
					"OK", "Cancel", this, false);
			//$("#submitApplNo").val(submitStr);
			
			return true;
	    }
	});
    
    // リストテーブルの確認欄のアイコンをクリックした時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {
    	if ($(cellContent).hasClass('im-ui-icon-menu-24-document')) {
    		var grid = $("#ltResultListTable");
    		var rowData = grid.getRowData(rowId);
    		
    		var applNo = rowData.applNo;
    		var applStatus = rowData.applStatus;
    		
    		var nextPageId = "";
    		var nextPageId2 = "";
    		var applId = rowData.applId;
    		var applStatusCd = rowData.applStatusCd;
    		var agreName1 = rowData.agreName1;
    		var agreName2 = rowData.agreName2;
    		
   			var nextPageUrl = "skf/Skf2010Sc005/Transfer";
    		
    		$("#putApplNo").val(applNo);
    		$("#putApplId").val(applId);
    		$("#putApplStatus").val(applStatusCd);
    		$("#putShonin1").val(agreName1);
    		$("#putShonin2").val(agreName2);
    		
    		nfw.common.submitForm("resultListForm", nextPageUrl);
    		
    	}
    }
    
    // 社員選択支援ポップアップ コールバック関数
    shainInfoCallback = function(param){
        if( param != null && typeof param == 'object' && param.name != null){
            $("#name").val(param.name);
        }
    }
    
  })(jQuery);

</script>


<!-- テーブル一覧箇所 -->
<div class="imui-form-container-wide" style="width: 100%; max-width: 1300px; min-width: 1300px;">
<!-- 明細＆細目未満 -->
  <!-- 明細部 -->
  <nfwui:Form id="resultListForm" name="resultListForm" modelAttribute="form" secureToken="false">
    <div class="imui-chapter-title" style="max-width:1300px;"><h2>検索結果一覧</h2></div>
        <script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>
<input type="hidden" id="putApplNo" name="applNo" value="" />
<input type="hidden" id="putApplId" name="applId" value="" />
<input type="hidden" id="putApplStatus" name="sendApplStatus" value="" />
<input type="hidden" id="putShonin1" name="shonin1" value="" />
<input type="hidden" id="putShonin2" name="shonin2" value="" />
<input type="hidden" id="putShainNo" name="applShainNo" value="" />
<input type="hidden" name="backUrl" value="skf/Skf2010Sc005/init" />
<input type="hidden" name="prePageId" value="Skf2010Sc005" />
<table name="imui-8eqlrzst4hv6std" id="sampleListTable1">
<tr>
  <td>
<imui:listTable data="${form.ltResultList}"
id="ltResultListTable" name="ltResultListTable"
multiSelect="true" autoResize="true" autoWidth="true"
rowNumbers="true" onCellSelect="onCellSelect"
width="1300" height="232"
>
<pager num="30" />
<cols>
  <col name="applId" hidden="true" />
  <col name="applStatusCd" hidden="true" />
  <col name="chkAgree" hidden="true" />
  <col name="applStatus" caption="申請状況" width="60" align="center" onCellAttr="onCellAttr" /><!-- 申請状況 -->
  <col name="applNo" caption="申請書番号" width="180" align="center" wrap="true" /><!-- 申請書番号 -->
  <col name="applDate" caption="申請日" width="75" align="center" /><!-- 申請日 -->
  <col name="shainNo" caption="社員番号" width="80" align="left" /><!-- 社員番号 -->
  <col name="name" caption="申請者名" width="110" align="left" wrap="true" /><!-- 申請者名 -->
  <col name="applName" caption="申請書類名" width="200" align="left" /><!-- 申請書類名 -->
  <col name="agreDate" caption="承認日／修正依頼日" width="75" align="center" /><!-- 承認日／修正依頼日 -->
  <col name="agreName1" caption="承認者名1／修正依頼者名 "  width="130" wrap="true" align="left" /><!-- 承認者名1／修正依頼者名 -->
  <col name="agreName2" caption="承認者名2／修正依頼者名"  width="130" wrap="true" align="left" /><!-- 承認者名2／修正依頼者名 -->
  <col name="detail" caption="確認" width="50" align="center">
  
    <showIcon iconClass="im-ui-icon-menu-24-document" />
  </col><!-- 確認 -->
</cols>
</imui:listTable>
  </td>
</tr>

</table>

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
 

</table>
<div class="align-R">
  <nfwui:ConfirmButton id="csvDownload" name="csvDownload" value="CSV出力"
    cssStyle="width:150px;" cssClass="imui-medium-button check"
  formId="form" title="<%= MessageIdConstant.SKF2010_SC005_CSV %>" message="<%= MessageIdConstant.I_SKF_2008 %>"
  url="skf/Skf2010Sc005/Download" />
</div> 
