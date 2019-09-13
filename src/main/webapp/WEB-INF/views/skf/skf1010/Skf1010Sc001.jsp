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

<!-- インクルード -->

<!-- メッセージを表示するためのJavaScript（モック時はコメント）
<script type="text/javascript">
    var INFO=""
        if(INFO!=""){
            imuiShowSuccessMessage(INFO);
        }
    window.onload=function(){
        $(".hasDatepicker").each(function(e){
            $(this).css("width","100px");
        });
        if($("#errMainDiv").children().length!=undefined && $("#errMainDiv").children().length>1){
            $("#errMainDiv").css("display","inline-block");
        }
        
    };
    var W_GFK_0001 = "{0}を行います。<br/>よろしいですか？";
    var W_GFK_0002 = "前画面に戻ります。<br/>入力途中のものがあれば破棄されます。よろしいですか？";
    var W_GFK_0003 = "画面の再表示を行います。<br/>よろしいですか？";
    var W_GFK_0004 = "入力情報が破棄されますが、よろしいですか？";
    var W_GFK_0005 = "復旧工事を「無」に選択した工事担当の工事費用登録情報は削除されますが、よろしいですか？";
    var W_GFK_0006 = "登録後の修正はできません。登録を続けてよろしいですか？";
    var I_GFK_0001 = "{0}処理が正常に終了しました。{1}";

    var E_GFK_0001 = "未入力の項目があります。";
    var E_GFK_1001 = "当該データは他のユーザによって既に処理されました。{0}";
    var E_GFK_0006 = "指定した文字列の属性が不正です。{type}";
    var E_GFK_0012 = "登録対象を選択してください。";
    var E_GFK_0014 = "選択されたファイルはCSVファイルでないため取込できません。";
    var E_GFK_0015 = "取込対象ファイルが0件です。";
    var E_GFK_0016 = "取込対象ファイルの項目数が不正です。";
    var E_GFK_0020 = "削除対象を選択してください。";
    var E_GFK_0022 = "登録ボタン押下前に計算ボタンを押下してください。";
    var E_GFK_0023 = "債権の明細が0件となるため削除できません。";
    var E_GFK_0070 = "{0}に、締め年月以前の日付は設定できません。";
    var E_GFK_0071 = "{0}が締め年月以前のため、取消できません。";
    var E_GFK_0073 = "削除対象の明細が存在しません。";
    var E_GFK_0075 = "メニューグループが設定されていません。";
    var E_GFK_0076 = "認可設定が存在しません。";
</script>
-->

    <!-- 確認ダイアログ表示用（モック作成時は特に変更する必要なし） -->
    <div name="imui-8euqak4j4tsbrtq" id="confirm_dialog" style="display: none;">
        <div>
            <div style="float:left;width:15%;">
                <span class="im-ui-icon-common-32-question imui-icon-float-left"></span>
            </div>
            <div style="float:left;width:85%;padding-top:10px;">
                <span id="message_confirm"></span>
            </div>
        </div>
    </div>
    <!--                                   JavaScriptエラーなのでコメントアウト
    <script type="text/javascript">
        jQuery(function () {jQuery("#confirm_dialog").imuiDialog({"buttons":[{"name":"imui-8euqak4j4tsbttq","text":"はい","id":"imui-8euqak4j4tsbstq","click":button_ok},{"name":"imui-8euqak4j4tsbvtq","text":"いいえ","id":"imui-8euqak4j4tsbutq","click":button_ng}],"autoOpen":false,"show":{"effect":"fade"},"title":"確認","modal":true});});
    </script>
    -->
    

    <!-- アラートダイアログ表示用（モック作成時は特に変更する必要なし） -->
    <!-- 
    <div name="imui-8euqak4j4tsbwtq" id="alert_dialog" style="display: none;">
        <span class="im-ui-icon-common-32-tick imui-icon-float-left"></span>
        <span style="width:30px;"></span>
        <span id="message_alert"></span>
    </div>
    <script type="text/javascript">
        jQuery(function () {jQuery("#alert_dialog").imuiDialog({"buttons":[{"name":"imui-8euqak4j4tsbytq","text":"確認","id":"imui-8euqak4j4tsbxtq","click":button_alert}],"autoOpen":false,"show":{"effect":"fade"},"modal":true});});
    </script>
    -->
    

    <!-- ワーニングダイアログ表示用（モック作成時は特に変更する必要なし） -->
<!--     <div name="imui-8euqak4j5tsbztq" id="warning_dialog" style="display: none;"> -->
<!--         <span class="im-ui-icon-common-32-warning imui-icon-float-left"></span> -->
<!--         <span id="message_warning"></span> -->
<!--     </div> -->
<!--     <script type="text/javascript"> -->
<!--         jQuery(function () {jQuery("#warning_dialog").imuiDialog({"buttons":[{"name":"imui-8euqak4j5tsc1tq","text":"確認","id":"imui-8euqak4j5tsc0tq","click":button_warning}],"autoOpen":false,"show":{"effect":"fade"},"modal":true});}); -->
<!--     </script> -->

<!--     <div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv"> -->
<!--         <div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;"> -->
<!--         </div>  -->
<!--     </div> -->

    <!-- 画面タイトル表示域（モック作成時は特に変更する必要なし） -->
<!--     <div class="imui-title" style="width: 100%"> -->
<!--         <h1>社宅申請システム</h1> -->
<!--     </div> -->

    <!-- エラーメッセージ表示域（モック作成時は特に変更する必要なし） -->
    <div id="errdiv" class="alert alert-error notshow"></div>

    <!-- コンテンツエリア -->
    
<div class="imui-form-container-wide" style="width: 95%;">
<!-- 代行ログイン時のみ表示されるメッセージ -->
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>

<nfwui:Form id="form" name="form" modelAttribute="form">
<table class="imui-form-search-condition" style="width: 100%; ">
            <td style="width: 50%; border: none;;background-color: #fdfdff;">
            
<imart:condition validity="${form.level1}" negative >
                <div class="imui-form-container-wide"style="width: 93%;">
                
     <!-- 申請者 -->
            <nfwui:Title id="applicationTitle" code="<%= MessageIdConstant.SKF1010_SC001_APPLICATION_TITLE %>" titleLevel="2" />
        <table class="imui-form-search-condition">

                    <tr>
                        <th>
                            <a href="http://localhost:8080/imart/skf/Skf2010Sc007/init?confirmationKbn=1" class="imui-accent" style="margin-left: 8px">社宅入居希望等調書</a>
                        </th>
                        <td style="width: 60%;">
                            <font>社宅・寮に入居したい場合に作成する申請書類です。(※併せて退居が発生する場合、退居届も自動で作成されます。)</font>
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
                            <a href="http://localhost:8080/imart/skf/Skf3090Sc004/init?menuFlg=1" class="imui-accent" style="margin-left: 8px">社宅（自動車保管場所）退居届</a>
                        </th>
                        <td style="width: 60%;">
                            <font>社宅・寮を退居する場合及び駐車場を返還する場合に作成する申請書類です。</font>
                        </td>
                     </tr> 
                     <tr>
                      <th>
                            <a href="../S0008/S0008_ShinseiJokyoIchiran_IppanUserVer.html" class="imui-accent" style="margin-left: 8px">社宅申請状況一覧</a>
                        </th>
                        <td style="width: 60%;">
                            <font>申請書類を確認します。<br>　　　</font>
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
                          <a href="../S0010/S0010_ShatakuSearchPage_UnderButton.html" class="imui-accent" style="margin-left: 8px">申請書類を承認する</a>
                      </th>
                      <td style="width: 60%;">
                          <font>申請者への提示、および申請書類の承認を行います。<br>　　　</font>
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
                            <a href="../S1001/S1001_ShatakuSearchPage.html" class="imui-accent" style="margin-left: 8px">社宅を管理する</a>
                        </th>
                        <td style="width: 60%;">
                            <font>社宅の登録を行います。<br>　　</font>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="../S2003/S2003_TenninshaSearchPage.html" class="imui-accent" style="margin-left: 8px">転任者情報を管理する</a>
                        </th>
                        <td style="width: 60%;">
                            <font >転任者情報の登録、一覧を表示します。<br>また、転任者調書(Excel)の取込を行います。</font>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <a href="../S2005/S2005_NyutaikyoYoteiSearchPage.html" class="imui-accent" style="margin-left: 8px">入退居情報を管理する</a>
                        </th>
                        <td style="width: 60%;">
                            <font >入退居予定の一覧を表示します。<br>　　　</font>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="../S2006/S2006_TeijiDataSearchPage.html" class="imui-accent" style="margin-left: 8px">提示データを作成する</a>
                     </th>
                        <td style="width: 60%;">
                            <font >提示データの作成を行います。<br>　　　</font>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="../S0025/S0025_KariageKouhoBukkenJokyoIchiran.html" class="imui-accent" style="margin-left: 8px">借上候補物件を提示する</a>
                        </th>
                        <td style="width: 60%;">
                            <font >借上候補物件の提示情報の完了、および申請者への提示を行います。</font><br/><br/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <a href="../S3001/S3001_ShatakuKanriDaichoSearchPage.html" class="imui-accent" style="margin-left: 8px">社宅管理台帳を確認する</a>
                        
                        </th>
                        <td style="width: 60%;">
                            <font >社宅管理台帳の確認を行います。<br>　　　　</font>
                        </td>
                     </tr> 

                     <tr>
                        <th>
                            <a href="../S5001/S5001_SyainBangouIkkatsuSettei.html" class="imui-accent" style="margin-left: 8px">社員情報を一括更新する</a>
                        </th>
                        <td style="width: 60%;">
                            <font >社員番号の一括設定を行います。<br>　　　</font>
                        </td>
                         </imart:condition>
                    </tr>                

                    <tr>  
                    <imart:condition validity="${form.level2_3}" negative>
                        <th>
                            <a href="../S5002/S5002_GetsujiUnyouKanri.html" class="imui-accent" style="margin-left: 8px">月締め処理を行う</a>
                        </th>
                        <td style="width: 60%;">
                            <font >月次の運用管理を行います。<br>　　　</font>
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
                            <a href="../S4001/S4001_RentalBihinShijishoPage.html" class="imui-accent" style="margin-left: 8px">レンタル備品指示書を作成する</a>
                        
                        </th>
                        <td style="width: 60%;">
                            <font >レンタル備品指示書を出力します。<br>　　</font>
                        </td>
                    </tr>
                    
                    <!---->
                    <tr>
                        <th>
                            <a href="../S4002/S4002_BihinHannyuHanshutsuCheckListPage.html" class="imui-accent" style="margin-left: 8px">備品搬入・搬出確認リストを作成する</a>
                        
                        </th>
                        <td style="width: 60%;">
                            <font >備品搬入・搬出確認リストを出力します。<br>　　</font>
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
                            <a href="../所有者情報一覧・詳細/S0000_ShoyushaJouhouIchiran.html" class="imui-accent" style="margin-left: 8px">法定調書データを管理する</a>
                        </th>
                        <td style="width: 60%;">
                            <font >法定調書を作成するに当たり、必要な情報の管理、出力を行います。</font><br/><br/>
                        </td>
                    </imart:condition>
                    </tr>
                    <tr>
                    <imart:condition validity="${form.level2_6}" negative>
                        <th>
                            <a href="../S6001/S6001_AgeKasanSearchPage.html" class="imui-accent" style="margin-left: 8px">年齢による使用料の変更通知</a>                        
                        </th>
                        <td style="width: 60%;">
                            <font >年齢による社宅の使用料の変更通知の設定を行います。<br>　　　</font>
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
                            <a href="http://localhost:8080/imart/skf/Skf2010Sc008/init" class="imui-accent" style="margin-left: 8px">代行ログイン</a>
                        </th>
                        <td style="width: 60%;">
                            <font >代行ログインを行います。<br>　　　</font>
                        </td>
                    </tr>
                    
                    <tr name="daikoHide">
                        <th>
                            <a href="../S9110/S9110_OshiraseMasterMaintenance.html" class="imui-accent" style="margin-left: 8px">お知らせマスタメンテナンス</a>
                        </th>
                        <td style="width: 60%;">
                            <font >システムに関するお知らせ欄の管理を行います。<br>　　　</font>
                        </td>
                    </tr>

                    <tr name="daikoHide">
                      <th>
                          <a href="../S9004/S9004_UserMasterIchiran.html" class="imui-accent" style="margin-left: 8px">従業員マスタメンテナンス</a>
                      </th>
                      <td style="width: 60%;">
                          <font >社宅利用者の従業員マスタを管理します。<br>　　　</font>
                      </td>
                    </tr>
                    
                    <tr name="daikoHide">
                      <th>
                          <a href="http://localhost:8080/imart/skf/Skf3090Sc006/init" class="imui-accent" style="margin-left: 8px">組織マスタメンテナンス</a>
                      </th>
                      <td style="width: 60%;">
                          <font >社宅申請システム利用者の組織を管理します。<br>　　　</font>
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
                            <a href="../S9001/S9001_GenbutsuShikyukagakuMasterIchiran.html" class="imui-accent" style="margin-left: 8px">現物支給価額マスタメンテナンス</a>
                        </th>
                        <td style="width: 60%;">
                            <font >現物支給価額の管理を行います。<br>　　　</font>
                      </td>
                    </tr>
                    
                    <tr name="daikoHide">
                        <th>
                            <a href="../S9003/S9003_JigyoRyouikiMasrerTouroku_before.html" class="imui-accent" style="margin-left: 8px">事業領域マスタメンテナンス</a>                        
                        </th>
                        <td style="width: 60%;">
                            <font >事業領域の管理を行います。<br>　　　</font>
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
                            <a href="../S0000/S0010_ShinseiJokenKakunin.html" class="imui-accent" style="margin-left: 8px">マニュアル(一般)</a>
                        </th>
                    </tr>
                    <tr>
                    <imart:condition validity="${form.level4_1}" negative> 
                        <th>
                            <a href="../S0000/S0010_SyatakuNyukyoKibouChoushoPage_UnderButton.html" class="imui-accent" style="margin-left: 8px">マニュアル(管理)</a>
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
                                                        社宅入居希望等調書の申請が無い入居情報があります。督促メールを送信してください。
                                                    </td>
                                                    <td style="text-align:center;"   colspan="5" >
                                                        <a href="" class="imui-accent" style="margin-left: 8px;text-align:center;">
                                                        0件
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        退居届の申請が無い退居情報があります。督促メールを送信してください。
                                                    </td>
                                                    <td style="text-align:center;"   colspan="5" >
                                                        <a href="" class="imui-accent" style="margin-left: 8px;text-align:center;">
                                                        0件
                                                        </a>
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

                                                <tr>
                                                    <td style="text-align:left;">
                                                        社宅入居希望等調書の申請があります。<br>申請内容を確認してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        入居希望者に社宅提示が完了していないデータあります。<br>社宅を提示してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        提示社宅の本人確認が完了していないデータがあります。<br>督促メールを送信してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        入居希望者の同意済のデータがあります。<br>承認してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        入居希望者の同意されなかったデータがあります。<br>社宅を提示してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        退居届の申請があります。<br>申請内容を確認してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        備品希望の申請が無い入居情報があります。<br>督促メールを送信してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        備品希望の提示が完了していないデータがあります。<br>備品内容を提示してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        備品希望の搬入が完了していないデータがあります。<br>督促メールを送信してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                        
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                        
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                        
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                        
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                        
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        備品返却の提示が完了していないデータがあります。<br>備品返却対象を提示してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        備品返却提示の本人確認が完了していないデータがあります。<br>督促メールを送信してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        備品返却提示の同意済のデータがあります。<br>内容を確認してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        備品の搬出が完了していないデータがあります。<br>督促メールを送信してください。
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <a href="" class="imui-accent" style="margin-left: 8px">
                                                        0件
                                                        </a>
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table>
                </div>  
             </div>
</imart:condition>              
            <!-- 個人に関するお知らせ -->
            <div name="daikoHide">
                <div class="imui-form-container-wide" style="width: 94%;">
                    <table >
                            <nfwui:Title id="personalInformationTitle" code="<%= MessageIdConstant.SKF1010_SC001_PERSONAL_INFORMATION_TITLE %>" titleLevel="2"  />　
                        <div style="overflow-y:scroll;height:280px;max-height: 280px;">
                            2018/11/01「社宅入居希望等調書」&nbsp;の案内が通知されましたので内容を確認して下さい。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>
                            2018/11/01名古屋支社&nbsp;建設事業部&nbsp;中日本3906(00903906)さんが「社宅入居希望等調書」に同意しました。内容を確認後承認してください。<br>

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

    <!-- メッセージを表示するためのJavaScript（モック時はコメント）
    <script type="text/javascript">
        $(function() {
            showWarningDialog('', 'true');
        });
    </script>
    -->

    </div>
    <!-- コンテンツエリア　ここまで -->