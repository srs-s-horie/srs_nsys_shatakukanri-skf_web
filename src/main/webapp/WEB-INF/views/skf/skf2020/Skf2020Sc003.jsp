<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ taglib prefix="workflow" uri="http://www.intra-mart.co.jp/taglib/imw/workflow" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://terasoluna.org/functions" %>

<link rel="stylesheet" type="text/css" href="styles/skf/theme.css" />
<%@ page import="jp.co.c_nexco.skf.skf2020.app.skf2020sc003.Skf2020Sc003Form" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.MessageIdConstant" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.CodeConstant" %>
<%  Skf2020Sc003Form form = (Skf2020Sc003Form)request.getAttribute("form"); %>

<%-- コンテンツエリア --%>
<style type="text/css">
    li.im-ui-icon-common-16-link-point-gray {
        line-height: 8px;
        height: 10px;
        margin-top: 10px;
        margin-bottom: 2px;
    }
    
    input {
       background-color: rgb(255, 255, 255);
    }
</style>

<script type="text/javascript">
function back1() {
	var url="skf/Skf2010Sc005/init"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
}

$(function() {
	$(document).ready(function(){
		// 添付資料のリンクをクリックした時のイベント
		$("a[id*='attached_']").click(function(){
			attachedFileDownload(this);
		});
		// 初期表示時、「社宅の必要理由」の選択状態が「世帯」だった場合の制御
		if($("#hitsuyoShatakuSetai").is(":checked")) {
			$("input:radio:not(:checked)").prop("disabled", true);
		} else {
			$("input[name!='bihinKibo']:radio:not(:checked)").prop("disabled", true);
		}
	});
	
	// 添付ファイルリンクからのファイルダウンロード処理
	attachedFileDownload = function(obj) {
		var id = $(obj).attr("id");
		var url = "skf/Skf2020Sc003/Download";
		var attachedNo = id.replace(/\attached_/, '');
		
		$("#attachedNo").val(attachedNo);
		$("#form").attr("action", url);
		$("#form").submit();
	}
	
	// 添付資料設定時に上部表示エリアに追記する処理
	updateAttachedFileArea = function () {
		var map = new Object();
		map['applNo'] = $("#applNo").val();
		nfw.common.doAjaxAction("skf/Skf2020Sc003/AttachedFileAreaAsync", map, true, function(res){
			$("#attachedFileAreaDiv").html(res.attachedFileArea);
			
			// 追記したリンクにはファイルダウンロード機能が無いため追加
			$("a[id*='attached_']").bind("click", function(){
				attachedFileDownload(this);
			});
		});
	}

});
</script>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" style="width: 100%; max-width: 1350px;">
    
                    <table class="imui-form-search-condition">
                       <tr>
                            <th width="100px"><label>申請状況</label></th>
                            <td width="100px"><label>${form.applStatusText }</label></td>
                            <th width="100px"><label>添付資料</label></th>
                            <td>
                            <div id="shatakuAttachedFileAreaDiv" style="float:left;">
<c:forEach var="objShataku" items="${form.shatakuAttachedFileList }">
                            <a id="attached_${f:h(objShataku.attachedNo)}">${f:h(objShataku.attachedName)}</a>&nbsp;
</c:forEach>
							</div>
                            <div id="attachedFileAreaDiv">
<c:forEach var="obj" items="${form.attachedFileList }">
                            <a id="attached_${f:h(obj.attachedNo)}">${f:h(obj.attachedName)}</a>&nbsp;
</c:forEach>
							</div>
                            </td>
                      </tr>
                    </table>
        <nfwui:Form id="form" name="form" modelAttribute="form">
        <nfwui:Hidden id="applNo" name="applNo" />
        <nfwui:Hidden id="applId" name="applId" />
        <nfwui:Hidden id="applStatus" name="applStatus" />
        <nfwui:Hidden id="shatakuKanriNo" name="shatakuKanriNo" />
        <input type="hidden" id="attachedNo" name="attachedNo" value="" />
        <input type="hidden" id="attachedType" name="attachedType" value="" />
        <table class="imui-form-search-condition" style="box-sizing:border-box;">
            <tbody>
                        
                <tr>
                    <td style="width: 70%; border: none;background-color: #fdfdff; max-width: 750px;">
                        <!-- 左側の入力域の部分 -->
                        <div class="imui-form-container-wide" >
                        <table class="imui-form-search-condition">
                            <tbody>
                            <div class="imui-chapter-title" style="margin-bottom: 10px;"><h2>申請内容表示</h2></div>
                                <tr>
                                    <th rowspan="4"><label>所属</label></th>
                                    <th colspan="2"><label>機関</label></th>
                                    <td colspan="2" style="min-width: 400px;">
                                        ${f:h(form.agencyName)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>部等</label></th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation1Name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>室、チーム又は課</label></th>
                                    <td colspan="2">
                                        ${f:h(form.affiliation2Name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>勤務先のTEL</label></th>
                                    <td colspan="2">
                                        ${f:h(form.tel)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="3"><label>申請者</label></th>
                                    <th colspan="2"><label>社員番号</label></th>
                                    <td colspan="2">
                                        ${f:h(form.shainNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>氏名</label></th>
                                    <td colspan="2">
                                       ${f:h(form.name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>等級</label></th>
                                    <td colspan="2">
                                       ${f:h(form.tokyu)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>新たに社宅を必要としますか？</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="taiyoHituyo">
                                      <nfwui:RadioButton id="taiyoHitsuyoHitsuyo" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_HITSUYO %>" label="必要とする" />
                                      <nfwui:RadioButton id="taiyoHitsuyoFuyo" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_FUYOU %>" label="必要としない" />
                                      <nfwui:RadioButton id="taiyoHitsuyoParking" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_PARKING_ONLY %>" label="駐車場のみ" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>社宅を必要とする理由</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="hitsuyoRiyu">
                                      <nfwui:RadioButton id="hitsuyoRiyuIdo" name="hitsuyoRiyu" value="<%= CodeConstant.IDOU %>" label="異動のため" />
                                      <nfwui:RadioButton id="hitsuyoRiyuKekkon" name="hitsuyoRiyu" value="<%= CodeConstant.KEKKON %>" label="結婚のため" />
                                      <nfwui:RadioButton id="hitsuyoRiyuOther" name="hitsuyoRiyu" value="<%= CodeConstant.HITUYO_RIYU_OTHERS %>" label="その他" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>社宅を必要としない理由</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="fuhitsuyoRiyu">
                                      <nfwui:RadioButton id="fuhitsuyoRiyuJitaku" name="fuhitsuyoRiyu" value="<%= CodeConstant.JITAKU_TSUKIN %>" label="自宅通勤" />
                                      <nfwui:RadioButton id="fuhitsuyoRiyuKariage" name="fuhitsuyoRiyu" value="<%= CodeConstant.JIKO_KARIAGE %>" label="自己借上" />
                                      <nfwui:RadioButton id="fuhitsuyoRiyuOther" name="fuhitsuyoRiyu" value="<%= CodeConstant.FUYO_RIYU_OTHERS %>" label="その他" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="3"><label>新所属</label></th>
                                    <th colspan="2"><label>機関</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newAgency)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>部等</label></th>
                                    <td colspan="2">
                                       ${f:h(form.newAffiliation1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>室、チーム又は課</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newAffiliation2)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>必要とする社宅

<imart:condition validity="<%= String.valueOf(form.isEditBtnVisible()) %>" >
                                    <div id="readOnlyMode" class="align-R float-R">
                                    <imui:button id="edit" name="edit" class="imui-small-button check" value="編集" />
                                    </div>
                                    <div id="editMode" class="align-R float-R" style="display:none;">
                                    <nfwui:Button id="commit" name="commit" cssClass="imui-small-button check" value="確定"
                                    formId="form" url="skf/Skf2020Sc003/Update" /><br>
                                    <imui:button id="cancel" name="cancel" class="imui-small-button check" value="取消" /></div>
</imart:condition>
                                    </label>
                                    </th>
                                    <td colspan="2">
                                    <input type="hidden" id="default" value="${form.hitsuyoShataku }" />
                                    <nfwui:RadioButtonGroup id="hitsuyoShataku">
                                      <nfwui:RadioButton id="hitsuyoShatakuSetai" name="hitsuyoShataku" value="<%= CodeConstant.SETAI %>" label="世帯" />
                                      <nfwui:RadioButton id="hitsuyoShatakuTanshin" name="hitsuyoShataku" value="<%= CodeConstant.TANSHIN %>" label="単身" />
                                      <nfwui:RadioButton id="hitsuyoShatakuDokushin" name="hitsuyoShataku" value="<%= CodeConstant.DOKUSHIN %>" label="独身" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <script>
                                $(function() {
                                	// 「編集」ボタンを押下した時の処理
                                	$("#edit").click(function() {
                                		$("#editMode").show();
                                		$("#readOnlyMode").hide();
                                		$("input[name='hitsuyoShataku']:radio").prop("disabled", false);
                                	});
                                	// 「取消」ボタンを押下した時の処理
                                	$("#cancel").click(function() {
                                		$("#editMode").hide();
                                		$("#readOnlyMode").show();
                                		var defaultHitsuyoShataku = $("#default").val();
                                		switch (defaultHitsuyoShataku) {
                                		case '1':
                                			$("#hitsuyoShatakuSetai").prop("checked", true);
                                			$("#hitsuyoShatakuTanshin").prop("checked", false);
                                			$("#hitsuyoShatakuDokushin").prop("checked", false);
                                			break;
                                		case '2':
                                			$("#hitsuyoShatakuSetai").prop("checked", false);
                                			$("#hitsuyoShatakuTanshin").prop("checked", true);
                                			$("#hitsuyoShatakuDokushin").prop("checked", false);
                                			break;
                                		case '3':
                                			$("#hitsuyoShatakuSetai").prop("checked", false);
                                			$("#hitsuyoShatakuTanshin").prop("checked", false);
                                			$("#hitsuyoShatakuDokushin").prop("checked", true);
                                			break;
                                		}
                                		
                                		$("input[name='hitsuyoShataku']:radio").prop("disabled", false);
                                	});
                                });
                                </script>
                                <tr>
                                    <th colspan="3"><label>同居家族</label></th>
                                    <td colspan="2">
                                        <table class="imui-form-search-condition" style="width:100%;">
                                            <tbody>
                                                <tr>
                                                    <th><label>続柄</label></th>
                                                    <th><label>氏名</label></th>
                                                    <th><label>年齢</label></th>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoRelation1)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                       ${f:h(form.dokyoName1)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge1)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoRelation2)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName2)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge2)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation3)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName3)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge3)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation4)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName4)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge4)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation5)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName5)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge5)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">
                                                        　                                                                       ${f:h(form.dokyoRelation6)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoName6)}
                                                    </td>
                                                    <td style="text-align:left;">
                                                        ${f:h(form.dokyoAge6)}
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>入居希望日（予定日）</label></th>
                                    <td colspan="2">
                                        ${f:h(form.nyukyoYoteiDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>自動車の保管場所</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="parkingUmu">
                                      <nfwui:RadioButton id="parkingUmuHitsuyo" name="parkingUmu" value="<%= CodeConstant.CAR_PARK_HITUYO %>" label="必要とする" />
                                      <nfwui:RadioButton id="parkingUmuFuyo" name="parkingUmu" value="<%= CodeConstant.CAR_PARK_FUYO %>" label="必要としない" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="6"><label>１台目</label></th>
                                    <th colspan="2"><label>自動車の保有</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="carNoInputFlg">
                                      <nfwui:RadioButton id="carNoInputFlgHoyu" name="carNoInputFlg" value="<%= CodeConstant.CAR_HOYU %>" label="保有している" />
                                      <nfwui:RadioButton id="carNoInputFlgNotHoyu" name="carNoInputFlg" value="<%= CodeConstant.CAR_YOTEI %>" label="購入を予定している" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の車名</label></th>
                                    <td colspan="2">
                                       ${f:h(form.carName)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の登録番号</label></th>
                                    <td colspan="2">
                                       ${f:h(form.carNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>車検の有効期間満了日</label></th>
                                    <td colspan="2">
                                        ${f:h(form.carExpirationDate)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の使用者</label></th>
                                    <td colspan="2">
                                        ${f:h(form.carUser)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の保管場所<br>使用開始日（予定日）</label></th>
                                    <td colspan="2">
                                        ${f:h(form.parkingUseDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="6"><label>２台目</label></th>
                                    <th colspan="2"><label>自動車の保有</label></th>
                                    <td>
                                    <nfwui:RadioButtonGroup id="carNoInputFlg2">
                                      <nfwui:RadioButton id="carNoInputFlgHoyu" name="carNoInputFlg2" value="<%= CodeConstant.CAR_HOYU %>" label="保有している" />
                                      <nfwui:RadioButton id="carNoInputFlgNotHoyu" name="carNoInputFlg2" value="<%= CodeConstant.CAR_YOTEI %>" label="購入を予定している" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の車名</label></th>
                                    <td>
                                      ${f:h(form.carName2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の登録番号</label></th>
                                    <td>
                                      ${f:h(form.carNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>車検の有効期間満了日</label></th>
                                    <td>
                                      ${f:h(form.carExpirationDate2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の使用者</label></th>
                                    <td>
                                      ${f:h(form.carUser2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>自動車の保管場所<br>使用開始日（予定日）</label></th>
                                    <td>
                                      ${f:h(form.parkingUseDate2)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="5"><label>現居住宅</label></th>
                                    <th colspan="2"><label></label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="nowShataku">
                                      <nfwui:RadioButton id="nowShatakuHoyu" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_HOYU %>" label="保有（会社借上含む）" />
                                      <nfwui:RadioButton id="nowShatakuJitaku" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JITAKU %>" label="自宅" />
                                      <nfwui:RadioButton id="nowShatakuJikoKariage" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JIKO_KARIAGE %>" label="自己借上" />
                                      <nfwui:RadioButton id="nowShatakuOther" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_OTHERS %>" label="その他" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>保有社宅名</label></th>
                                    <td>
                                    　　　　　　　　　　　　　　　　　　　　${f:h(form.nowShatakuName)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>室番号</label></th>
                                    <td>
                                    ${f:h(form.nowShatakuNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>規格（間取り）</label></th>
                                    <td>
                                    ${f:h(form.nowShatakuKikaku)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>面積</label></th>
                                    <td>
                                    ${f:h(form.nowShatakuMenseki)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="2"><label>駐車場</label></th>
                                    <th colspan="1"><label>１台目</label></th>
                                    <th colspan="1"><label>保管場所</label></th>
                                    <td colspan="2">
                                    ${f:h(form.parking1stPlace)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>２台目</label></th>
                                    <th colspan="1"><label>保管場所</label></th>
                                    <td colspan="2">
                                    ${f:h(form.parking2stPlace)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>特殊事情等<br>(希望地域、間取り、階層、具体の社宅名を記入してください。)</label></th>
                                    <td colspan="2">
                                    ${f:h(form.tokushuJijo)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>現保有社宅</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="taikyoYotei">
                                      <nfwui:RadioButton id="taikyoYoteiTaikyo" name="taikyoYotei" value="<%= CodeConstant.LEAVE %>" label="退居する" />
                                      <nfwui:RadioButton id="taikyoYoteiKeizoku" name="taikyoYotei" value="<%= CodeConstant.NOT_LEAVE %>" label="継続使用する" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>退居予定日</label></th>
                                    <td colspan="2">
                                    ${f:h(form.taikyoYoteiDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>社宅の状態</label></th>
                                    <td colspan="2">
                                    ${f:h(form.shatakuJyotai)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>退居理由</label></th>
                                    <td colspan="2">
                                    ${f:h(form.taikyoRiyu)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>退居後の連絡先</label></th>
                                    <td colspan="2">
                                    ${f:h(form.taikyogoRenrakuSaki)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>返却備品</label></th>
                                    <td colspan="2">
                                    ${f:h(form.returnEquipment)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>返却立会希望日</label></th>
                                    <td colspan="2">
                                    ${f:h(form.sessionDay)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3"><label>連絡先</label></th>
                                    <td colspan="2">
                                    ${f:h(form.renrakuSaki)}
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                        </div>

                        <div class="imui-form-container-wide" >
                        <table class="imui-form-search-condition-blue">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                            <tbody>
                            <div class="imui-chapter-title-blue"style="margin-bottom: 10px;"><h2>承認者入力欄</h2></div>
                                <tr>
                                    <th rowspan="23"><label>社宅情報</label></th>
                                    <th colspan="2"><label>社宅所在地</label></th>
                                    <td colspan="2" style="min-width: 400px;">
                                        ${f:h(form.newShozaichi)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>社宅名</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newShatakuName)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>室番号</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newShatakuNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>規格(間取り)</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newShatakuKikaku)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>面積</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newShatakuMenseki)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>使用料(月)<br>※自動車の保管場所に<br>係わる使用料を除く</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newRental)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>共益費</label></th>
                                    <td colspan="2">
                                        ${f:h(form.newKyoekihi)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>入居可能日</label></th>
                                    <td colspan="2">
                                        ${f:h(form.nyukyoKanoDate)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5"><label>寮長・自治会長</label></th>
                                    <th colspan="1"><label>部屋名称</label></th>
                                    <td colspan="2">
                                        ${f:h(form.manegeShatakuNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>氏名</label></th>
                                    <td colspan="2">
                                       ${f:h(form.manegeName1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>電子メールアドレス</label></th>
                                    <td colspan="2">
                                      ${f:h(form.manegeMailAddress1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>電話番号</label></th>
                                    <td colspan="2">
                                      ${f:h(form.manegeTelNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>内線番号</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeExtensionNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5"><label>鍵管理者</label></th>
                                    <th colspan="1"><label>部屋名称</label></th>
                                    <td colspan="2">
                                        ${f:h(form.manegeShatakuNo2)}
                                </tr>
                                <tr>
                                    <th colspan="1"><label>氏名</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeName2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>電子メールアドレス</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeMailAddress2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>電話番号</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeTelNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>内線番号</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeExtensionNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5"><label>寮母・管理会社</label></th>
                                    <th colspan="1"><label>部屋名称</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeShatakuNo3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>氏名</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeName3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>電子メールアドレス</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeMailAddress3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>電話番号</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeTelNo3)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>内線番号</label></th>
                                    <td colspan="2">
                                    ${f:h(form.manegeExtensionNo3)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="8"><label>駐車場情報</label></th>
                                    <th rowspan="4"><label>1台目</label></th>
                                    <th colspan="1"><label>自動車の保管場所</label></th>
                                    <td colspan="2">
                                        ${f:h(form.parkingAddress1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>位置番号等</label></th>
                                    <td colspan="2">
                                        ${f:h(form.carIchiNo1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>自動車の保管場所に<br>係わる使用料(月)</label></th>
                                    <td colspan="2" vertical-align="middle">
                                        ${f:h(form.parkingRental1)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>使用開始可能日</label></th>
                                    <td colspan="2">
                                        ${f:h(form.parking1StartDate)}
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4"><label>2台目</label></th>
                                    <th colspan="1"><label>自動車の保管場所</label></th>
                                    <td colspan="2">
                                    ${f:h(form.parkingAddress2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>位置番号等</label></th>
                                    <td colspan="2">
                                    ${f:h(form.carIchiNo2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>自動車の保管場所に<br>係わる使用料(月)</label></th>
                                    <td colspan="2">
                                    ${f:h(form.parkingRental2)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="1"><label>使用開始可能日</label></th>
                                    <td colspan="2">
                                    ${f:h(form.parking2StartDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="4"><label>備品希望申請</label></th>
                                    <th colspan="2"><label></label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="bihinKibo">
                                      <nfwui:RadioButton id="bihinKiboKano" name="bihinKibo" value="<%= CodeConstant.BIHIN_KIBO_SHINSEI_HITSUYO %>" label="可" />
                                      <nfwui:RadioButton id="bihinKiboFukano" name="bihinKibo" value="<%= CodeConstant.BIHIN_KIBO_SHINSEI_FUYO %>" label="不可" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>氏名</label></th>
                                    <td colspan="2">
                                        ${f:h(form.name)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>性別</label></th>
                                    <td colspan="2">
                                        ${f:h(form.gender)}
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2"><label>必要とする社宅理由</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="bihinHitsuyoShataku">
                                      <nfwui:RadioButton id="newHitsuyoShatakuSetai" name="bihinHitsuyoShataku" value="<%= CodeConstant.SETAI %>" label="世帯" />
                                      <nfwui:RadioButton id="newHitsuyoShatakuTanshin" name="bihinHitsuyoShataku" value="<%= CodeConstant.TANSHIN %>" label="単身" />
                                      <nfwui:RadioButton id="newHitsuyoShatakuDokushin" name="bihinHitsuyoShataku" value="<%= CodeConstant.DOKUSHIN %>" label="独身" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
<imart:condition validity="<%= String.valueOf(form.isBihinVisible()) %>" >
<script>
$(function(){
	$(document).ready(function(){
		if ($("#bihinKiboFukano").attr("checked")) {
			$("#bihinKiboList").hide(500);	
		}
	});
	
	$("input[name='bihinKibo']:radio").change(function() {
		var check = $(this).val();
		if (check == '0') {
			$("#bihinKiboList").animate({
			    height: ['hide', 'swing']
			  }, 300);	
		} else {
			$("#bihinKiboList").animate({
			    height: ['show', 'swing']
			  }, 300);	
		}
	});
});

</script>
<div id="bihinKiboList">
                        <table class="imui-form-search-condition-blue">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                        <colgroup span="1" style= "width:140px;">
                            <tbody>
                                <tr>
                                    <th colspan="3"><label></label></th>
                                    <th colspan="1"><label>状態</label></th>
                                    <th colspan="1"><label>希望可能</label></th>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>洗濯機</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState11)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish11" name="bihinWish11" list="${form.ddBihinList11}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>冷蔵庫</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState12)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish12" name="bihinWish12" list="${form.ddBihinList12}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>オーブンレンジ</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState13)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish13" name="bihinWish13" list="${form.ddBihinList13}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>掃除機</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState14)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish14" name="bihinWish14" list="${form.ddBihinList14}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>電子炊飯ジャー</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState15)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish15" name="bihinWish15" list="${form.ddBihinList15}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>テレビ</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState16)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish16" name="bihinWish16" list="${form.ddBihinList16}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>テレビ台</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState18)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish17" name="bihinWish17" list="${form.ddBihinList17}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>座卓(こたつ)</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState18)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish18" name="bihinWish18" list="${form.ddBihinList18}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>キッチンキャビネット</label></th>
                                    <td colspan="1"><label>${f:h(form.bihinState19)}</label></td>
                                    <td colspan="1">
                                        <imui:select id="bihinWish19" name="bihinWish19" list="${form.ddBihinList19}"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
</div>
</imart:condition>
                        </div>
                        
                        <div class="imui-form-container-wide" >
                        <div class="imui-chapter-title"style="margin-bottom: 10px;"><h2>【修正依頼】【差戻し】の場合の入力欄</h2></div>
                        <table class="imui-form-search-condition">
                        <colgroup span="1" style= "width:140px;">
                            <tbody>
                                <tr>
                                    <th colspan="2"><label>修正依頼/差戻し理由</label></th>
                                    <td colspan="1">
                                        <imui:textArea id="commentNote" name="commentNote" rows="4" cols="118" placeholder="修正依頼/差戻し理由" style="max-width: 700px;"></imui:textArea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </td>
                    <td style="width: 30%; border: none;background-color: #fdfdff;">
                      <table>
                        <!-- 右側の操作ガイドの部分 -->
                        <div class="imui-form-container-wide" >
                        <div class="imui-chapter-title" style="margin-bottom: 10px;">
                            <h2>操作ガイド</h2>
                        </div>
                        <div style="overflow-y:scroll;height:99%">
                            ${form.operationGuide}
                        </div>
                        </div>
                      </table>
                    </td>
                </tr>
            </tbody>
        </table>
<div class="imui-box-layout">

    <table style="width:100%;">
    <tbody>
<tr>
<td align="left">
            <imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
<imart:condition validity="<%= String.valueOf(form.isCommentViewFlag()) %>" >
          <nfwui:PopupButton id="commentPop" value="コメント表示" 
          cssClass="imui-medium-button" style="width:150px; margin-top:5px;"
          modalMode="false" popupWidth="1350" popupHeight="550"
          parameter="applNo:applNo" formId="form"
          screenUrl="skf/Skf2010Sc010/init" use="popup" />
</imart:condition>
</td> 
<td align="right">
      <nfwui:ConfirmButton id="revisionBtn" name="revisionBtn" value="修正依頼"
       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
       title="<%= MessageIdConstant.SKF2020_SC003_CONFIRM_TITLE %>"
       message="<%= MessageIdConstant.SKF2020_SC003_REVISION_MSG %>"
       url="skf/Skf2020Sc003/Revision" />
</td>
</tr>
    </tbody>

        <tbody>

<tr>
<td align="left">
</td> 
<td align="right">

           <nfwui:PopupButton id="shiryoBtn" name="shiryoBtn" value="資料を添付"
           cssClass="imui-medium-button" cssStyle="width: 150px" 
           use="popup" popupWidth="750" popupHeight="600"
           parameter="applNo:applNo,applId:applId" modalMode="false" 
           screenUrl="skf/Skf2010Sc009/init" formId="form" />
      <nfwui:ConfirmButton id="remaindBtn" name="remaindBtn" value="差戻し"
       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
       title="<%= MessageIdConstant.SKF2020_SC003_CONFIRM_TITLE %>"
       message="<%= MessageIdConstant.SKF2020_SC003_REMAND_MSG %>"
       url="skf/Skf2020Sc003/Remand" />
      <nfwui:Button id="confirmBtn" name="confirmBtn" value="提示内容を確認"
       cssClass="imui-medium-button check" cssStyle="width:150px;" formId="form"
       url="skf/Skf2020Sc003/Confirm" />
</td>
</tr>
    </tbody>

    </table>
</nfwui:Form>
    </div>
  </div>
	<!-- コンテンツエリア　ここまで -->