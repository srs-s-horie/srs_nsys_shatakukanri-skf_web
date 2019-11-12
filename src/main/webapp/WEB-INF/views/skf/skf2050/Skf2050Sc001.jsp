<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.skf2050.app.skf2050sc001.Skf2050Sc001Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2050Sc001Form form = (Skf2050Sc001Form)request.getAttribute("form"); %>

<script src="scripts/skf/skfCommon.js"></script>
<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->

<script type="text/javascript">
    /**
     * 一つ前の画面へ戻る
     */
    function back1() {
    	var url="skf/Skf2010Sc003/init"
    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
    }
    
    $(function() {
    	$(document).ready(function() {
    		$("#carryOutBtn").click(function() {
    			skf.common.confirmPopupForCallback("備品搬出を完了します。よろしいですか？", "確認", "form", "ok", "キャンセル", this, function(){
					var map = new Object();
					
					map['applNo'] = $("#applNo").val();
					map['applId'] = $("#applId").val();
					map['applStatus'] = $("#applStatus").val();
					map['completionDay'] = $("#completionDay").val();
					map['commentNote'] = $("#commentNote").val();
					nfw.common.doAjaxAction("skf/Skf2050Sc001/CarryOutAsync", map, true, function(res){
						if (res.showDialogFlag == "true") {
							var message = "搬出完了日が退居日より後ですがよろしいですか？(退居日:" + res.dialogTaikyoDay + "）";
							skf.common.confirmPopup(message, "確認", "form", "skf/Skf2050Sc001/CarryOut",  "OK", "cancel", this);
						} else {
							skf.common.submitForm("form", "skf/Skf2050Sc001/CarryOut", this);
						}
					});
				});
    		});
    	});
    });


</script>

    <!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
<nfwui:Hidden id="applNo" name="applNo" />
<div class="imui-form-container-wide"style="width: 95%;">
<div style="margin: 0px;">
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>
</div>

    <!-- コンテンツエリア -->
                     <table class="imui-form-search-condition" style="width:200px;">
                       <tr style="background-color: #fdfdff;">
                            <th style="width: 40%;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2050_SC001_APPL_STATUS %>" /></th>
                            <td style="width: 60%;"><label>${f:h(form.applStatusText) }</label></td>
                      </tr>
                    </table>
        <table class="imui-form-search-condition">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        
                        <div class="imui-form-container-wide" >
                        <nfwui:Title id="titBihinHenkyaku" code="<%= MessageIdConstant.SKF2050_SC001_HENKYAKU_TITLE %>" titleLevel="2" />
                        <table class="imui-form-search-condition">
                            <tbody>
                                <tr>
                                    <th rowspan="4"  style="width: 10%;"><nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2050_SC001_SHOZOKU %>" /></th>
                                    <th colspan="2" style="width: 18%;"><nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2050_SC001_AGENCY %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.agency)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2050_SC001_AFFILIATION1 %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation1) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2050_SC001_AFFILIATION2 %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation2) }
                                    </td>
                                </tr>

                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2050_SC001_TEL %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.tel) }
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblShinseisha" code="<%= MessageIdConstant.SKF2050_SC001_SHINSEISHA %>" /></th>
                                    <th colspan="2"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2050_SC001_SHAIN_NO %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.shainNo) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2050_SC001_NAME %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.name) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2050_SC001_TOKYU %>" /></th>
                                    <td colspan="2">
                                       ${f:h(form.tokyu) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblGender" code="<%= MessageIdConstant.SKF2050_SC001_GENDER %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.gender) }
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblNyukyoShataku" code="<%= MessageIdConstant.SKF2050_SC001_NYUKYO_SHATAKU %>" /></th>
                                      <th colspan="2"><nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF2050_SC001_SHATAKU_NAME %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.shatakuName) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblShatakuNo" code="<%= MessageIdConstant.SKF2050_SC001_SHATAKU_NO %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.shatakuNo) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblShatakuKikaku" code="<%= MessageIdConstant.SKF2050_SC001_SHATAKU_KIKAKU %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.shatakuKikaku) }
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblShatakuMenseki" code="<%= MessageIdConstant.SKF2050_SC001_SHATAKU_MENSEKI %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.shatakuMenseki) }
                                    </td>
                                </tr>
<imart:condition validity="<%= String.valueOf(form.isCompletionVisible()) %>">                                
                                <tr>
                                    <th rowspan="2"><nfwui:LabelBox id="lblDairinin" code="<%= MessageIdConstant.SKF2050_SC001_DAIRININ %>" /></th>
                                      <th colspan="2"><nfwui:LabelBox id="lblDairininName" code="<%= MessageIdConstant.SKF2050_SC001_DAIRININ_NAME %>" /></th>
                                    <td colspan="2">${f:h(form.dairininName) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><nfwui:LabelBox id="lblDairininRenrakusaki" code="<%= MessageIdConstant.SKF2050_SC001_DAIRININ_RENRAKUSAKI %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.dairiRenrakuSaki) }
                                    </td>
                                </tr>
</imart:condition>
<tr style="border:none">
   <td style="border:none">
   </td>
</tr>
                                <tr>
                                    <th rowspan="15"><nfwui:LabelBox id="lblBihinTitle" code="<%= MessageIdConstant.SKF2050_SC001_BIHIN %>" /></th>
                                    <th rowspan="2" colspan="2"><nfwui:LabelBox id="lblBihin" code="<%= MessageIdConstant.SKF2050_SC001_BIHIN %>" /></th>
                                                <tr>
                                                    <th><nfwui:LabelBox id="lblBihinStatus" code="<%= MessageIdConstant.SKF2050_SC001_BIHIN_STATUS %>" /></th>
                                                    <th><nfwui:LabelBox id="lblBihinAdjust" code="<%= MessageIdConstant.SKF2050_SC001_BIHIN_ADJUST %>" /></th>
                                                </tr>
<c:forEach var="bihinObj" items="${form.bihinInfoList }">
                                                <tr>
                                                   <th colspan="2"><label>${f:h(bihinObj.bihinName)}</label></th>
                                                   <td>${f:h(bihinObj.bihinStatus)}</td>
                                                   <td colspan="2">
                                                       ${f:h(bihinObj.bihinAdjust)}
                                                   </td>
                                                </tr>
</c:forEach>

                                </tr>

                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblRenrakuSaki" code="<%= MessageIdConstant.SKF2050_SC001_RENRAKUSAKI %>" /></th>
                                    <td colspan="2">
                                        ${f:h(form.renrakuSaki) }
                                    </td>
                                </tr>
<imart:condition validity="<%= String.valueOf(form.isAllNotVisible()) %>" negative>
<imart:condition validity="<%= String.valueOf(form.isCompletionVisible()) %>" negative>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblSessionDay" code="<%= MessageIdConstant.SKF2050_SC001_SESSION_DAY %>" /></th>
                                    <td colspan="2">
                                        <nfwui:DateBox id="sessionDay" name="sessionDay"
                                        disabledPatterns="ST01" />
                                        <imui:select id="sessionTime" name="sessionTime"
                                        list="${form.ddSessionTimeList }" disabled="${form.sessionTimeDisabled }" />
                                    </td>
                                </tr>
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isCompletionVisible()) %>">
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblCompletionDay" code="<%= MessageIdConstant.SKF2050_SC001_COMPLETION_DAY %>" /></th>
                                    <td colspan="2">
                                        <nfwui:DateBox id="completionDay" name="completionDay"
                                        disabledPatterns="ST30" cssStyle="width:150px;" />
                                        <a style="color: red;border: none;">
                                ※備品の搬出が完了した日を入力してください。
                                </a>

                                    </td>
                                </tr>
</imart:condition>
</imart:condition>
<tr style="border:none">
   <td style="border:none">
   </td>
</tr>
<imart:condition validity="<%= String.valueOf(form.isAllNotVisible()) %>" negative>
  <imart:condition validity="<%= String.valueOf(form.isCommentAreaVisible()) %>">　
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2050_SC001_COMMENT %>" /></th>
                                    <td colspan="3" >
                                        <imui:textArea id="commentNote" name="commentNote" rows="4" style="width: 98%" placeholder="例  承認者へのコメント" />
                                    </td>
                                </tr>
  </imart:condition>
</imart:condition>                                
                            </tbody>
                        </table>
                        </div>
                    </td>
                    
                    <td style="width: 30%; border: none; background-color: #fdfdff;">
                      <table >
                        <!-- 右側の操作ガイドの部分 -->
                        <div class="imui-form-container-wide" >
                        <nfwui:Title id="titleGuide" code="<%= MessageIdConstant.SKF2050_SC001_OPERATION_GUIDE %>" titleLevel="2" />
                        <div>
                        <div style="overflow-y:scroll;height:380px">
                            <span style="font-size: 100%; heigth:90%;">
                            ${form.operationGuide}
                            </span>
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
<imart:condition validity="<%= String.valueOf(form.isCarryOutVisible()) %>" negative>
<div class="align-L float-L">
    <imui:button id="backBtn" class="imui-medium-button check" onclick="back1()" value="前の画面へ" style="width:150px;" tabIndex="1" />
  <imart:condition validity="<%= String.valueOf(form.isCommentBtnVisible()) %>" >
    <nfwui:PopupButton id="commentPop" value="コメント表示" 
    cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
    modalMode="true" popupWidth="1250" popupHeight="550"
    parameter="applNo:applNo" formId="form" tabindex="12"
    screenUrl="skf/Skf2010Sc010/init" use="popup" />
  </imart:condition>
</div> 

<div class="align-R">
      <nfwui:ConfirmButton id="agreeBtn" value="同意する"
      cssClass="imui-medium-button check" cssStyle="width:150px;"
      url="skf/Skf2050Sc001/Agree" formId="form" tabIndex="2"
      title="<%= MessageIdConstant.SKF2050_SC001_CONFIRM_TITLE %>"
      message="<%= MessageIdConstant.I_SKF_2012 %>" />
      <nfwui:ConfirmButton id="notAgreeBtn" value="同意しない"
      cssClass="imui-medium-button check" cssStyle="width:150px;"
      url="skf/Skf2050Sc001/NotAgree" formId="form" tabIndex="3"
      title="<%= MessageIdConstant.SKF2050_SC001_CONFIRM_TITLE %>"
      message="<%= MessageIdConstant.I_SKF_2013 %>" />
</div> 
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isCarryOutVisible()) %>">
  <imart:condition validity="<%= String.valueOf((form.isAllNotVisible() || form.isCarryOutBtnRemove())) %>" negative>
<div class="align-L float-L">
  </imart:condition>
  <imart:condition validity="<%= String.valueOf((form.isAllNotVisible() || form.isCarryOutBtnRemove())) %>">
<div class="align-L">
  </imart:condition>
    <imui:button id="backBtn" class="imui-medium-button check" onclick="back1()" value="前の画面へ" style="width:150px;" />
  <imart:condition validity="<%= String.valueOf(form.isCommentBtnVisible()) %>" >
    <nfwui:PopupButton id="commentPop" value="コメント表示" 
    cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
    modalMode="true" popupWidth="1250" popupHeight="550"
    parameter="applNo:applNo" formId="form" tabindex="12"
    screenUrl="skf/Skf2010Sc010/init" use="popup" />
  </imart:condition>
</div> 
<imart:condition validity="<%= String.valueOf(form.isAllNotVisible()) %>" negative>
<div class="align-R">
<imart:condition validity="<%= String.valueOf(form.isCarryOutBtnRemove()) %>" negative>
      <imui:button id="carryOutBtn" class="imui-medium-button check" value="搬入完了" style="width:150px;" tabIndex="4" />
</imart:condition>
</div> 
</imart:condition>
</imart:condition>
</div>
</nfwui:Form>


	<!-- コンテンツエリア　ここまで -->