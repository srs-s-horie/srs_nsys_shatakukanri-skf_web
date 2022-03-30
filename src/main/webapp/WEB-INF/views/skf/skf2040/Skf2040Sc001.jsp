<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<% // 代行ログイン時CSS読み込み箇所ここから  %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<% // 代行ログイン時CSS読み込み箇所ここまで %>

<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>

<script src="scripts/skf/skfCommon.js"></script>

<% //コメントボタンCSSを読み込み %>
<link href="styles/skf/CommentBtnStyle.css" rel="stylesheet" type="text/css">

<!-- フッターエリア CSS-->
<style type="text/css">
    div.btnLeft{
        text-align: left;
        float: left;
    }

    div.btnRight{
        text-align: right;
    }
    
    .imui-form-search-condition {
      height: auto; /*操作ガイド領域の高さに入力領域の高さが左右されないようにする*/
      width: 100%;
      border: 0px;
      margin-bottom: 10px;
      border-collapse: collapse;
      -webkit-box-shadow: 0px 1px 1px #ffffff;
      -moz-box-shadow: 0px 1px 1px #ffffff;
      box-shadow: 0px 1px 1px #ffffff;
      color: #333333;
    }
}
</style>
<!-- コンテンツエリア-->
<!-- 代行ログイン時のみ表示-->
<jsp:include page="../common/INC_SkfAlterLoginCss.jsp"/>
<nfwui:Form id="form" name="form" modelAttribute="form">
    <div class="imui-form-container-wide">
        <table class="imui-form-search-condition">
            <tbody>
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff;">
                        <!-- 左側の入力域の部分 -->
                        
                        <table class="imui-form-search-condition">
                        <nfwui:Title id="searchTitle" code="<%= MessageIdConstant.SKF2040_SC001_APPL_INFO %>" titleLevel="2" />
                            <tbody>
                                <!-- 機関 -->
                                <tr>
                                    
                                    <th colspan="3" style="width: 30%;">
                                        <nfwui:LabelBox id="lblHeadAgency" code="<%= MessageIdConstant.SKF2040_SC001_AGENCY %>" />
                                    </th>
                                    <td colspan="2">
                                        ${f:h(form.agencyName)}
                                    </td>
                                </tr>
                                <!-- 部等 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadAffiliation1" code="<%= MessageIdConstant.SKF2020_SC002_AFFLIATION1 %>" />
                                    </th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation1Name)}
                                    </td>
                                </tr>
                                <!-- 室・課等 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadAffiliation2" code="<%= MessageIdConstant.SKF2020_SC002_AFFLIATION2 %>" />
                                    </th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation2Name)}
                                    </td>
                                </tr>
                                <!-- 保有住宅名 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadNowShatakuName" code="<%= MessageIdConstant.SKF2040_SC001_NOW_SHATAKU_NAME %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:select id="nowShatakuName" name="nowShatakuName" list="${form.ddlNowShatakuNameList}" 
                                                     value="" tabindex="1"/>
                                    </td>
                                </tr>
                                <!-- 現住所 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadNowAddress" code="<%= MessageIdConstant.SKF2040_SC001_NOW_ADDRESS %>" />
                                    </th>
                                    <td colspan="2">
                                        <span id="nowAddressArea">${f:h(form.nowAddress)}</span>
                                        <input type="hidden" name="nowAddress" id="nowAddress" value="${f:h(form.nowAddress)}" />
                                    </td>
                                </tr>
                                <!-- 氏名 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadName" code="<%= MessageIdConstant.SKF2040_SC001_NAME %>" />
                                    </th>
                                    <td colspan="2">
                                        ${f:h(form.name)}
                                    </td>
                                </tr>
                                <!-- 性別 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadGender" code="<%= MessageIdConstant.SKF2040_SC001_GENDER %>" />
                                    </th>
                                    <td colspan="2">
                                        ${f:h(form.genderName)}
                                    </td>
                                </tr>
                                <!-- 駐車場1台目保管場所 -->
                                <tr>
                                    <th rowspan="2">
                                        <nfwui:LabelBox id="lblHeadParking" code="<%= MessageIdConstant.SKF2040_SC001_PERKING %>" />
                                    </th>
                                    <th width="70">
                                        <nfwui:LabelBox id="lblHeadParking1st" code="<%= MessageIdConstant.SKF2040_SC001_PARKING_1ST %>" />
                                    </th>
                                    <th>
                                        <nfwui:LabelBox id="lblHeadParking1stPlace" code="<%= MessageIdConstant.SKF2040_SC001_PERKING_PLACE %>" />
                                    </th>
                                    <td colspan="2">
                                        <span id="parking1stPlaceTxt">${f:h(form.parking1stPlace)} </span>
                                        <input type="hidden" name="parking1stPlace" id="parking1stPlace" value="${form.parking1stPlace}" />
                                    </td>
                                </tr>
                                <!-- 駐車場2台目保管場所 -->
                                <tr>
                                     <th width="70">
                                        <nfwui:LabelBox id="lblHeadParking2nd" code="<%= MessageIdConstant.SKF2040_SC001_PARKING_2ND %>" />
                                    </th>
                                    <th>
                                        <nfwui:LabelBox id="lblHeadParking2ndPlace" code="<%= MessageIdConstant.SKF2040_SC001_PERKING_PLACE %>" />
                                    </th>
                                    <td colspan="2">
                                        <span id="parking2ndPlaceTxt">${f:h(form.parking2ndPlace)} </span>
                                        <input type="hidden" name="parking2ndPlace" id="parking2ndPlace" value="${form.parking2ndPlace}" />
                                    </td>
                                </tr>
                                <!-- 退居(返還)日 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadTaikyoHenkanDate" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYO_HENKAN_DATE %>" />
                                    </th>
                                    <td colspan="2">
                                        <nfwui:DateBox id="taikyoHenkanDate" name="taikyoHenkanDate" value="${f:h(form.taikyoHenkanDate)}"
                                               cssClass="${f:h(form.taikyoHenkanDateErr)}" tabindex="2" cssStyle="width:100px"/>
                                    </td>
                                </tr>
                                <!-- 退居(返還)する社宅又は、自動車の保管場所 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadHenkanTarget" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYO_HENKAN_TARGET %>" />
                                    </th>
                                    <td colspan="2">
                                        <nfwui:CheckBoxGroupTag id="taikyoType">
                                        <table id="taikyoTypeTable">
                                            <tr style="height: 25px;">
                                                <td>
                                                    <nfwui:CheckBox id="taikyoType01" name="taikyoType"
                                                            value="shataku_checked" label="社宅を退居する" tabindex="3"
                                                            disabled="${form.nowShatakuTaikyoDisabled}"
                                                            onclick="onClickTaikyoType01();" />
                                                </td>
                                                <td>
                                                    <nfwui:CheckBox id="taikyoType02" name="taikyoType"
                                                            value="park1_checked" label="駐車場1を返還する" tabindex="3"
                                                            disabled="${form.nowParking1TaikyoDisabled}"
                                                            onclick="onClickTaikyoType02();" />
                                                </td>
                                                <td>
                                                    <nfwui:CheckBox id="taikyoType03" name="taikyoType"
                                                            value="park2_checked" label="駐車場2を返還する" tabindex="3"
                                                            disabled="${form.nowParking2TaikyoDisabled}"
                                                            onclick="onClickTaikyoType03();" />
                                                </td>
                                            </tr>
                                        </table>
                                        </nfwui:CheckBoxGroupTag>
                                    </td>
                                </tr>
                                <!-- 退居(返還)理由 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadTaikyoHenkanRiyu" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYO_HENKAN_RIYU %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:select id="taikyoRiyuKbn" name="taikyoRiyuKbn"  style="width: 50%;" 
                                                     css="${f:h(form.taikyoRiyuKbnErr)}" onChange="onChangeTaikyoRiyuKbn();"
                                                     list="${form.ddlTaikyoRiyuKbnList}" tabindex="4"/>
                                        <br>
                                        <imui:textArea id="taikyoHenkanRiyu" name="taikyoHenkanRiyu"
                                                       value="${form.taikyoHenkanRiyu}" style="width: 90%; ime-mode:active;" 
                                                       css="${f:h(form.taikyoHenkanRiyuErr)}"
                                                       placeholder="例 自宅購入のため" disabled="true" tabindex="5" />
                                    </td>
                                </tr>
                                <!-- 社宅の状態 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadShatakuJotai" code="<%= MessageIdConstant.SKF2040_SC001_SHATAKU_STATUS %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:textArea id="shatakuJotai" name="shatakuJotai"
                                                       value="${form.shatakuJotai}" style="width: 90%; ime-mode:active;" 
                                                       css="${f:h(form.shatakuJotaiErr)}"
                                                       placeholder="例  壁紙に破損あり" disabled="true" tabindex="6" />
                                    </td>
                                </tr>
                                <!-- 退居後の連絡先 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadTaikyogoRenrakuSaki" code="<%= MessageIdConstant.SKF2040_SC001_TAIKYOGO_RENRAKU_SAKI %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:textArea id="taikyogoRenrakuSaki" name="taikyogoRenrakuSaki" 
                                                       value="${form.taikyogoRenrakuSaki}" style="width: 90%; ime-mode:active;" 
                                                       css="${f:h(form.taikyogoRenrakuSakiErr)}"
                                                       placeholder="例 090-0000-0000" disabled="true" tabindex="7"/>
                                    </td>
                                </tr>
                                <!-- 返却備品 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadReturnEquipment" code="<%= MessageIdConstant.SKF2040_SC001_RETURN_EQUIPMENT %>" />
                                    </th>
                                    <td colspan="2">
                                        <span id="returnEquipments">${form.returnEquipment)} </span>
                                    </td>
                                </tr>
                                <!-- 返却立合希望日 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadReturnWitnessRequestDate" code="<%= MessageIdConstant.SKF2040_SC001_RETURN_WITNESS_REQUEST_DATE %>" />
                                    </th>
                                    <td colspan="2">
                                        <nfwui:DateBox id="sessionDay" name="sessionDay" value="${f:h(form.sessionDay)}"
                                                       cssClass="${f:h(form.sessionDayErr)}" cssStyle="width:100px"
                                                       tabindex="8" disabled="${form.sessionDayDisabled}"/>
                                        <imui:select id="sessionTime" name="sessionTime" 
                                                     css="${f:h(form.sessionTimeErr)}"
                                                     list="${form.ddlReturnWitnessRequestDateList}" disabled="${form.sessionTimeDisabled}" tabindex="9" />
                                    </td>
                                </tr>
                                <!-- 連絡先 -->
                                <tr>
                                    <th colspan="3">
                                        <nfwui:LabelBox id="lblHeadRenrakuSaki" code="<%= MessageIdConstant.SKF2040_SC001_RENRAKU_SAKI %>" />
                                    </th>
                                    <td colspan="2">
                                        <imui:textbox id="renrakuSaki" name="renrakuSaki" 
                                                      value="${f:h(form.renrakuSaki)}" style="width: 90%; ime-mode:disabled;" placeholder="例 090-0000-0000"  
                                                      css="${f:h(form.renrakuSakiErr)}" maxlength="13"
                                                      disabled="${form.renrakuSakiDisabled}" tabindex="10" />
                                        <br>
                                        <span style="color:red;">
                                            <nfwui:LabelBox id="lblExplanationRenrakuSaki" code="<%= MessageIdConstant.SKF2040_SC001_EXPLANATION_RENRAKU_SAKI %>" />
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <!-- ステータス -->
                    <nfwui:Hidden id="applNo" name="applNo" />
                    <nfwui:Hidden id="applId" name="applId" />
                    <nfwui:Hidden id="shainNo" name="shainNo" />
                    <input type="hidden" name="hdnShainNo" id="hdnShainNo" value="${form.shainNo}" />
                    <input type="hidden" name="hdnSelectedNowShatakuName" id="hdnSelectedNowShatakuName" value="${form.hdnSelectedNowShatakuName}" />
                    <input type="hidden" name="hdnParking1stNumber" id="hdnParking1stNumber" value="${form.hdnParking1stNumber}"/>
                    <input type="hidden" name="hdnParking2ndNumber" id="hdnParking2ndNumber" value="${form.hdnParking2ndNumber}"/>
                    <input type="hidden" name="hdnNowShatakuKanriNo" id="hdnNowShatakuKanriNo" value="${form.hdnNowShatakuKanriNo}"/>
                    <input type="hidden" name="hdnNowShatakuRoomNo" id="hdnNowShatakuRoomNo" value="${form.hdnNowShatakuRoomNo}"/>
                    <input type="hidden" name="hdnNowShatakuRoomKanriNo" id="hdnNowShatakuRoomKanriNo" value="${form.hdnNowShatakuRoomKanriNo}"/>
                    <input type="hidden" name="hdnBihinHenkyakuUmu" id="hdnBihinHenkyakuUmu" value="${form.hdnBihinHenkyakuUmu}"/>
                    <input type="hidden" name="nowShatakuKikaku" id="nowShatakuKikaku" value="${form.nowShatakuKikaku}"/>
                    <input type="hidden" name="nowShatakuMenseki" id="nowShatakuMenseki" value="${form.nowShatakuMenseki}"/>
                    <!-- 右側の操作ガイドの部分 -->
                    <td style="width: 30%; border: none;background-color: #fdfdff;">
                        <div style="margin-left: 20px; background-color:#eeeeee;">
                            <nfwui:Title id="lblControlGuide" code="<%= MessageIdConstant.SKF2040_SC001_OPERATION_GUIDE %>" titleLevel="2" />
                            <div style="overflow-y:scroll; height:99%; margin-left: 20px;">
                                <span style="font-size: 100%; heigth:90%;">
                                    ${form.operationGuide}
                                </span>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- フッターエリア -->
    <div class="imui-box-layout" style="width:100%; margin:0 auto;">
        <table>
            <tr>
                <!-- 左エリア -->
                <div class="btnLeft">
                     <!-- 入力内容をクリア -->
                    <nfwui:ConfirmButton cssStyle="width:150px;" id="clearBtn" formId="form" value="入力内容をクリア" 
                        cssClass="imui-medium-button" title="<%= MessageIdConstant.SKF2040_SC001_CONFIRM_TITLE %>" 
                        message="<%= MessageIdConstant.I_SKF_2004 %>" remove="${form.btnClearRemoved}"
                        url="skf/Skf2040Sc001/Clear"/>
                 </div>
                <!-- 右エリア -->
                 <div class="btnRight">
                     <!-- 申請要件を確認 -->
                    <nfwui:Button cssStyle="width:150px;" id="download" name="download" value="申請要件を確認" 
                        formID="form" cssClass="imui-medium-button" url="skf/Skf2040Sc001/Download" />        
                    <!-- 一時保存 -->
                    <nfwui:Button cssStyle="width:150px;" id="saveBtn" formId="form" value="一時保存"
                        cssClass="imui-medium-button" disabled="${form.btnSaveDisabled}"
                        url="skf/Skf2040Sc001/Save"/>
                 </div>
             </tr>
             <tr>
                 <!-- 左エリア -->
                 <div class="btnLeft">
                    <!-- 前の画面へ -->
                     <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px; margin-top:5px;" onclick="back1()" />
                    <!-- コメントボタン -->
                    <c:if test="${form.commentViewFlag == 'true'}">
                    <nfwui:PopupButton id="commentPop" value="コメント表示" 
                    cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
                    modalMode="false" popupWidth="1350" popupHeight="488"
                    parameter="applNo:applNo"
                    screenUrl="skf/Skf2010Sc010/init" use="popup" />
                    </c:if>
                 </div>
                 <!-- 右エリア -->
                 <div id="dCheck1" class="btnRight">
                     <!-- 申請内容を確認 -->
                       <imui:button id="checkBtn" value="申請内容を確認" class="imui-medium-button" 
                           style="width: 150px; margin-top:5px;" onclick="onClickConfirm()"  disabled="${form.btnCheckDisabled}"/> 
                 </div>
             </tr>    
         </table>
    </div>
        
    </div>
    <!-- NFWUIフォーム終了位置 -->
</nfwui:Form>

<script type="text/javascript">
    /**
     * 日付型変換
     * <p>
     * 文字列をスラッシュを除いて日付に変換        
     * </p>
     * 
     * return 選択された値
     */ 
    function toDate (str, delim) {
          var arr = str.split(delim)
          return new Date(arr[0], arr[1] - 1, arr[2]);
    };    
    
    /**
     * ひとつ前の画面に戻る
     */
 	$(document).ready(function(){
		$(".imui-toolbar-icon").removeAttr("onclick");
		$(".imui-toolbar-icon").click(function(e) {
			back1("toolbar");
		});
	});
    back1 = function (btnType) {
    	var prePageId = $("#prePageId").val();
    	var message = "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。編集内容を保存する場合は「一時保存」をクリックして下さい。";
    	if (btnType == "toolbar") {
    		message = "戻ります。よろしいですか？";
    	}
    	var url = "";
    	//前の画面のＵＲＬ判定
   		if(prePageId=="Skf2010Sc007"){
   			url = "skf/Skf1010Sc001/init?SKF1010_SC001&tokenCheck=0";
   			nfw.common.doBack(url, message);
   		}else if(prePageId=="Skf2010Sc003" || prePageId=="Skf2010Sc004"){
   			//申請条件一覧
   			url="skf/Skf2010Sc003/init?SKF2010_SC003";
		}else if(prePageId=="Skf2040Sc001"){
			//申請条件一覧
			url="skf/Skf2010Sc003/init?SKF2010_SC003";
		}
   		nfw.common.confirmPopup(message
    			, "戻る確認"
    			, "form"
    			, url
    			, "ok"
    			, "キャンセル"
    			, this
    			, false);
    }
    
    /**
     * 申請内容確認ボタンを押下時の処理
     */ 
    function onClickConfirm() {
       
		// 画面に表示されていたメッセージを削除
		$(".imui-box-caution, .imui-box-warning, .imui-box-success").remove();
    	
    	// 退居予定日と返却希望立会日の確認ダイアログ表示フラグ
        var isDispDialog = false;
        
        // 退居予定日と返却希望立会日の確認ダイアログ表示判定
        if($("#taikyoHenkanDate").val() != "" && $("#sessionDay").val() != ""){    
            var taikyoYoteiDate = toDate($("#taikyoHenkanDate").val(), '/'); // 退居予定日(Date)
            var sessionDay = toDate($("#sessionDay").val(), '/'); // 返却希望立会日(Date)
            
            if(sessionDay.getTime() > taikyoYoteiDate.getTime()){
                // 申請内容確認ボタン（ダイアログあり）を表示
                isDispDialog = true;
            }
        }
        
        // チェックボックスのエラー色をクリア
        $('#taikyoTypeTable').removeClass('nfw-validation-error');
        
        // 入力チェック判定用の値設定を行う        
        var map = new Object();

        // 駐車場保管場所情報
        map['parking1stPlace'] = <%= '\'' %> ${f:h(form.parking1stPlace)};<%= '\'' %> 
        map['parking2ndPlace'] = <%= '\'' %> ${f:h(form.parking2ndPlace)};<%= '\'' %> 
        
        // 社宅名
        map['nowShatakuName'] = $("#nowShatakuName option:selected").val();
        // 退居返還日
        map['taikyoHenkanDate'] = $("#taikyoHenkanDate").val();
        // チェックボックス
        map['taikyoTypeShataku'] = $('#taikyoType01').prop('checked');
        map['taikyoTypeParking1'] = $('#taikyoType02').prop('checked');
        map['taikyoTypeParking2'] = $('#taikyoType03').prop('checked');
        // 退居返還理由ドロップダウン選択値
        map['taikyoRiyuKbn'] = $("#taikyoRiyuKbn option:selected").val();
        // 退居返還理由その他
        map['taikyoHenkanRiyu'] = $("#taikyoHenkanRiyu").val();

        // 社宅状態
        map['shatakuJotai'] = $("#shatakuJotai").val();
        // 退居後の連絡先
        map['taikyogoRenrakuSaki'] = $("#taikyogoRenrakuSaki").val();
        // 返却立ち合い希望日
        map['sessionDay'] = $("#sessionDay").val();
        // 返却立ち合い希望日（時間）
        map['sessionTime'] = $("#sessionTime").val();
        // 連絡先
        map['renrakuSaki'] = $("#renrakuSaki").val();
        // 備品返却有無
        map['hdnBihinHenkyakuUmu'] = $('#hdnBihinHenkyakuUmu').val();
         
        //入力チェック非同期処理呼び出し
        nfw.common.doAjaxAction(
                "skf/Skf2040Sc001/checkAsync",
                map,
                true,
                function(data) {
                    // エラーが存在しない場合の処理
                    var form = "form";
                    var url = "skf/Skf2040Sc001/Confirm"; //遷移先サービス
                    if (isDispDialog) {
                    //退居予定日と返却希望立会日の確認ダイアログが必要な場合
                        //ダイアログ
                        skf.common.confirmPopup(
                                "返却立会希望日が退居予定日以降で入力されています。申請してもよろしいですか？",
                                "確認", form, url, "OK", "キャンセル", this
                        );
                    } else {
                        //退居予定日と返却希望立会日の確認ダイアログが不要な場合
                        nfw.common.submitForm(form,url,"checkBtn");
                    }
                }
        );
    }
    
    function onChangeTaikyoRiyuKbn() {
        //その他が選択された場合、その他ボックスを活性化する
        var selTaikyoRiyuKbnCd = $('#taikyoRiyuKbn option:selected').val();
        if(selTaikyoRiyuKbnCd == "9"){
            $('#taikyoHenkanRiyu').prop('disabled', false);
        }else{
            $('#taikyoHenkanRiyu').prop('disabled', true);
            $('#taikyoHenkanRiyu').val("")
        }
    }

(function($){
    // 退居(返還)理由変更時のイベント
    $("#taikyoRiyuKbn").bind('change', function(){
        //その他が選択された場合、その他ボックスを活性化する
        var selTaikyoRiyuKbnCd = $('#taikyoRiyuKbn option:selected').val();
        if(selTaikyoRiyuKbnCd == "9"){
            $('#taikyoHenkanRiyu').prop('disabled', false);
        }else{
            $('#taikyoHenkanRiyu').prop('disabled', true);
            $('#taikyoHenkanRiyu').val("")
        }
    });

    // 社宅プルダウン変更時のイベント
    onChangeDropDown = function() {
        var map = new Object();
        var hShainNo = $('#hdnShainNo').val();
        map['shatakuKanriId'] = $('#nowShatakuName option:selected').val();
        map['shainNo'] = hShainNo;

        nfw.common.doAjaxAction("skf/Skf2040Sc001/ChangeDropDownAsync",map,true,function(data) {
            //値の変更
            $('#nowAddressArea').html( data.nowAddress );
            $('#nowAddress').val( data.nowAddress );
            $('#parking1stPlaceTxt').html( data.parking1stPlace );
            $('#parking1stPlace').val( data.parking1stPlace );
            $('#parking2ndPlaceTxt').html( data.parking2ndPlace );
            $('#parking2ndPlace').val( data.parking2ndPlace );
            $('#returnEquipments').html( data.returnEquipment );

            //値の設定
            $('#hdnSelectedNowShatakuName').val(data.hdnSelectedNowShatakuName);
            $('#hdnNowShatakuKanriNo').val(data.hdnNowShatakuKanriNo);
            $('#hdnNowShatakuRoomNo').val(data.hdnNowShatakuRoomNo);
            $('#hdnNowShatakuRoomKanriNo').val(data.hdnNowShatakuRoomKanriNo);
            $('#hdnParking1stNumber').val(data.hdnParking1stNumber);
            $('#hdnParking2ndNumber').val(data.hdnParking2ndNumber);
            $('#hdnBihinHenkyakuUmu').val(data.hdnBihinHenkyakuUmu);
            $('#nowShatakuKikaku').val(data.nowShatakuKikaku);
            $('#nowShatakuMenseki').val(data.nowShatakuMenseki);

            //画面制御
            if(data.parking1stPlace == ""){
                // 駐車場1を借りていない場合
                $('#taikyoType02').prop('disabled', true);
                $('#taikyoType02').prop('checked', false);
            }else{
                $('#taikyoType02').prop('disabled', false);
            }
            if(data.parking2ndPlace == ""){
                // 駐車場2を借りていない場合
                $('#taikyoType03').prop('disabled', true);
                $('#taikyoType03').prop('checked', false);
            }else{
                $('#taikyoType03').prop('disabled', false);
            }
            
            // 「社宅を退居する」チェック時のイベント
            onClickTaikyoType01();
        });
    }

    //社宅プルダウン
    $("#nowShatakuName").bind('change', onChangeDropDown);

    // 「社宅を退居する」チェック時のイベント
    onClickTaikyoType01 = function () {
        var isTaikyoChecked = $('#taikyoType01').prop('checked');
        if(isTaikyoChecked){
            // 「社宅を退居する」チェック時
            
            // 駐車場１，２がチェックされていない場合はチェックする
            if (!$('#taikyoType02').prop('disabled')) {
                $('#taikyoType02').prop('checked', true);
            }
            if (!$('#taikyoType03').prop('disabled')) {
                $('#taikyoType03').prop('checked', true);
            }
            
            $('#shatakuJotai').prop('disabled', false);
            $('#taikyogoRenrakuSaki').prop('disabled', false);
            
            // 備品返却関連
            if($("#hdnBihinHenkyakuUmu").val()!="0"){
                // 返還すべき物品が存在する場合、備品返却関連項目を活性化
                $('#sessionDayDiv').removeClass("wj-state-disabled");
                $('#sessionDayDiv').prop('disabled', false);
                $('#sessionDay').prop('disabled', false);
                $('#sessionTime').prop('disabled', false);
                $('#renrakuSaki').prop('disabled', false);
            }else{
                // 返却備品が存在しない場合は備品返却関連項目を非活性化
                $('#sessionDayDiv').prop('disabled', true);
                $('#sessionDay').prop('disabled', true);
                $('#sessionTime').prop('disabled', true);
                $('#renrakuSaki').prop('disabled', true);
            }
        }else{
            // 「社宅を退居する」チェック外し時
            $('#shatakuJotai').prop('disabled', true);
            $('#taikyogoRenrakuSaki').prop('disabled', true);
            
            // 備品返却関連
            $('#sessionDayDiv').prop('disabled', true);
            $('#sessionDay').prop('disabled', true);
            $('#sessionTime').prop('disabled', true);
            $('#renrakuSaki').prop('disabled', true);
        }
    }
    
    // 「駐車場1を返還する」チェック時のイベント
    onClickTaikyoType02 = function () {
        var isTaikyoChecked = $('#taikyoType01').prop('checked');
        if(isTaikyoChecked){
            // 「社宅を退居する」がチェックされている場合、
            // 駐車場1を返還するのチェックを外せないようにする
            if (!$('#taikyoType02').prop('disabled')) {
                $('#taikyoType02').prop('checked', true);
            }
        }
     }
     
    // 「駐車場2を返還する」チェック時のイベント
    onClickTaikyoType03 = function () {
        var isTaikyoChecked = $('#taikyoType01').prop('checked');
        if(isTaikyoChecked){
            // 「社宅を退居する」がチェックされている場合、
            // 駐車場2を返還するのチェックを外せないようにする
            if (!$('#taikyoType03').prop('disabled')) {
                $('#taikyoType03').prop('checked', true);
            }
        }
     }
    
    // 画面表示時に定義される処理
    $(document).ready(function(){
        onChangeDropDown();
        
        var isTaikyoChecked = $('#taikyoType01').prop('checked');
        
        if($('#parking1stPlace').val() == ""){
            // 駐車場1を借りていない場合
            $('#taikyoType02').prop('disabled', true);
            $('#taikyoType02').prop('checked', false);
        }else{
            $('#taikyoType02').prop('disabled', false);
        }
        if($('#parking2ndPlace').val() == ""){
            // 駐車場2を借りていない場合
            $('#taikyoType03').prop('disabled', true);
            $('#taikyoType03').prop('checked', false);
        }else{
            $('#taikyoType03').prop('disabled', false);
        }
        
        if(isTaikyoChecked){
            // 「社宅を退居する」チェック時
            
            // 駐車場１，２がチェックされていない場合はチェックする
            if (!$('#taikyoType02').prop('disabled')) {
                $('#taikyoType02').prop('checked', true);
            }
            if (!$('#taikyoType03').prop('disabled')) {
                $('#taikyoType03').prop('checked', true);
            }
            
            $('#shatakuJotai').prop('disabled', false);
            $('#taikyogoRenrakuSaki').prop('disabled', false);
            
            // 備品返却関連
            if($("#hdnBihinHenkyakuUmu").val()!="0"){
                // 返還すべき物品が存在する場合、備品返却関連項目を活性化
                $('#sessionDayDiv').removeClass("wj-state-disabled");
                $('#sessionDayDiv').prop('disabled', false);
                $('#sessionDay').prop('disabled', false);
                $('#sessionTime').prop('disabled', false);
                $('#renrakuSaki').prop('disabled', false);
            }else{
                // 返却備品が存在しない場合は備品返却関連項目を非活性化
                $('#sessionDayDiv').prop('disabled', true);
                $('#sessionDay').prop('disabled', true);
                $('#sessionTime').prop('disabled', true);
                $('#renrakuSaki').prop('disabled', true);
            }
        }else{
            // 「社宅を退居する」チェック外し時
            $('#shatakuJotai').prop('disabled', true);
            $('#taikyogoRenrakuSaki').prop('disabled', true);
            
            // 備品返却関連
            $('#sessionDayDiv').prop('disabled', true);
            $('#sessionDay').prop('disabled', true);
            $('#sessionTime').prop('disabled', true);
            $('#renrakuSaki').prop('disabled', true);
        }
        
        //退居理由でその他が選択された場合、その他ボックスを活性化する
        var selTaikyoRiyuKbnCd = $('#taikyoRiyuKbn option:selected').val();
        if(selTaikyoRiyuKbnCd == "9"){
            $('#taikyoHenkanRiyu').prop('disabled', false);
        }else{
            $('#taikyoHenkanRiyu').prop('disabled', true);
            $('#taikyoHenkanRiyu').val("")
        }
    });
})(jQuery);
</script>
<!-- コンテンツエリア　ここまで -->