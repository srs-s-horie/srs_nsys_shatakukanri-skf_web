<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>
<%@ page import="jp.co.c_nexco.skf.skf2030.app.skf2030sc002.Skf2030Sc002Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2030Sc002Form form = (Skf2030Sc002Form)request.getAttribute("form"); %>


<%-- コンテンツエリア --%>
<script type="text/javascript">
function back1() {
	var url="skf/Skf2010Sc005/Search"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}
</script>

<style type="text/css">

</style>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide">

    <!-- コンテンツエリア -->
    <div style="max-width: 300px; margin-left:64px; margin-top:-7px;">
    <table class="imui-form-search-condition">
       <tr>
            <th style="width: 5%;"><nfwui:LabelBox id="lblApplStatus" code="<%= MessageIdConstant.SKF2030_SC002_APPL_STATUS %>" /></th>
            <td style="width: 10%;"><label>${f:h(form.applStatusText) }</label></td>
      </tr>
    </table>
    </div>
    <nfwui:Form id="form" name="form" modelAttribute="form" encType="multipart/form-data">
      <nfwui:Hidden id="applNo" name="applNo" />
        <table class="imui-form-search-condition" style="margin-top:-11px;">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        <div class="imui-form-container-wide" >
                        <nfwui:Title id="titleShinsei" code="<%= MessageIdConstant.SKF2030_SC002_SHINSEI_NAIYO %>" titleLevel="2" />
                        <table class="imui-form-search-condition">
                            <tbody>
                                <tr>
                                    <th rowspan="4"  style="width: 10%;"><nfwui:LabelBox id="lblShozoku" code="<%= MessageIdConstant.SKF2030_SC002_SHOZOKU %>" /></th>
                                    <th colspan="3" style="width: 16%;"><nfwui:LabelBox id="lblAgency" code="<%= MessageIdConstant.SKF2030_SC002_AGENCY %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.agency) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblAffiliation1" code="<%= MessageIdConstant.SKF2030_SC002_AFFILIATION1 %>" /></th>
                                    <td colspan="3">
                                       ${f:h(form.affiliation1) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblAffiliation2" code="<%= MessageIdConstant.SKF2030_SC002_AFFILIATION2 %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.affiliation2) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblTel" code="<%= MessageIdConstant.SKF2030_SC002_TEL %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.tel) }
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblShinseisha" code="<%= MessageIdConstant.SKF2030_SC002_SHINSEISHA %>" /></th>
                                    <th colspan="3"><nfwui:LabelBox id="lblShainNo" code="<%= MessageIdConstant.SKF2030_SC002_SHAIN_NO %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.shainNo) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblName" code="<%= MessageIdConstant.SKF2030_SC002_NAME %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.name) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblTokyu" code="<%= MessageIdConstant.SKF2030_SC002_TOKYU %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.tokyu) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblGender" code="<%= MessageIdConstant.SKF2030_SC002_GENDER %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.gender) }
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><nfwui:LabelBox id="lblNyukyoShataku" code="<%= MessageIdConstant.SKF2030_SC002_NYUKYO_SHATAKU %>" /></th>
                                      <th colspan="3"><nfwui:LabelBox id="lblShatakuName" code="<%= MessageIdConstant.SKF2030_SC002_SHATAKU_NAME %>" /></th>
                                    <td colspan="3">
                                        ${form.shatakuName}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblShatakuNo" code="<%= MessageIdConstant.SKF2030_SC002_SHATAKU_NO %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.shatakuNo) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblShatakuKikaku" code="<%= MessageIdConstant.SKF2030_SC002_SHATAKU_KIKAKU %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.shatakuKikaku) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblShatakuMenseki" code="<%= MessageIdConstant.SKF2030_SC002_SHATAKU_MENSEKI %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.shatakuMenseki) }
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="2"><nfwui:LabelBox id="lblDairinin" code="<%= MessageIdConstant.SKF2030_SC002_DAIRININ %>" /></th>
                                    <th colspan="3"><nfwui:LabelBox id="lblDairininName" code="<%= MessageIdConstant.SKF2030_SC002_DAIRININ_NAME %>" /></th>
                                    <td colspan="3">
                                    ${f:h(form.dairiName) }
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblDairiRenrakusaki" code="<%= MessageIdConstant.SKF2030_SC002_DAIRI_RENRAKUSAKI %>" /></th>
                                    <td colspan="3">
                                    ${f:h(form.dairiRenrakusaki) }
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="2"><nfwui:LabelBox id="lblBihinHanyu" code="<%= MessageIdConstant.SKF2030_SC002_BIHIN_HANNYU %>" /></th>
                                    <th colspan="3"><nfwui:LabelBox id="lblSessionDay" code="<%= MessageIdConstant.SKF2030_SC002_BIHIN_KIBO_DATE %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.sessionDay) } ${f:h(form.sessionTimeText) }                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><nfwui:LabelBox id="lblRenrakuSaki" code="<%= MessageIdConstant.SKF2030_SC002_RENRAKUSAKI %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.renrakuSaki) }
                                    </td>
                                </tr>
<imart:condition validity="<%= String.valueOf(form.isCompletionDayVisible()) %>">                                
                                <tr>
                                    <th colspan="4"><nfwui:LabelBox id="lblCompletionDay" code="<%= MessageIdConstant.SKF2030_SC002_COMPLETE_DATE %>" /></th>
                                    <td colspan="3">
                                        ${f:h(form.completionDay) }                                     
                                    </td>
                                </tr>
</imart:condition>
<tr style="border:none">
   <td style="border:none">
   </td>
</tr>

                                <tr>
                                    <th rowspan="2" colspan="4"><nfwui:LabelBox id="lblBihin" code="<%= MessageIdConstant.SKF2030_SC002_BIHIN %>" /></th>
                                                <tr>
                                                    <th><nfwui:LabelBox id="lblBihinSTATE" code="<%= MessageIdConstant.SKF2030_SC002_BIHIN_STATE %>" /></th>
                                                    <th><nfwui:LabelBox id="lblBihinAppl" code="<%= MessageIdConstant.SKF2030_SC002_BIHIN_APPL %>" /></th>
                                                    <th><nfwui:LabelBox id="lblBihinAdjust" code="<%= MessageIdConstant.SKF2030_SC002_BIHIN_ADJUST %>" /></th>
                                                </tr>
<c:forEach var="bihinInfo" items="${form.bihinList }">
                                                <tr>
                                                   <th colspan="4"><label>${f:h(bihinInfo.bihinName) }</label></th>
                                                   <td>${f:h(bihinInfo.bihinStateText) }</td>
                                                   <td>${f:h(bihinInfo.bihinApplText) }</td>
                                                   <td>${f:h(bihinInfo.bihinAdjustText) }</td>
                                                </tr>
                                                <input type="hidden" name="bihinState${f:h(bihinInfo.bihinIndex) }" value="${f:h(bihinInfo.bihinState) }" />
                                                <input type="hidden" name="bihinAppl${f:h(bihinInfo.bihinIndex) }" value="${f:h(bihinInfo.bihinAppl) }" />
                                                <input type="hidden" name="bihinAdjust${f:h(bihinInfo.bihinIndex) }" value="${f:h(bihinInfo.bihinAdjust) }" />
</c:forEach>
<tr style="border:none">
   <td style="border:none">
   </td>
</tr>
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>"> 
                                <tr>
                                    <th colspan="4"><nfwui:LabelBox id="lblComment" code="<%= MessageIdConstant.SKF2030_SC002_COMMENT %>" /></th>
                                    <td colspan="3" >
                						<imui:textArea id="commentNote" name="commentNote" style="height:80px; width:98%; ime-mode:active;" value="${form.commentNote }" placeholder="例  申請者へのコメント" disabled="${form.commentDisabled }" />
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
                            <nfwui:Title id="titOperationGuide" code="<%= MessageIdConstant.SKF2030_SC002_GUIDE %>" titleLevel="2" />
                        <div style="overflow-y:scroll;height:99%;">
                            ${form.operationGuide}
                        </div>
                      </div>
                        
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
<div class="align-L${f:h(form.floatL) }" style="margin-top: -5px;">
      <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
<imart:condition validity="<%= String.valueOf(form.isCommentBtnVisibled()) %>" >
	<nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="488"
          parameter="applNo:applNo" disabledPatterns="NONADMIN"
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</div>

<imart:decision case="${form.dispMode}" value="<%= String.valueOf(CodeConstant.VIEW_LEVEL_2) %>">
<div class="align-R">
      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn"
      value="修正依頼" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2030_SC002_REVISION %>" message="<%= MessageIdConstant.I_SKF_2005 %>"
      url="skf/Skf2030Sc002/Revision" formId="form" disabledPatterns="NONADMIN" />
<imart:condition validity="<%= form.getBihinCheckFlag() %>" >      
      <nfwui:ConfirmButton id="presentBtn" name="presentBtn"
      value="提示" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2030_SC002_PRESENT %>" message="<%= MessageIdConstant.I_SKF_2011 %>"
      url="skf/Skf2030Sc002/Present" formId="form" disabledPatterns="NONADMIN" disabled="${form.presentBtnDisabled}" />
</imart:condition>
<imart:condition validity="<%= form.getBihinCheckFlag() %>" negative>      
      <nfwui:ConfirmButton id="approveBtn" name="approveBtn"
      value="承認" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2030_SC002_APPLY %>" message="<%= MessageIdConstant.I_SKF_2006 %>"
      url="skf/Skf2030Sc002/Approve" formId="form" disabledPatterns="NONADMIN" />
</imart:condition>
</div>
</imart:decision>
<imart:decision case="${form.dispMode}" value="<%= String.valueOf(CodeConstant.VIEW_LEVEL_3) %>">
	<div class="align-R">
      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn"
      value="修正依頼" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2030_SC002_REVISION %>" message="<%= MessageIdConstant.I_SKF_2005 %>"
      url="skf/Skf2030Sc002/Revision" formId="form" disabledPatterns="NONADMIN" />
      <nfwui:ConfirmButton id="approveBtn" name="approveBtn"
      value="承認" cssClass="imui-medium-button" cssStyle="width: 150px" 
      title="<%= MessageIdConstant.SKF2030_SC002_APPLY %>" message="<%= MessageIdConstant.I_SKF_2006 %>"
      url="skf/Skf2030Sc002/Approve" formId="form" disabledPatterns="NONADMIN" />
	</div>  
</imart:decision>  
<script type="text/javascript">
    
</script>
</nfwui:Form>
</div>