﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->
<div id="imui-container">

<style>
    li.im-ui-icon-common-16-link-point-gray {
        line-height: 8px;
        height: 10px;
        margin-top: 10px;
        margin-bottom: 2px;
    }
</style>

<!-- ヘッド情報 -->

<div class="imui-form-container-wide" style="width: 95%;">
<!-- 代行ログイン時のみ表示されるメッセージ -->
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>

<nfwui:Form id="form" name="form" modelAttribute="form" enctype="multipart/form-data">
<table class="imui-form-search-condition" style="width: 100%; ">
            <td style="width: 50%; border: none;;background-color: #fdfdff;">
            
<imart:condition validity="${form.level1}" negative >
                <div class="imui-form-container-wide"style="width: 93%;">
                
     <!-- 申請者 -->
            <nfwui:Title id="applicationTitle" code="<%= MessageIdConstant.SKF1010_SC001_APPLICATION_TITLE %>" titleLevel="2" />
        <table class="imui-form-search-condition">

                    <tr>
                        <th>
                            <a href="/imart/skf/Skf2010Sc007/init?confirmationKbn=1" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="syatakuNyukyoKibotouTyousyo" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_NYUKYO_KIBOTOU_TYOUSYO %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                           <nfwui:LabelBox id="syatakuNyukyoKibotouTyousyoMessage" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_NYUKYO_KIBOTOU_TYOUSYO_MESSAGE %>" />
                        </td>
                    </tr> 
                    
                    <!--
                    <tr>
                        <th width="20%">
                            <a href="http://localhost:8080/imart/skf/Skf3090Sc004/init?menuFlg=1" class="imui-accent" style="margin-left: 8px">備品希望申請</a>
                        </th>
                        <td width="30%">
                            <font>備品を希望する場合に作成する申請です。<br>　　　</font>
                        </td>
                    </tr> 
                    -->
                    
                    <tr>
                        <th>
                            <a href="/imart/skf/Skf2010Sc007/init?confirmationKbn=2" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="syatakuTaikyo" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_TAIKYO %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="syatakuTaikyoMessage" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_TAIKYO_MESSAGE %>" />
                        </td>
                     </tr> 
                     <tr>
                      <th>
                            <a href="/imart/skf/Skf2010Sc003/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="syatakuSinseiZyokyoItiran" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_SINSEI_ZYOKYO_ITIRAN %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="syatakuSinseiZyokyoItiranMessage" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_SINSEI_ZYOKYO_ITIRAN_MESSAGE %>" /><br>
                       </td>

                     </tr>
                     
        </table>
</imart:condition>
</div>

<div name="daikoHide">
<imart:condition validity="${form.level2}" negative>
<div class="imui-form-container-wide" style="width: 93%;">
       <!-- 社宅窓口 -->
            <nfwui:Title id="windowTitle" code="<%= MessageIdConstant.SKF1010_SC001_WINDOW_TITLE %>" titleLevel="2" />
          
        <table class="imui-form-search-condition">

                    <ul class='imui-list-link-side'>
                     <tr>
                     
                      <imart:condition validity="${form.level2_1}" negative> 
                     <th>
                          <a href="/imart/skf/Skf2010Sc005/init" class="imui-accent" style="margin-left: 8px">
                          	<nfwui:LabelBox id="sinseiSyoruiSyonin" code="<%= MessageIdConstant.SKF1010_SC001_SINSEI_SYORUI_SYONIN %>" />
                          </a>
                      </th>
                      <td style="width: 60%;">
                          <nfwui:LabelBox id="sinseiSyoruiSyoninMessage" code="<%= MessageIdConstant.SKF1010_SC001_SINSEI_SYORUI_SYONIN_MESSAGE %>" /><br>
                      </td>
                      </imart:condition>
                    </tr>
                    <!--
                    <tr>
                      <th width="20%">
                          <a href="../S0011/S0011_ShatakuSearchPage.html" class="imui-accent" style="margin-left: 8px">申請書類を承認する（閲覧用）</a>
                      </th>
                      <td width="30%">
                          <font>申請書類の申請状況を確認します。<br>　　　</font>
                      </td>
                    </tr>
                    -->
                    
                    <!-- スペース-->
                    <tr style="border:none">
                       <td style="border:none">
                       </td>
                    </tr>

                    <tr>
                        <imart:condition validity="${form.level2_2}" negative> 
                        <th>
                            <a href="/imart/skf/Skf3010Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="syatakuKanri" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_KANRI %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="syatakuKanriMessage" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_KANRI_MESSAGE %>" /><br>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="/imart/skf/Skf3020Sc004/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="tenninsyaZyohoKanri" code="<%= MessageIdConstant.SKF1010_SC001_TENNINSYA_ZYOHO_KANRI %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="tenninsyaZyohoKanriMessage" code="<%= MessageIdConstant.SKF1010_SC001_TENNINSYA_ZYOHO_KANRI_MESSAGE %>" />
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <a href="/imart/skf/Skf3021Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="nyutaikyoZyohoKanri" code="<%= MessageIdConstant.SKF1010_SC001_NYUTAIKYO_ZYOHO_KANRI %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="nyutaikyoZyohoKanriMessage" code="<%= MessageIdConstant.SKF1010_SC001_NYUTAIKYO_ZYOHO_KANRI_MESSAGE %>" /><br>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="/imart/skf/Skf3022Sc005/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="teijiDataSakusei" code="<%= MessageIdConstant.SKF1010_SC001_TEIJI_DATA_SAKUSEI %>" />
                            </a>
                     </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="teijiDataSakuseiMessage" code="<%= MessageIdConstant.SKF1010_SC001_TEIJI_DATA_SAKUSEI_MESSAGE %>" /><br>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="/imart/skf/Skf2060Sc004/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="kariageKohoBukkenTeiji" code="<%= MessageIdConstant.SKF1010_SC001_KARIAGE_KOHO_BUKKEN_TEIJI %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="kariageKohoBukkenTeijiMessage" code="<%= MessageIdConstant.SKF1010_SC001_KARIAGE_KOHO_BUKKEN_TEIJI_MESSAGE %>" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="/imart/skf/Skf3030Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="syatakuKanriDaityoKakunin" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_KANRI_DAITYO_KAKUNIN %>" />
                            </a>
                        
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="syatakuKanriDaityoKakuninMessage" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_KANRI_DAITYO_KAKUNIN_MESSAGE %>" /><br>
                        </td>
                     </tr> 

                     <tr>
                        <th>
                            <a href="/imart/skf/Skf3050Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="syainZyohoKosin" code="<%= MessageIdConstant.SKF1010_SC001_SYAIN_ZYOHO_KOSIN %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="syainZyohoKosinMessage" code="<%= MessageIdConstant. SKF1010_SC001_SYAIN_ZYOHO_KOSIN_MESSAGE%>" /><br>
                        </td>
                         </imart:condition>
                    </tr>                

                    <tr>  
                    <imart:condition validity="${form.level2_3}" negative>
                        <th>
                            <a href="/imart/skf/Skf3050Sc002/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="tukizimeSyori" code="<%= MessageIdConstant.SKF1010_SC001_TUKIZIME_SYORI %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="tukizimeSyoriMessage" code="<%= MessageIdConstant.SKF1010_SC001_TUKIZIME_SYORI_MESSAGE %>" /><br>
                        </td>
                        </imart:condition>
                    </tr>  

                    <!-- スペース-->
                    <tr style="border:none">
                       <td style="border:none">
                       </td>
                    </tr>

                    <tr>
                    <imart:condition validity="${form.level2_4}" negative>
                        <th>
                            <a href="/imart/skf/Skf3040Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="rentaruBihinSizisyoSakusei" code="<%= MessageIdConstant.SKF1010_SC001_RENTARU_BIHIN_SIZISYO_SAKUSEI %>" />
                            </a>
                        
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="rentaruBihinSizisyoSakuseiMessage" code="<%= MessageIdConstant.SKF1010_SC001_RENTARU_BIHIN_SIZISYO_SAKUSEI_MESSAGE %>" /><br>
                        </td>
                    </tr>
                    
                    <!---->
                    <tr>
                        <th>
                            <a href="/imart/skf/Skf3040Sc002/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="bihinHannyuHansyutuKakunin" code="<%= MessageIdConstant.SKF1010_SC001_BIHIN_HANNYU_HANSYUTU_KAKUNIN %>" />
                            </a>
                        
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="bihinHannyuHansyutuKakuninMessage" code="<%= MessageIdConstant.SKF1010_SC001_BIHIN_HANNYU_HANSYUTU_KAKUNIN_MESSAGE %>" /><br>
                        </td>
                    </tr>
					</imart:condition>
                    <!-- スペース-->
                    <tr style="border:none">
                       <td style="border:none">
                       </td>
                    </tr>

                    <tr>
                    <imart:condition validity="${form.level2_5}" negative>
                        <th>
                            <a href="/imart/skf/Skf3070Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="hoteiTyosyoDataKanri" code="<%= MessageIdConstant.SKF1010_SC001_HOTEI_TYOSYO_DATA_KANRI %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="hoteiTyosyoDataKanriMessage" code="<%= MessageIdConstant.SKF1010_SC001_HOTEI_TYOSYO_DATA_KANRI_MESSAGE %>" />
                        </td>
                    </imart:condition>
                    </tr>
                    <tr>
                    <imart:condition validity="${form.level2_6}" negative>
                        <th>
                            <a href="/imart/skf/Skf3060Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="nenreiSiyoryoHenkoTuti" code="<%= MessageIdConstant.SKF1010_SC001_NENREI_SIYORYO_HENKO_TUTI %>" />
                            </a>                        
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="nenreiSiyoryoHenkoTutiMessage" code="<%= MessageIdConstant.SKF1010_SC001_NENREI_SIYORYO_HENKO_TUTI_MESSAGE %>" /><br>
                        </td>
                    </imart:condition>
                    </tr>

                    </ul>

        </table>
        
        </div>
        </div>
</imart:condition>        
<imart:condition validity="${form.level3}" negative>      
        <div class="imui-form-container-wide" style="width: 93%;">

       <!-- 管理者 --><!-- 次の内容はIM共通機能利用で、不要になるかも　操作ログメンテナンス、代行ログイン、お知らせ管理画面、メニューメンテナンス、機能権限マスタメンテナンス-->
            <nfwui:Title id="administratorTitle" code="<%= MessageIdConstant.SKF1010_SC001_ADMINISTRATOR_TITLE %>" titleLevel="2" />
        <table class="imui-form-search-condition">
         <ul class='imui-list-link-side'>
    
                    <tr>

                        <th>
                            <a href="/imart/skf/Skf2010Sc008/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="daikoLogin" code="<%= MessageIdConstant.SKF1010_SC001_DAIKO_LOGIN %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="daikoLoginMessage" code="<%= MessageIdConstant.SKF1010_SC001_DAIKO_LOGIN_MESSAGE %>" /><br>
                        </td>
                    </tr>
                    
                    <tr name="daikoHide">
                        <th>
                            <a href="/imart/skf/Skf3090Sc008/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="osiraseMasutaMaintenance" code="<%= MessageIdConstant.SKF1010_SC001_OSIRASE_MASUTA_MAINTENANCE %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="osiraseMasutaMaintenanceMessage" code="<%= MessageIdConstant.SKF1010_SC001_OSIRASE_MASUTA_MAINTENANCE_MESSAGE %>" /><br>
                        </td>
                    </tr>

                    <tr name="daikoHide">
                      <th>
                          <a href="/imart/skf/Skf3090Sc004/init" class="imui-accent" style="margin-left: 8px">
                          	<nfwui:LabelBox id="zyugyoinMasutaMaintenance" code="<%= MessageIdConstant.SKF1010_SC001_ZYUGYOIN_MASUTA_MAINTENANCE %>" />
                          </a>
                      </th>
                      <td style="width: 60%;">
                          <nfwui:LabelBox id="zyugyoMasutaMaintenanceMessage" code="<%= MessageIdConstant.SKF1010_SC001_ZYUGYOIN_MASUTA_MAINTENANCE_MESSAGE %>" /><br>
                      </td>
                    </tr>
                    
                    <tr name="daikoHide">
                      <th>
                          <a href="/imart/skf/Skf3090Sc006/init" class="imui-accent" style="margin-left: 8px">
                          	<nfwui:LabelBox id="soshikiMasutaMaintenance" code="<%= MessageIdConstant.SKF1010_SC001_SOSHIKI_MASUTA_MAINTENANCE %>" /> 
                          </a>
                      </th>
                      <td style="width: 60%;">
                          <nfwui:LabelBox id="soshikiMasutaMaintenanceMessage"  code="<%= MessageIdConstant.SKF1010_SC001_SOSHIKI_MASUTA_MAINTENANCE_MESSAGE %>" /><br>
                      </td>
                    </tr>
                    <!--
                    <tr>
                      <th width="20%">
                          <a href="../S0000/S0010_ShinseiJokenKakunin.html" class="imui-accent" style="margin-left: 8px">メニューマスタメンテナンス</a>
                      </th>
                      <td width="30%">
                          <font >各メニューの閲覧権限を、権限グループごとに設定します。</font>
                      </td>
                    </tr>
                    -->
                    
                    <tr name="daikoHide">
                      <th>
                            <a href="/imart/skf/Skf3090Sc001/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="genbutuSikyuKagakuMasutaMaintenance" code="<%= MessageIdConstant.SKF1010_SC001_GENBUTU_SIKYU_KAGAKU_MASUTA_MAINTENANCE %>" />
                            </a>
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="genbutuSikyuKagakuMasuatMaintenanceMessage" code="<%= MessageIdConstant.SKF1010_SC001_GENBUTU_SIKYU_KAGAKU_MASUTA_MAINTENANCE_MESSAGE %>" /><br>
                      </td>
                    </tr>
                    
                    <tr name="daikoHide">
                        <th>
                            <a href="/imart/skf/Skf3090Sc003/init" class="imui-accent" style="margin-left: 8px">
                            	<nfwui:LabelBox id="zigyoRyoikiMasutaMaintenance" code="<%= MessageIdConstant.SKF1010_SC001_ZIGYO_RYOIKI_MASUTA_MAINTENANCE %>" />
                            </a>                        
                        </th>
                        <td style="width: 60%;">
                            <nfwui:LabelBox id="zigyoRyoikiMasutaMaintenanceMessage" code="<%= MessageIdConstant.SKF1010_SC001_ZIGYO_RYOIKI_MASUTA_MAINTENANCE_MESSAGE %>" /><br>
                        </td>
                    </tr>
         </ul>
        </table>
        </div>
</imart:condition>  
<imart:condition validity="${form.level4}" negative>      
<div class="imui-form-container-wide" style="width: 93%;">
            <nfwui:Title id="difficultOperationTitle" code="<%= MessageIdConstant.SKF1010_SC001_DIFFICULT_OPERATION_TITLE %>" titleLevel="2" />
        <table class="imui-table">
            <tr>

                    <ul class='imui-list-link-side'>
                    <tr style="width: 100px; max-width:100px;" >
                        <th>
                            <a id="downloadManualGeneral" name="downloadManual" >
                            	マニュアル（一般）
                            </a>	
                            	<input type="hidden" id="manual" name="manual" value="${form.manual}" />
                        </th>
                    </tr>
                    <tr>
                    <imart:condition validity="${form.level4_1}" negative>
                    <tr style="width: 100px; max-width:100px;" >
                        <th>
                            <a id="downloadManualManager" name="downloadManual" >
                            	マニュアル（管理）
                            </a>	
                            	<input type="hidden" id="manual" name="manual" value="${form.manual}" />
                        </th>
                    </tr>
                     </imart:condition>
                    <tr>
                    <imart:condition validity="${form.level4_2}" negative> 
                        <th>
                            <a id="downloadManualShataku" name="downloadManual" >
                            	マニュアル（社宅管理）
                            </a>	
                            	<input type="hidden" id="manual" name="manual" value="${form.manual}" />
                        </td>
					 </imart:condition>
                     <tr> 
                    </ul>
            </tr>
        </table>
</imart:condition>
    </div>

    </div>
                </div>  
            </td>

            <td style="width: 49%; border: none;;background-color: #fdfdff;">
<imart:condition validity="${form.level5}" negative> 
            <!-- 未処理情報 -->
            <div name="daikoHide">
                <div class="imui-form-container-wide" style="width: 94%;">
                    <table>
                    <nfwui:Title id="rawInformation" code="<%= MessageIdConstant.SKF1010_SC001_RAW_INFORMATION_TITLE %>" titleLevel="2" />
                                <tr>
                                                                        <table class="imui-form-search-condition" style="width:100%;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:520px;">
                                                    <nfwui:LabelBox id="lblMessage1" code="<%= MessageIdConstant.SKF1010_SC001_MESSAGE %>" />
                                                    </th>
                                                    <th style="width:80px;text-align:center">
                                                    <nfwui:LabelBox id="lblNumber" code="<%= MessageIdConstant.SKF1010_SC001_NUMBER %>" />
                                                    </th>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                    	<nfwui:LabelBox id="syatakuNyukyoNotKibo" code="<%= MessageIdConstant.SKF1010_SC001_SYATAKU_NYUKYO_NOT_KIBO %>" />
                                                    </td>
                                                    <td style="text-align:center;"   colspan="5" >
                                                     <nfwui:Link id="nyutaikyoCount1" name="nyutaikyoCount1" label="${form.nyutaikyoCount1}件" use="anchor" href="/imart/skf/Skf3022Sc005/init" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        <nfwui:LabelBox id="taikyoTodokeNotSinsei" code="<%= MessageIdConstant.SKF1010_SC001_TAIKYO_TODOKE_NOT_SINSEI %>" />
                                                    </td>
                                                    <td style="text-align:center;"   colspan="5" >
                                                     <nfwui:Link id="nyutaikyoCount2" name="nyutaikyoCount2" label="${form.nyutaikyoCount2}件" use="anchor" href="/imart/skf/Skf3022Sc005/init" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="imui-form-search-condition" style="width:100%;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:520px;">
                                                    <nfwui:LabelBox id="lblMessage2" code="<%= MessageIdConstant.SKF1010_SC001_MESSAGE %>" />
                                                    </th>
                                                    <th style="width:40px;text-align:center">
                                                    <nfwui:LabelBox id="lblHonsya" code="<%= MessageIdConstant.SKF1010_SC001_HONSYA %>" />
                                                    </th>
                                                    <th style="width:40px;text-align:center">
                                                    <nfwui:LabelBox id="lblTokyo" code="<%= MessageIdConstant.SKF1010_SC001_TOKYO %>" />
                                                    </th>
                                                    <th style="width:40px;text-align:center">
                                                    <nfwui:LabelBox id="lblHatiouzi" code="<%= MessageIdConstant.SKF1010_SC001_HATIOUZI %>" />
                                                    </th>
                                                    <th style="width:40px;text-align:center">
                                                    <nfwui:LabelBox id="lblNagoya" code="<%= MessageIdConstant.SKF1010_SC001_NAGOYA %>" />
                                                    </th>
                                                    <th style="width:40px;text-align:center">
                                                    <nfwui:LabelBox id="lblKanazawa" code="<%= MessageIdConstant.SKF1010_SC001_KANAZAWA %>" />
                                                    </th>
                                                </tr>

										<c:forEach var="nyutaikyoInformation" items="${form.nyutaikyoInformationList}">                                                    
                                                <tr>
                                                    <td style="text-align:left;">
                                                    <nfwui:LabelBox id="syatakuNyukyoAppl${nyutaikyoInformation.index }" code="${nyutaikyoInformation.label}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="honsha${nyutaikyoInformation.index}" name="honsha${nyutaikyoInformation.index}" label="${nyutaikyoInformation.nyutaikyoHonsha}件" use="anchor" href="${nyutaikyoInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="tokyo${nyutaikyoInformation.index}" name="tokyo${nyutaikyoInformation.index}" label="${nyutaikyoInformation.nyutaikyoTokyo}件" use="anchor" href="${nyutaikyoInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="hatiouzi${nyutaikyoInformation.index}" name="hatiouzi${nyutaikyoInformation.index}" label="${nyutaikyoInformation.nyutaikyoHatiouzi}件" use="anchor" href="${nyutaikyoInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="nagoya${nyutaikyoInformation.index}" name="nagoya${nyutaikyoInformation.index}" label="${nyutaikyoInformation.nyutaikyoNagoya}件" use="anchor" href="${nyutaikyoInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="kanazawa${nyutaikyoInformation.index}" name="kanazawa${nyutaikyoInformation.index}" label="${nyutaikyoInformation.nyutaikyoKanazawa}件" use="anchor" href="${nyutaikyoInformation.link}" />
                                                    </td>
                                                </tr>
 										</c:forEach>                                                   
										<c:forEach var="bihinKiboInformation"  items="${form.bihinKiboInformationList}">                                              
                                                <tr>
                                                    <td style="text-align:left;">
                                                    <nfwui:LabelBox id="bihinKibo${bihinKiboInformation.index}" code="${bihinKiboInformation.label}" />    
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="honsha${bihinKiboInformation.index}" name="honsha${bihinKiboInformation.index}" label="${bihinKiboInformation.bihinKiboHonsha}件" use="anchor" href="${bihinKiboInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="tokyo${bihinKiboInformation.index}" name="tokyo${bihinKiboIformation.index}" label="${bihinKiboInformation.bihinKiboTokyo}件" use="anchor" href="${bihinKiboInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="hatiouzi${bihinKiboInformation.index}" name="hatiouzi${bihinKiboInformation.index}" label="${bihinKiboInformation.bihinKiboHatiouzi}件" use="anchor" href="${bihinKiboInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="nagoya${bihinKiboInformation.index}" name="nagoya${bihinKiboInformation.index}" label="${bihinKiboInformation.bihinKiboNagoya}件" use="anchor" href="${bihinKiboInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="kanazawa${bihinKiboInformation.index}" name="kanazawa${bihinKiboInformation.index}" label="${bihinKiboInformation.bihinKiboKanazawa}件" use="anchor" href="${bihinKiboInformation.link}" />
                                                    </td>

                                                </tr>
										</c:forEach>                                                
                                                <tr>
                                                    <td style="text-align:left;">
                                                      <nfwui:LabelBox id="bihinHenkyakuUnfinisheedTips" code="<%= MessageIdConstant.SKF1010_SC001_BIHIN_HENKYAKU_UNFINISHED_TIPS %>" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <nfwui:Link id="bihinHenkyakuUnfinishedTipsHonsha" name="bihinHenkyakuUnfinishedTipsHonsha" label="${form.bihinHenkyakuUnfinishedTipsHonsha}件" use="anchor" href="/imart/skf/Skf3022Sc005/init" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <nfwui:Link id="bihinHenkyakuUnfinishedTipsTokyo" name="bihinHenkyakuUnfinishedTipsTokyo" label="${form.bihinHenkyakuUnfinishedTipsTokyo}件" use="anchor" href="/imart/skf/Skf3022Sc005/init" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <nfwui:Link id="bihinHenkyakuUnfinishedTipsHatiouzi" name="bihinHenkyakuUnfinishedTipsHatiouzi" label="${form.bihinHenkyakuUnfinishedTipsHatiouzi}件" use="anchor" href="/imart/skf/Skf3022Sc005/init" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <nfwui:Link id="bihinHenkyakuUnfinishedTipsNagoya" name="bihinHenkyakuUnfinishedTipsNagoya" label="${form.bihinHenkyakuUnfinishedTipsNagoya}件" use="anchor" href="/imart/skf/Skf3022Sc005/init" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    <nfwui:Link id="bihinHenkyakuUnfinishedTipsKanazawa" name="bihinHenkyakuUnfinishedTipsKanazawa" label="${form.bihinHenkyakuUnfinishedTipsKanazawa}件" use="anchor" href="/imart/skf/Skf3022Sc005/init" />
                                                    </td>

                                                </tr>
                                         <c:forEach var="bihinHenkyakuInformation"  items="${form.bihinHenkyakuInformationList}">
                                                <tr>
                                                    <td style="text-align:left;">
                                                    <nfwui:LabelBox id="bihinHenkyaku${bihinHenkyakuInformation.index}" code="${bihinHenkyakuInformation.label}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <nfwui:Link id="honsha${bihinHenkyakuInformation.index}" name="honsha${bihinHenkyakuInformation.index}" label="${bihinHenkyakuInformation.bihinHenkyakuHonsha}件" use="anchor" href="${bihinHenkyakuInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    	<nfwui:Link id="tokyo${bihinHenkyakuInformation.index}" name="tokyo${bihinHenkyakuInformation.index}" label="${bihinHenkyakuInformation.bihinHenkyakuTokyo}件" use="anchor" href="${bihinHenkyakuInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <nfwui:Link id="hatiouzi${bihinHenkyakuInformation.index}" name="hatiouzi${bihinHenkyakuInformation.index}" label="${bihinHenkyakuInformation.bihinHenkyakuHatiouzi}件" use="anchor" href="${bihinHenkyakuInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <nfwui:Link id="nagoya${bihinHenkyakuInformation.index}" name="nagoya${bihinHenkyakuInformation.index}" label="${bihinHenkyakuInformation.bihinHenkyakuNagoya}件" use="anchor" href="${bihinHenkyakuInformation.link}" />
                                                    </td>
                                                    <td style="text-align:right;">
                                                    	<nfwui:Link id="kanazawa${bihinHenkyakuInformation.index}" name="kanazawa${bihinHenkyakuInformation.index}" label="${bihinHenkyakuInformation.bihinHenkyakuKanazawa}件" use="anchor" href="${bihinHenkyakuInformation.link}" />
                                                    </td>

                                                </tr>
                                         </c:forEach>
                                            </tbody>
                                        </table>
                </div>  
             </div>
</imart:condition>              
            <!-- 個人に関するお知らせ -->
            <div name="daikoHide">
                <div class="imui-form-container-wide" style="width: 94%;">
                    <table>
                            <nfwui:Title id="personalInformationTitle" code="<%= MessageIdConstant.SKF1010_SC001_PERSONAL_INFORMATION_TITLE %>" titleLevel="2"  />
                        		<div style="overflow-y:scroll;height:280px;max-height: 280px;" id="personalOshirase">
                           			<c:forEach var="oshiraseList"  items="${form.oshiraseList}">
                          				 ${oshiraseList.message} <br>
                           			</c:forEach>
                        		</div>
                    </table>
                </div>
             </div>
</nfwui:Form>
              <!-- システムに関するお知らせ -->
              <div name="daikoHide">
                <div class="imui-form-container-wide" style="width: 94%;">
                    <table style="width: 100%;">
                            <nfwui:Title id="sysytemAnnouncementsTitle" code="<%= MessageIdConstant.SKF1010_SC001_SYSTEM_ANNOUNCEMENTS_TITLE %>" titleLevel="2" />
                        		<div style="overflow-y:scroll;height:280px;max-height: 280px;">
                            		${form.note}
                        		</div>
                    </table>
                </div>
             </div>

</table>
    </div>
    
    </div>
    
    </div>
    
    <script type="text/javascript">
    (function($) {
    	$("[name=downloadManual]").click(function(){
    		var id = $(this).attr("id");
    		var manual = id.replace("downloadManual", "").toLowerCase();
    		$('#manual').val(manual);
    		nfw.common.submitForm("form", "skf/Skf1010Sc001/download", this);
    	});
    })(jQuery);
    </script>
    <!-- コンテンツエリア　ここまで -->