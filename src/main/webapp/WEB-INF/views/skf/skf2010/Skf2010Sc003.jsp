<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

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
/**
* メニュー画面へ遷移する。
*/
function back() {
	showConfirm(W_GFK_0007, function() {
		$.StandardPost("../common/top.html");
	});
}
</script>

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>
<table align="center">
    <tr>
        <td>
            <div>
                <table class="imui-form-search-condition" width="1350px">
                    <td class="imui-form-container-wide" style="width: 45%; border: none;background-color: #fdfdff;" >
                     <div class="imui-form-container-wide" style="height:440px;width: 650px;">
                       <nfwui:Title id="lblSearchTitle" code="<%= MessageIdConstant.SKF2010_SC003_SEARCH_TITLE %>" titleLevel="2" />
                            <nfwui:Form id="form" name="form" modelAttribute="form">
                            <input type="hidden" name="backUrl" value="skf/Skf2010Sc003/init" />
                                <table class="imui-form-search-condition">
                                検索条件を指定し、<span style="font-weight: bold;color:green;">「申請状況を確認」</span>をクリックしてください。
                                    <tr>
                                        <th style="width: 120px;">
                                            <nfwui:LabelBox id="lblApplDater" code="<%= MessageIdConstant.SKF2010_SC003_APPL_DATER %>" />
                                        </th>
                                        <td colspan="2">
                                            <imui:textbox name="applDateFrom" id="applDateFrom" value="${f:h(form.applDateFrom)}" class="${form.applDateFromErr}" style="width:100px" />&nbsp;～&nbsp;<imui:textbox name="applDateTo" id="applDateTo" value="${form.applDateTo}" style="width:100px" class="${form.applDateToErr}" />
                                        </td>
                                    </tr>
                                    <im:calendar floatable="true" altField="#applDateFrom" />
                                    <im:calendar floatable="true" altField="#applDateTo" />
                                    <tr>
                                      <th style="width: 120px;">
                                          <nfwui:LabelBox id="agreDate" code="<%= MessageIdConstant.SKF2010_SC003_AGRE_DATE %>" />
                                      </th>
                                      <td colspan="2">
                                          <imui:textbox name="agreDateFrom" id="agreDateFrom" value="${f:h(form.agreDateFrom)}" style="width:100px" class="${form.agreDateFromErr}"/>&nbsp;～&nbsp;<imui:textbox name="agreDateTo" id="agreDateTo" value="${form.agreDateTo}" class="${form.agreDateToErr}" style="width:100px"/>
                                      </td>
                                    </tr>
                    				<im:calendar floatable="true" altField="#agreDateFrom" />
                                    <im:calendar floatable="true" altField="#agreDateTo" />
                                    <tr>
                                        <th style="width: 120px;">
                                            <nfwui:LabelBox id="lblApplName" code="<%= MessageIdConstant.SKF2010_SC003_APPL_NAME %>" />
                                            
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <imui:textbox id="applName" name="applName" placeholder="例 入居" value="${f:h(form.applName)}" />
                                        </td>
                                    </tr>   
                    
                                    <tr>
                                        <th style="width: 120px;"　rowspan="2">
                                        	<nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2010_SC003_APPL_STATUS %>" />
                                            &nbsp;&nbsp;<imui:button tabindex="19" name="imui-8euruuk15dn9qtq" id="allCheck" value="全選択" class="imui-small-button" align="right"/>&nbsp;&nbsp;<imui:button tabindex="19" name="imui-8euruuk15dn9qtq" id="allNoCheck" value="全解除" class="imui-small-button" align="right"/>
                                        </th>
                                        <td style="width: 180px;" colspan="2">
                                        <nfwui:CheckBoxGroupTag id="applStatus">
                                            <table>
                                                <tr style="height: 25px;">
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus00" name="applStatus"
                                                    	value="00" label="一時保存" />&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus01" name="applStatus"
                                                    	value="01" label="申請中" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus10" name="applStatus"
                                                    	value="10" label="審査中" />
                                                    </td>
                                                </tr>
                                                <tr style="height: 25px;">
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus40" name="applStatus"
                                                    	value="40" label="承認" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus50" name="applStatus"
                                                    	value="50" label="修正依頼" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus99" name="applStatus"
                                                    	value="99" label="差戻し" />
                                                    </td>
                                                </tr>

                                                <tr style="height: 25px;">
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
                                                </tr>

                                                <tr style="height: 25px;">
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus26" name="applStatus"
                                                    	value="26" label="搬出済" />
                                                    </td>
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus27" name="applStatus"
                                                    	value="27" label="選択しない" />&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                         <nfwui:CheckBox id="applStatus28" name="applStatus"
                                                    	value="28" label="選択済" />
                                                    </td>
                                                </tr>

                                                <tr style="height: 25px;">
                                                    <td>
                                                        <nfwui:CheckBox id="applStatus41" name="applStatus"
                                                    	value="41" label="完了" />
                                                    </td>
                                                </tr>
                                        
                                            </table>
                                            </nfwui:CheckBoxGroupTag>
                                        </td>
                                    </tr>   
                                </table>
							    <input type="hidden" id="applNo" name="applNo" value="" />
							    <input type="hidden" id="applId" name="applId" value="" />
							    <input type="hidden" id="applStatusVal" name="sendApplStatus" value="" />
                            </nfwui:Form>
        
        
                         <div class="align-L">	
                             <nfwui:Button id="searchBtn" name="searchBtn" value="申請状況を確認"
                             cssClass="imui-medium-button" formId="form"
                             url="skf/Skf2010Sc003/Search" />
                         </div>
                         </div>
                         
                         

            <td style="width: 45%; border: none;;background-color: #fdfdff;">
                <div class="imui-form-container-wide" width="100%" style="width: 600px;height:440px;">
                <div style="max-height:440px;height:500px">
                    <nfwui:Title code="<%= MessageIdConstant.SKF2010_SC003_CONTROL_GUIDE %>" titleLevel="2" />
${form.operationGuide}
                </div>  

            </td>
</table>
</div>

</div>

<script type="text/javascript">
</script>

</div>

<!-- テーブル一覧箇所 -->
<div class="imui-form-container" width="1300px" style="width: 100%; max-width: 1300px;">
<!-- 明細＆細目未満 -->
  <!-- 明細部 -->
  <nfwui:Form id="listTableForm" name="listTableForm" modelAttribute="form">
        
    <div width="1300px" style="width:1300px; max-width:1300px;"><nfwui:Title id="resultListTitle" code="<%= MessageIdConstant.SKF2010_SC003_GRV_APPL_LIST %>" titleLevel="2" /></div>

<imui:listTable data="${form.ltResultList}"
id="ltResultListTable" name="ltResultListTable"
autoResize="true" autoWidth="true"
rowNumbers="true" onCellSelect="onCellSelect"
width="1300" height="232">
<cols>
  <col name="detail" caption="表示" width="90" align="center">
     <showIcon iconClass="im-ui-icon-common-16-update" />
  </col>
  <col name="applId" hidden="true" />
  <col name="applStatus" hidden="true" />
  <col name="applDate" caption="申請日" width="100" align="center" />
  <col name="applStatusText" caption="申請状況" width="60" align="center" onCellAttr="onCellAttr" />
  <col name="applNo" caption="申請書番号" width="200" align="center" />
  <col name="applName" caption="申請書類名" width="440" align="left" />
  <col name="agreDate" caption="承認日／修正依頼日" width="140" align="center" />
  <col name="cancel" caption="取下げ" width="90" align="center">
     <showIcon iconClass="im-ui-icon-common-16-ng" />
  </col>
  <col name="delete" caption="削除" width="90" align="center">
  　　　　<showIcon iconClass="im-ui-icon-common-16-trashbox" />
  </col>
</cols>


</imui:listTable>


<script type="text/javascript">
(function() {
    // 申請状況の「全選択」ボタン押下時のイベント
    $("#allCheck").click(function() {
    	$("input[name='applStatus']").prop("checked", true);
    });
    // 申請状況の「全解除」ボタン押下時のイベント
    $("#allNoCheck").click(function() {
    	$("input[name='applStatus']").prop("checked", false);
    });

    // リストテーブルの確認欄のアイコンをクリックした時のイベント
    onCellSelect = function(rowId, iCol, cellContent, e) {
    	if ($(cellContent).hasClass('im-ui-icon-common-16-update')
    			|| $(cellContent).hasClass('im-ui-icon-common-16-ng')
					||$(cellContent).hasClass('im-ui-icon-common-16-trashbox')) {
			var dialogTitle = "確認";
    		var dialogMessage = "";
	    	if ($(cellContent).hasClass('im-ui-icon-common-16-update')) {
	    		// 表示
	    	} else if ($(cellContent).hasClass('im-ui-icon-common-16-ng')) {
	    		// 取下げ
	    		dialogMessage = "申請書を取下げします。よろしいですか？";
	    	} else if ($(cellContent).hasClass('im-ui-icon-common-16-trashbox')) {
	    		// 削除
	    		url = url + "Delete";
	    	}
			//nfw.common.confirmPopup(dialogTitle, dialogMessage, "OK", "CANCEL");
    		
    		var grid = $("#ltResultListTable");		// リストテーブル情報取得
    		var rowData = grid.getRowData(rowId);	// 行情報取得
    		
    		var url = "skf/Skf2010Sc003/";
    		
    		var applNo = rowData.applNo;		// 申請番号
    		var applId = rowData.applId;		// 申請ID
    		var applStatus = rowData.applStatus;		// 申請状況
    		$("#applNo").val(applNo);
    		$("#applId").val(applId);
    		$("#applStatusVal").val(applStatus);
    	
	    	if ($(cellContent).hasClass('im-ui-icon-common-16-update')) {
	    		// 表示
	    		switch (applId) {
	    		case "R0104":
	    			url = "skf/Skf2030Sc001/init";
	    			break;
	    		default:
	    			url = "skf/Skf2010Sc004/init";
	    			break;
	    		}
	    	} else if ($(cellContent).hasClass('im-ui-icon-common-16-ng')) {
	    		// 取下げ
	    		url = url + "Cancel";
	    	} else if ($(cellContent).hasClass('im-ui-icon-common-16-trashbox')) {
	    		// 削除
	    		url = url + "Delete";
	    	}
	    	
	    	$("#form").attr("action", url);
	    	
	    	if (dialogMessage == "") {
	    		nfw.common.submitForm("form", url, this);
	    	} else {
	    		nfw.common.confirmPopup(dialogMessage,　dialogTitle, "form", url, "OK", "CANCEL", this, true);
	    	}
	    	//$("#form").submit();
    	}
    }
})(jQuery);
</script>

  </nfwui:Form>
</div>
</div>

 <br><br>

</table>
</div>
	<!-- コンテンツエリア　ここまで -->