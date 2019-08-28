<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.skf2030.app.skf2030sc001.Skf2030Sc001Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2030Sc001Form form = (Skf2030Sc001Form)request.getAttribute("form"); %>


<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->

<script src="scripts/skf/skfCommon.js"></script>
<script type="text/javascript">
    /**
     * 一つ前の画面へ戻る
     */
    function back1() {
    	var url="skf/Skf2010Sc003/init"
    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
    }
	$(function() {
		// 備品申請のラジオボタン操作
		checkBihinChecked = function() {
			var bihinAllFalse = "true";
			for(var i = 11; i <= 19; i++) {
				if ($("input[name='bihinAppl" + i + "']:checked").val() === "2") {
					bihinAllFalse = "false";
				}
			}
			if (bihinAllFalse == "true") {
				$("#sessionDayDiv").prop("disabled", true);
				$("#sessionDay").prop("disabled", true);
				$("#sessionTime").prop("disabled", true);
				$("#renrakuSaki").prop("disabled", true);
				$("#bihinCheckFlag").val("false");
			} else {
				$("#sessionDayDiv").prop("disabled", false);
				$("#sessionDay").prop("disabled", false);
				$("#sessionTime").prop("disabled", false);
				$("#renrakuSaki").prop("disabled", false);
				$("#bihinCheckFlag").val("true");
			}
		}
		
		$(document).ready(function() {
			checkBihinChecked();
			
			$("#btnApply, #btnCarryIn").click(function(){
				skf.common.confirmPopupForCallback("備品搬入を完了します。よろしいですか？", "搬入完了", "form", "OK", "cancel", this, function(){
					var map = new Object();
					
					map['applNo'] = $("#applNo").val();
					map['applId'] = $("#applId").val();
					map['applStatus'] = $("#applStatus").val();
					map['hdnShainNo'] = $("#hdnShainNo").val();
					map['completionDay'] = $("#completionDay").val();
					nfw.common.doAjaxAction("skf/Skf2030Sc001/CheckAsync", map, true, function(res){
						if (res.showDialogFlag == "true") {
							var message = "搬入完了日が入居日より前ですがよろしいですか？(入居日:" + res.nyukyobi + "）";
							skf.common.confirmPopup(message, "搬入完了", "form", "skf/Skf2030Sc001/Complete",  "OK", "cancel", this);
						} else {
							skf.common.submitForm("form", "skf/Skf2030Sc001/Complete", this);
						}
					});
				});
				
			});
		});
		
		$("input[name^='bihinAppl']:radio").change(function(){
			checkBihinChecked();
		});

	<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>">
	    $(function() {
	    	$(document).ready(function() {
	    		$("input:text").prop("disabled", true);
	    		$("select").prop("disabled", true);
	    		$("input:radio").prop("disabled", true);
	    	});
	    });

	</imart:condition>

	});

</script>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" width="1350px" style="width: 100%; max-width: 1350px;">
	<nfwui:Form id="form" name="form" modelAttribute="form">
	<nfwui:Hidden id="applNo" name="applNo" />
	<nfwui:Hidden id="applId" name="applId" />
	<nfwui:Hidden id="applStatus" name="applStatus" />
	<nfwui:Hidden id="hdnShainNo" name="hdnShainNo" />
	<input type="hidden" id="bihinCheckFlag" value="false" />
    <!-- コンテンツエリア -->
                          <table class="imui-form-search-condition">
                       <tr>
                            <th style="width: 10%;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2030_SC001_APPL_STATUS %>" /></th>
                            <td style="width: 10%;"><label>${f:h(form.applStatusText) }</label></td>
                            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      </tr>
                    </table>
    
<imart:condition validity="<%= String.valueOf(form.isBihinReadOnly()) %>">
<%@ include file="skf2030common/Skf2030Sc001HannyuMachi.jsp" %>
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isBihinReadOnly()) %>" negative>
<%@ include file="skf2030common/Skf2030Sc001Hozon.jsp" %>
</imart:condition>

                        </div>
                    </td>
                    
                    <td style="width: 30%; border: none; background-color: #fdfdff;">
                      <table >
                        <!-- 右側の操作ガイドの部分 -->
                        <div class="imui-form-container-wide" >
                            <nfwui:Title id="titOperationGuide" code="<%= MessageIdConstant.SKF2030_SC001_GUIDE %>" titleLevel="2" />
                        <div>
                        <div style="overflow-y:scroll;height:99%">
                            ${form.operationGuide }
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
<imart:condition validity="<%= String.valueOf(form.isBihinReadOnly()) %>">
<div class="align-L float-L">
      <input class="imui-medium-button check" type="button" value="前の画面へ" style="width:150px;" onclick="back1()">
</div> 

<div class="align-R">
      <imui:button class="imui-medium-button check" id="btnCarryIn" name="btnCarryIn" value="搬入完了" style="width:150px;" />
</div> 
</imart:condition>

<imart:condition validity="<%= String.valueOf(form.isBihinReadOnly()) %>" negative>
<div class="align-L float-L" style="width: 50%;">
           <nfwui:ConfirmButton id="revisionBtn" name="clearBtn" value="入力内容をクリア"
           cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
           title="<%= MessageIdConstant.SKF2020_SC003_CONFIRM_TITLE %>"
           message="<%= MessageIdConstant.I_SKF_2004 %>"
           url="skf/Skf2030Sc001/Clear" removePatterns="ST01" />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="550"
          parameter="applNo:applNo" formId="form"
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</div> 
<div class="align-R">
           <nfwui:Button id="saveBtn" name="saveBtn" value="一時保存"
           cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
           url="skf/Skf2030Sc001/Save" removePatterns="ST01" />
</div> 
<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>">
<div class="align-L">
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isStatus01Flag()) %>" negative>
<div class="align-L float-L" style="clear: both;">
</imart:condition>
      <imui:button class="imui-medium-button check" value="前の画面へ" style="width:150px;" onclick="back1()" />
</div> 

<div class="align-R">
           <nfwui:ConfirmButton id="applyBtn" name="applyBtn" value="申請"
           cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
           title="<%= MessageIdConstant.SKF2020_SC003_CONFIRM_TITLE %>"
           message="<%= MessageIdConstant.I_SKF_2003 %>"
           url="skf/Skf2030Sc001/Apply" removePatterns="ST01" />
</div> 
</imart:condition>


</nfwui:Form>

    </div>

  

    
	<!-- コンテンツエリア　ここまで -->