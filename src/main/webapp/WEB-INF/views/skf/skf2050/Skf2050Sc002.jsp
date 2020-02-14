<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.skf2050.app.skf2050sc002.Skf2050Sc002Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2050Sc002Form form = (Skf2050Sc002Form)request.getAttribute("form"); %>

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
    	var url="skf/Skf2010Sc005/init"
    	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
    }
    
    $(function() {
    	$(document).ready(function() {
    		
    	});
    });


</script>

<!-- コンテンツエリア -->
<nfwui:Form id="form" name="form" modelAttribute="form">
<nfwui:Hidden id="commentName" name="commentName" />
<nfwui:Hidden id="commentAddDate" name="commentAddDate" />
<nfwui:Hidden id="applNo" name="applNo" />
<nfwui:Hidden id="applStatus" name="applStatus" />
<div class="imui-form-container-wide" style="width: 95%;">
<!-- コンテンツエリア -->
    <table class="imui-form-search-condition">
       <tr>
            <th style="width: 10%;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2050_SC002_APPL_STATUS %>" /></th>
            <td style="width: 10%;"><label>${f:h(form.applStatusText) }</label></td>
            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td style="border:none;background-color: #fdfdff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

      </tr>
    </table>

    <table class="imui-form-search-condition">
    
        <tbody>
            <tr>
                <td style="width: 70%; border: none;background-color: #fdfdff;">
                    <!-- 左側の入力域の部分 -->
                    
                    <div class="imui-form-container-wide" >
                        <nfwui:Title id="titHenkyakuTitle" code="<%= MessageIdConstant.SKF2050_SC002_HENKYAKU_TITLE %>" titleLevel="2" />
                    <table class="imui-form-search-condition">
                        <tbody>
                            <tr>
                                <th rowspan="4"  style="width: 10%;"><nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2050_SC002_SHOZOKU %>" /></th>
                                <th colspan="2" style="width: 18%;"><nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2050_SC002_AGENCY %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.agency) }
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2050_SC002_AFFILIATION1 %>" /></th>
                                <td colspan="2">
                                   ${f:h(form.affiliation1) }
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2050_SC002_AFFILIATION2 %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.affiliation2) }
                                </td>
                            </tr>

                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2050_SC002_TEL %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.tel) }
                                </td>
                            </tr>
                            
                            <tr>
                                <th rowspan="4"><nfwui:LabelBox id="lblShinseisha" code="<%= MessageIdConstant.SKF2050_SC002_SHINSEISHA %>" /></th>
                                <th colspan="2"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2050_SC002_SHAIN_NO %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.shainNo) }
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2050_SC002_NAME %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.name) }
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblTokyu" code="<%= MessageIdConstant.SKF2050_SC002_TOKYU %>" /></th>
                                <td colspan="2">
                                   ${f:h(form.tokyu) }
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblGender" code="<%= MessageIdConstant.SKF2050_SC002_GENDER %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.gender) }
                                </td>
                            </tr>
                            
                            <tr>
                                <th rowspan="4"><nfwui:LabelBox id="lblNyukyoShataku" code="<%= MessageIdConstant.SKF2050_SC002_NYUKYO_SHATAKU %>" /></th>
                                  <th colspan="2"><nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF2050_SC002_SHATAKU_NAME %>" /></th>
                                <td colspan="2">${form.shatakuName}
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblShatakuNo" code="<%= MessageIdConstant.SKF2050_SC002_SHATAKU_NO %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.shatakuNo) }
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblShatakuKikaku" code="<%= MessageIdConstant.SKF2050_SC002_SHATAKU_KIKAKU %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.shatakuKikaku) }
                                </td>
                            </tr>
                            
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblShatakuKikaku" code="<%= MessageIdConstant.SKF2050_SC002_SHATAKU_KIKAKU %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.shatakuMenseki) }
                                </td>
                            </tr>
                            
                            <tr>
                                <th rowspan="2"><nfwui:LabelBox id="lblDairinin" code="<%= MessageIdConstant.SKF2050_SC002_DAIRININ %>" /></th>
                                  <th colspan="2"><nfwui:LabelBox id="lblDairinin" code="<%= MessageIdConstant.SKF2050_SC002_DAIRININ %>" /></th>
                                <td colspan="2">
                                ${f:h(form.dairininName) }
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2"><nfwui:LabelBox id="lblDairininRenrakusaki" code="<%= MessageIdConstant.SKF2050_SC002_DAIRININ_RENRAKUSAKI %>" /></th>
                                <td colspan="2">
                                   ${f:h(form.dairiRenrakuSaki) }
                                </td>
                            </tr>

<tr style="border:none">
<td style="border:none">
</td>
</tr>
                                <tr>
                                    <th rowspan="15"><nfwui:LabelBox id="lblBihin" code="<%= MessageIdConstant.SKF2050_SC002_BIHIN %>" /></th>
                                    <th rowspan="2" colspan="2"><label></label></th>
                                    <tr>
                                        <th><nfwui:LabelBox id="lblBihinStatus" code="<%= MessageIdConstant.SKF2050_SC002_BIHIN_STATUS %>" /></th>
                                        <th><nfwui:LabelBox id="lblBihinAdjust" code="<%= MessageIdConstant.SKF2050_SC002_BIHIN_ADJUST %>" /></th>
                                    </tr>
<c:forEach var="obj" items="${form.bihinInfoList }">
                            <tr>
                               <th colspan="2"><label>${f:h(obj.bihinName) }</label></th>
                               <td>${f:h(obj.bihinStatus) }</td>
                               <td colspan="2">
                                   ${f:h(obj.bihinAdjust) }
                               </td>
                            </tr>
</c:forEach>

                            </tr>

                            <tr>
                                <th colspan="3"><nfwui:LabelBox id="lblRenrakuSaki" code="<%= MessageIdConstant.SKF2050_SC002_RENRAKUSAKI %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.renrakuSaki) }
                                </td>
                            </tr>
<imart:condition validity="<%= String.valueOf(form.isAllDateAreaEscape()) %>" negative>                         
<imart:condition validity="<%= String.valueOf(form.isCarryOut()) %>" negative>                         
                            <tr>
                                <th colspan="3"><nfwui:LabelBox id="lblSessionDay" code="<%= MessageIdConstant.SKF2050_SC002_SESSION_DAY %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.sessionDate) }
                                </td>
                            </tr>
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isCarryOut()) %>">                         
                            <tr>
                                <th colspan="3"><nfwui:LabelBox id="lblCompletionDay" code="<%= MessageIdConstant.SKF2050_SC002_COMPLETION_DAY %>" /></th>
                                <td colspan="2">
                                    ${f:h(form.completionDay) }
                                </td>
                            </tr>
</imart:condition>
</imart:condition>
<tr style="border:none">
<td style="border:none">
</td>
</tr>
<imart:condition validity="<%= String.valueOf(form.isCommentAreaVisibled()) %>">                         
                            <tr>
                                <th colspan="3"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2050_SC002_COMMENT %>" /></th>
                                <td colspan="3" >
                                    <imui:textArea id="commentNote" name="commentNote" rows="4" style="width: 98%" placeholder="例  申請者へのコメント" value="${form.commentNote }" tabIndex="1" />
                                </td>
                            </tr>
</imart:condition>                           
                        </tbody>
                    </table>
                    </div>
                </td>
                
                <td style="width: 30%; border: none;background-color: #fdfdff;">
                  <table >
                    <!-- 右側の操作ガイドの部分 -->
                    <div class="imui-form-container-wide" >
                    <nfwui:Title id="ttlOperationGuide" code="<%= MessageIdConstant.SKF2050_SC002_OPERATION_GUIDE %>" titleLevel="2" />
                    <div style="height:280px">
                        <span style="font-size: 100%; heigth:90%;">
                        ${form.operationGuide }
                        </span>
                    </div>
                  </div>
                  </table>
                </td>
            </tr>
        </tbody>
    </table>

<imart:condition validity="<%= String.valueOf(form.isAllButtonEscape()) %>" negative>                         
<div class="align-L float-L">
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isAllButtonEscape()) %>">                         
<div class="align-L">
</imart:condition>
  <imui:button id="backBtn" class="imui-medium-button check" type="button" onclick="back1()" value="前の画面へ" style="width:150px;" tabIndex="2" />
<imart:condition validity="<%= String.valueOf(form.isCommentBtnVisibled()) %>">                         
    <nfwui:PopupButton id="commentPop" value="コメント表示" 
    cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
    modalMode="false" popupWidth="1250" popupHeight="550"
    parameter="applNo:applNo" formId="form" tabindex="12"
    screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</div> 

<imart:condition validity="<%= String.valueOf(form.isAllButtonEscape()) %>" negative>                         
<imart:condition validity="<%= String.valueOf(form.isCarryOut()) %>" negative>                         
<div class="align-R">
  <nfwui:ConfirmButton id="revisionBtn" value="修正依頼"
      cssClass="imui-medium-button check" cssStyle="width:150px;"
      url="skf/Skf2050Sc002/Revision" formId="form" tabIndex="3"
      title="<%= MessageIdConstant.SKF2050_SC002_CONFIRM_TITLE %>"
      message="<%= MessageIdConstant.I_SKF_2005 %>" />
  <nfwui:ConfirmButton id="confirmBtn" value="確認"
      cssClass="imui-medium-button check" cssStyle="width:150px;"
      url="skf/Skf2050Sc002/Confirm" formId="form" tabIndex="4"
      title="<%= MessageIdConstant.SKF2050_SC002_CONFIRM_TITLE %>"
      message="<%= MessageIdConstant.I_SKF_2011 %>" />
</div> 
</imart:condition>
<imart:condition validity="<%= String.valueOf(form.isCarryOut()) %>">                         
<div class="align-R">
  <nfwui:ConfirmButton id="returnBtn" value="修正依頼"
      cssClass="imui-medium-button check" cssStyle="width:150px;"
      url="skf/Skf2050Sc002/Return" formId="form" tabIndex="5"
      title="<%= MessageIdConstant.SKF2050_SC002_CONFIRM_TITLE %>"
      message="<%= MessageIdConstant.I_SKF_2005 %>" />
  <nfwui:ConfirmButton id="agreeBtn" value="承認"
      cssClass="imui-medium-button check" cssStyle="width:150px;"
      url="skf/Skf2050Sc002/Agree" formId="form" tabIndex="6"
      title="<%= MessageIdConstant.SKF2050_SC002_CONFIRM_TITLE %>"
      message="<%= MessageIdConstant.I_SKF_2006 %>" />
</div> 
</imart:condition>
</imart:condition>
</div>
</nfwui:Form>