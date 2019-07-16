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

<%-- コンテンツエリア --%>
<style type="text/css">
    li.im-ui-icon-common-16-link-point-gray {
        line-height: 8px;
        height: 10px;
        margin-top: 10px;
        margin-bottom: 2px;
    }
</style>

    <!-- コンテンツエリア -->
    <div class="imui-form-container-wide" style="width: 100%; max-width: 1350px;">
    
                    <table class="imui-form-search-condition">
                       <tr>
                            <th width="100px"><label>申請状況</label></th>
                            <td width="100px"><label>${form.applStatusText }</label></td>
                            <th width="100px"><label>添付資料</label></th>
                            <td>
                            <div id="attachedFileAreaDiv">
<c:forEach var="obj" items="${form.attachedFileList }">
                            <a id="attached_${f:h(obj.attachedNo)}">${f:h(obj.attachedName)}</a>&nbsp;
</c:forEach>
							</div>
                            </td>
                      </tr>
                    </table>
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
                                      <nfwui:RadioButton id="taiyoHitsuyoHitsuyo" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_HITSUYO %>" label="必要とする" onclick="return false;" />
                                      <nfwui:RadioButton id="taiyoHitsuyoFuyo" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_FUYOU %>" label="必要としない" onclick="return false;" />
                                      <nfwui:RadioButton id="taiyoHitsuyoParking" name="taiyoHituyo" value="<%= CodeConstant.ASKED_SHATAKU_PARKING_ONLY %>" label="駐車場のみ" onclick="return false;" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>社宅を必要とする理由</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="hitsuyoRiyu">
                                      <nfwui:RadioButton id="hitsuyoRiyuIdo" name="hitsuyoRiyu" value="<%= CodeConstant.IDOU %>" label="異動のため" onclick="return false;" />
                                      <nfwui:RadioButton id="hitsuyoRiyuKekkon" name="hitsuyoRiyu" value="<%= CodeConstant.KEKKON %>" label="結婚のため" onclick="return false;" />
                                      <nfwui:RadioButton id="hitsuyoRiyuOther" name="hitsuyoRiyu" value="<%= CodeConstant.HITUYO_RIYU_OTHERS %>" label="その他" onclick="return false;" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>社宅を必要としない理由</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="fuhitsuyoRiyu">
                                      <nfwui:RadioButton id="fuhitsuyoRiyuJitaku" name="fuhitsuyoRiyu" value="<%= CodeConstant.JITAKU_TSUKIN %>" label="自宅通勤" onclick="return false;" />
                                      <nfwui:RadioButton id="fuhitsuyoRiyuKariage" name="fuhitsuyoRiyu" value="<%= CodeConstant.JIKO_KARIAGE %>" label="自己借上" onclick="return false;" />
                                      <nfwui:RadioButton id="fuhitsuyoRiyuOther" name="fuhitsuyoRiyu" value="<%= CodeConstant.FUYO_RIYU_OTHERS %>" label="その他" onclick="return false;" />
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
                                    <th colspan="3"><label>必要とする社宅</label>
                                    <div class="align-R float-R">
                                    <input class="imui-small-button check" type="button" value="編集"/>
                                    </div>
                                    </th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="hitsuyoShataku">
                                      <nfwui:RadioButton id="hitsuyoShatakuSetai" name="hitsuyoShataku" value="<%= CodeConstant.SETAI %>" label="世帯" onclick="return false;" />
                                      <nfwui:RadioButton id="hitsuyoShatakuTanshin" name="hitsuyoShataku" value="<%= CodeConstant.TANSHIN %>" label="単身" onclick="return false;" />
                                      <nfwui:RadioButton id="hitsuyoShatakuDokushin" name="hitsuyoShataku" value="<%= CodeConstant.DOKUSHIN %>" label="独身" onclick="return false;" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
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
                                      <nfwui:RadioButton id="parkingUmuHitsuyo" name="parkingUmu" value="<%= CodeConstant.CAR_PARK_HITUYO %>" label="必要とする" onclick="return false;" />
                                      <nfwui:RadioButton id="parkingUmuFuyo" name="parkingUmu" value="<%= CodeConstant.CAR_PARK_FUYO %>" label="必要としない" onclick="return false;" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th rowspan="6"><label>１台目</label></th>
                                    <th colspan="2"><label>自動車の保有</label></th>
                                    <td colspan="2">
                                    <nfwui:RadioButtonGroup id="carNoInputFlg">
                                      <nfwui:RadioButton id="carNoInputFlgHoyu" name="carNoInputFlg" value="<%= CodeConstant.CAR_HOYU %>" label="保有している" onclick="return false;" />
                                      <nfwui:RadioButton id="carNoInputFlgNotHoyu" name="carNoInputFlg" value="<%= CodeConstant.CAR_YOTEI %>" label="購入を予定している" onclick="return false;" />
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
                                      <nfwui:RadioButton id="carNoInputFlgHoyu" name="carNoInputFlg2" value="<%= CodeConstant.CAR_HOYU %>" label="保有している" onclick="return false;" />
                                      <nfwui:RadioButton id="carNoInputFlgNotHoyu" name="carNoInputFlg2" value="<%= CodeConstant.CAR_YOTEI %>" label="購入を予定している" onclick="return false;" />
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
                                      <nfwui:RadioButton id="nowShatakuHoyu" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_HOYU %>" label="保有（会社借上含む）" onclick="return false;" />
                                      <nfwui:RadioButton id="nowShatakuJitaku" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JITAKU %>" label="自宅" onclick="return false;" />
                                      <nfwui:RadioButton id="nowShatakuJikoKariage" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_JIKO_KARIAGE %>" label="自己借上" onclick="return false;" />
                                      <nfwui:RadioButton id="nowShatakuOther" name="nowShataku" value="<%= CodeConstant.GENNYUKYO_SHATAKU_KBN_OTHERS %>" label="その他" onclick="return false;" />
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
                                      <nfwui:RadioButton id="taikyoYoteiTaikyo" name="taikyoYotei" value="<%= CodeConstant.LEAVE %>" label="退居する" onclick="return false;" />
                                      <nfwui:RadioButton id="taikyoYoteiKeizoku" name="taikyoYotei" value="<%= CodeConstant.NOT_LEAVE %>" label="継続使用する" onclick="return false;" />
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
                                    <nfwui:RadioButtonGroup id="hitsuyoShataku">
                                      <nfwui:RadioButton id="hitsuyoShatakuSetai" name="hitsuyoShataku" value="<%= CodeConstant.SETAI %>" label="世帯" />
                                      <nfwui:RadioButton id="hitsuyoShatakuTanshin" name="hitsuyoShataku" value="<%= CodeConstant.TANSHIN %>" label="単身" />
                                      <nfwui:RadioButton id="hitsuyoShatakuDokushin" name="hitsuyoShataku" value="<%= CodeConstant.DOKUSHIN %>" label="独身" />
                                    </nfwui:RadioButtonGroup>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
<%  Skf2020Sc003Form form = (Skf2020Sc003Form)request.getAttribute("form"); %>
<imart:condition validity="<%= String.valueOf(form.isBihinVisible()) %>" >
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
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>冷蔵庫</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>オーブンレンジ</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>掃除機</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>電子炊飯ジャー</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>テレビ</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>テレビ台</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>座卓(こたつ)</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3"><label>キッチンキャビネット</label></th>
                                    <td colspan="1"><label>なし</label></td>
                                    <td colspan="1">
                                        <select >
                                            <option></option>
                                            <option  selected="selected">希望可能</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
                                        <textarea rows="4" cols="118" placeholder="修正依頼/差戻し理由" style="max-width: 700px;"></textarea>
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
                            <span style="font-size: 100%; heigth:90%;">
                            ■申請者からの社宅入居希望等調書を参考に、提示する社宅情報の確認及び備品希望可否を入力する画面です。
                            <br><br>
                            ボタン操作ガイド
                            <br>
                            ◆「<font color ="green">編集</font>」をクリックすると、必要とする社宅理由を編集することができます。
                            <br><br>
                            ◆「<font color ="green">確定</font>」をクリックすると、必要とする社宅理由の入力内容を保存することができます。
                            <br><br>
                            ◆「<font color ="green">取消</font>」をクリックすると、必要とする社宅理由の入力内容を取り消すことができます。
                            <br><br>
                            ◆「<font color ="green">資料を添付</font>」をクリックすると、申請時に必要な付帯書類を添付することができます。
                            <br><br>
                            ◆「<font color ="green">修正依頼</font>」をクリックすると、申請内容を修正依頼し、再申請させます。
                            <br><br>
                            ◆「<font color ="green">差戻し</font>」をクリックすると、申請内容を差戻しします。申請者は、再申請できません。
                            <br><br>
                            ◆「<font color ="green">一時保存</font>」をクリックすると、現在の入力内容を保存することができます。
                            <br><br>
                            ◆「<font color ="green">提示内容を確認</font>」をクリックすると、申請書類形式の確認画面が表示されます。
                            <br><br>
                            </span>
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
            <input class="imui-medium-button check" type="button" value="前の画面へ" style="width:150px;" onclick="back1()">
</td> 
<td align="right">
      <input class="imui-medium-button check" type="button" value="修正依頼" style="width:150px;" onclick="syuuseiirai()">
</td>
</tr>
    </tbody>

        <tbody>

<tr>
<td align="left">
</td> 
<td align="right">

      <input class="imui-medium-button check" type="button" value="資料を添付" style="width:150px;" onclick="shiryoutenpu()">
      <input class="imui-medium-button check" type="button" value="差戻し" style="width:150px;" onclick="sashimodoshi()">
      <input class="imui-medium-button check" type="button" value="提示内容を確認" style="width:150px;"  onclick="teijikakunin()">
</td>
</tr>
    </tbody>

    </table>

    </div>
  </div>
	<!-- コンテンツエリア　ここまで -->