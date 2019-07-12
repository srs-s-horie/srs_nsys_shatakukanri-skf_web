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

<%-- コンテンツエリア --%>
<style type="text/css">

</style>

<!-- コンテンツエリア:モックのまま -->
 <!-- 以下ツールバー -->
        <div class="imui-toolbar-wrap">
            <div class="imui-toolbar-inner">
                <!-- ツールバー左側 -->
                <ul class="imui-list-toolbar">
                    <!-- 戻る -->
                    <li>
                        <a class="imui-toolbar-icon" title="戻る" tabindex="23" onclick="back1()" href="javascript:void(0);">
                            <span class="im-ui-icon-common-16-back"></span>
                        </a>
                    </li>

                </ul>
                <!-- ツールバー右側 -->
                <ul class="imui-list-box-toolbar-utility">
                        					<li>
						<a onclick="back()" class="imui-toolbar-icon" tabindex="16">
							<span class="im-ui-icon-common-16-home"></span>
							社宅TOP
						</a>
					</li>
                </ul>
            </div>
        </div>

        <script type="text/javascript">

            /**
            * 一つ前の画面へ戻る
            */
            function back1() {
            showConfirm(W_GFK_0002, function() {
            history.back()
        });
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

        <div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv">
            <div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;">
            </div> 
        </div>

        <!-- コンテンツエリア -->
            <div class="imui-form-container-wide" width="1350px" style="max-width: 1350px;">
            <table class="imui-form-search-condition">
            
                <tr>
                    <th style="width: 120px;"><label id="stageCodeLabel">社宅名</label></th>
                    <td style="width: 300px;">
                        <input type="text" maxlength="22" tabindex="16" name="inputJoukenVal1" style="width: 80%;" id="inputJoukenVal1" value=""/>
                    </td>
                    <th style="width: 120px;"><label id="inputSLabel">地域区分</label></th>
                    <td style="width: 110px;">
                        <select style="width: 100%;" id="stageCode"  tabindex="12" name="stageCode">
                            <option value=""></option>
                            <option value="1">特</option>
                            <option value="2" selected="selected">甲</option>
                            <option value="3">乙</option>
                            <option value="4">他</option>
                        </select>
                    </td>
                    <th style="width: 120px;"><label id="inputSLabel">社宅区分</label></th>
                    <td style="width: *;">借上
                    </td>
                </tr>
            </table>
                <div id="tabs">
                    <ul>
                        <li><a href="#kihon_info">基本情報</a></li>
                        <li><a href="#room_info">部屋情報</a></li>
                        <li><a href="#parking_info">駐車場情報</a></li>
                        <li><a href="#bihin_info">備品情報</a></li>
                        <li><a href="#kanri_info">管理者情報</a></li>
                        <li><a href="#keiyaku_info">契約情報</a></li>
                    </ul>
                    <div id="kihon_info">
                        <table class="imui-form-search-condition">
                            <tbody>
                                <!--利用区分-->
                                <tr>
                                    <th colspan="2"  style="width:12.5%;">
                                        <label>利用区分</label>
                                    </th>
                                    <td colspan="4" style="width:37.5%">
                                        <select name="imui-8eqlrzsydhv75td" id="selectList_1" style="width:90px">
                                            <option value="0"></option>
                                            <option value="1">使用中</option>
                                            <option value="2">廃止</option>
                                            <option value="3">解約済</option>
                                        </select>
                                    </td>
                                </tr>
                                <!--管理会社-->
                                <tr>
                                    <th colspan="2">
                                        <label>管理会社</label>
                                    </th>
                                    <td colspan="4" style="width:37.5%">
                                        <select name="imui-8eqlrzsydhv75td" id="selectList_2" style="width:160px">
                                            <option value="0"></option>
                                            <option value="1">NEXCO中日本</option>
                                            <option value="2">NEXCO東日本</option>
                                            <option value="4">NEXCO西日本</option>
                                            <option value="5">高速道路総合研究所</option>
                                            <option value="6">外部機関</option>
                                        </select>
                                    </td>
                                </tr>
                                <!--管理機関-->
                                <tr>
                                    <th colspan="2">
                                        <label>管理機関</label>
                                    </th>
                                    <td colspan="4" style="width:37.5%">
                                        <select name="imui-8eqlrzsydhv75td" id="selectList_3" style="width:160px">
                                            <option value="0"></option>
                                            <option value="1">本社</option>
                                            <option value="2">東京支社</option>
                                            <option value="3">名古屋支社</option>
                                            <option value="4">八王子支社</option>
                                            <option value="5">金沢支社</option>
                                        </select>
                                    </td>
                                </tr>
                                <!--管理事業領域-->
                                <tr>
                                    <th colspan="2">
                                        <label>管理事業領域</label>
                                    </th>
                                    <td colspan="4" style="width:37.5%">
                                        <select name="imui-8eqlrzsydhv75td" id="selectList_4" style="width:160px">
                                            <option value="0"></option>
                                            <option value="1">東京支社 八王子(工)</option>
                                        </select>
                                    </td>
                                </tr>
                                <!--郵便番号-->
                                <tr>
                                    <th rowspan="2">
                                        <label>所在地</label>
                                    </th>
                                    <th>
                                        <label>郵便番号</label>
                                    </th>
                                    <td colspan="4">
                                        <input style="     width:85px;" type="text" value="">
                                        <input name="doSendBack" id="" type="button" value="住所検索" class="imui-small-button" />
                                    </td>
                                </tr>
                                <!--住所-->
                                <tr>
                                    <th>
                                        <label>住所</label>
                                    </th>
                                    <td colspan="4">
                                        <select name="imui-8eqlrzsydhv75td" id="selectList_5" style="width:90px">
                                            <option value="0"></option>
                                            <option value="1">東京都</option>
                                            <option value="2">鹿児島県</option>
                                        </select>
                                        <input style="     width:82%;" type="text" value="">
                                    </td>
                                </tr>
                                <!--構造-->
                                <tr>
                                    <th colspan="2">
                                        <label>構造</label>
                                    </th>
                                    <td colspan="4">
                                        <select name="imui-8eqlrzsydhv75td" id="selectList_6" style="width:90px">
                                            <option value="0"></option>
                                            <option value="1">木造</option>
                                            <option value="2">組積</option>
                                            <option value="3">鉄筋</option>
                                        </select>
                                        <input style="width:250px" type="text" value=""  placeholder="例 RC3F">
                                    </td>
                                </tr>
                                <!--エレベーター-->
                                <tr>
                                    <th colspan="2">
                                        <label>エレベーター</label>
                                    </th>
                                    <td colspan="4">
                                        <select name="imui-8eqlrzsydhv75td" id="selectList_7" style="width:90px">
                                            <option value="0"></option>
                                            <option value="1">あり</option>
                                            <option value="2">なし</option>
                                        </select>
                                    </td>
                                </tr>

                                <!--建築年月日-->
                                <tr>
                                    <th colspan="2">
                                        <label>建築年月日</label>
                                    </th>
                                    <td colspan="2" style="width:15%">
                                        <input type="text" name="hoge777" id="hoge777" value="2005/04/02"/>
                                        <script type="text/javascript">
                                            (function($){
                                                $.imDateUtil.setOffset(540);
                                                $(function () {
                                                    $("#hoge777").imuiCalendar({
                                                        "altField":"#hoge777",
                                                        "nextText":"来月",
                                                        "format":"yyyy\/MM\/dd",
                                                        "dayNames":[
                                                            "日曜日",
                                                            "月曜日",
                                                            "火曜日",
                                                            "水曜日",
                                                            "木曜日",
                                                            "金曜日",
                                                            "土曜日"
                                                        ],
                                                        "dayNamesShort":["日","月","火","水","木","金","土"],
                                                        "prevText":"先月",
                                                        "url":"calendar\/tag\/caljson",
                                                        "currentText":"現在",
                                                        "calendarId":"JPN_CAL",
                                                        "firstDay":0,
                                                        "closeText":"閉じる",
                                                        "dayNamesMin":["日","月","火","水","木","金","土"],
                                                        "monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],
                                                        "monthNames":[
                                                            "1月",
                                                            "2月",
                                                            "3月",
                                                            "4月",
                                                            "5月",
                                                            "6月",
                                                            "7月",
                                                            "8月",
                                                            "9月",
                                                            "10月",
                                                            "11月",
                                                            "12月"
                                                        ]
                                                    });
                                                });
                                            })(jQuery);
                                        </script>
                                    </td>
                                    <th style="width:6%">
                                        <label>実年数</label>
                                    </th>
                                    <td>
                                        13年
                                    </td>
                                </tr>
                                <!--次回算定年月日-->
                                <tr>
                                    <th colspan="2">
                                        <label>次回算定年月日</label>
                                    </th>
                                    <td colspan="2">
                                        2018/04/01
                                    </td>
                                    <th style="width:6%">
                                        <label>経年</label>
                                    </th>
                                    <td>
                                        10年
                                    </td>
                                </tr>
                                <!--社宅補足-->
                                <tr>
                                    <th rowspan="3" colspan="2">
                                        <label>社宅補足</label>
                                    </th>
                                    <td colspan="2">
                                        <a href="">周辺地図.xlsx</a>
                                    </td>
                                    <td colspan="2">
                                        <input name="doSendBack" id="" type="button" value="参照" class="imui-small-button" />
                                        <input name="doSendBack" id="" type="button" value="削除" class="imui-small-button" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2">
                                        <input name="doSendBack" id="" type="button" value="参照" class="imui-small-button" />
                                        <input name="doSendBack" id="" type="button" value="削除" class="imui-small-button" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td colspan="2">
                                        <input name="doSendBack" id="" type="button" value="参照" class="imui-small-button" />
                                        <input name="doSendBack" id="" type="button" value="削除" class="imui-small-button" />
                                    </td>
                                </tr>
                                <!--備考-->
                                <tr>
                                    <th rowspan="3" colspan="2">
                                        <label>備考</label>
                                    </th>
                                    <td rowspan="3" colspan="4">
                                        <textarea class="ime-off" style="width:98%;" rows="3"></textarea>
                                    </td>
                                    <td style="width: 30%;border:none;"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div id="room_info">
                        <table class="imui-form-search-condition">
                            <colgroup>
                                <col style="width:10%;"/>
                                <col/>
                                <col/>
                                <col/>
                                <col/>
                                <col/>
                            </colgroup>
                            <tbody>
                <tr>
                    <th  style="width: 13%;"><label>部屋番号</label></th>
                    <td style="width: 37%;">
                        <input class="ime-off" style="width: 120px;" type="text" value="802"></input>
                    </td>
                    <th  style="width: 13%;"><label>本来延面積</label></th>
                    <td>
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="38.91"></input>㎡
                    </td>
                </tr>
                <tr>
                    <th><label>本来規格</label></th>
                    <td>
                        <select style="width: 200px;" id="stageCode"  tabindex="12" name="stageCode">
                            <option value=""></option>
                            <option value="1">1R</option>
                            <option value="2">1K</option>
                            <option value="3">1DK</option>
                            <option value="4" selected="selected">1LDK</option>
                            <option value="5">1LK</option>
                            <option value="6">1LDKS</option>
                            <option value="7">2K</option>
                            <option value="8">2DK</option>
                            <option value="9">2LDK</option>
                            <option value="10">2LK</option>
                            <option value="11">2LDKS</option>
                            <option value="12">3K</option>
                            <option value="13">3DK</option>
                            <option value="14">3LDK</option>
                            <option value="15">3LK</option>
                            <option value="16">3LDKS</option>
                            <option value="17">4LDK</option>
                            <option value="18">その他</option>
                        </select>
                    </td>
                    <th><label>貸与延面積</label></th>
                    <td>
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="38.91"></input>㎡
                    </td>
                </tr>
                <tr>
                    <th><label>本来用途</label></th>
                    <td>
                        <select style="width: 200px;" id="stageCode"  tabindex="12" name="stageCode">
                            <option value=""></option>
                            <option value="1">世帯</option>
                            <option value="2" selected="selected">単身</option>
                            <option value="3">独身</option>
                        </select>
                    </td>
                    <th><label>サンルーム面積</label></th>
                    <td>
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="0"></input>㎡
                    </td>
                </tr>
                <tr>
                    <th><label>貸与区分</label></th>
                    <td>
                        <select style="width: 200px;" id="stageCode"  tabindex="12" name="stageCode">
                            <option value="" selected="selected"></option>
                            <option value="1">貸与可</option>
                            <option value="2">貸与不可</option>
                        </select>
                        <input class="ime-off" style="width: 120px;" type="text" placeholder="例 貸与区分"></input>
                    </td>
                    <th><label>寒冷地減免事由区分</label></th>
                    <td>
                        <select style="width: 200px;" id="stageCode"  tabindex="12" name="stageCode">
                            <option value="" selected="selected">無し</option>
                            <option value="1">サンルーム無し</option>
                            <option value="2">暖房無し</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th rowspan="4"><label>備考</label></th>
                    <td rowspan="4">
                        <textarea class="ime-off" style="width: 90%;" rows="5" cols="35"></textarea>
                    </td>
                </tr>
                <tr>
                    <th><label>階段面積</label></th>
                    <td>
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="0"></input>㎡
                    </td>
                </tr>
                <tr>
                    <th><label>物置面積</label></th>
                    <td>
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="0"></input>㎡
                    </td>
                </tr>
                <tr>
                    <th><label>物置調整面積</label></th>
                    <td>
                        0.00㎡
                    </td>
                </tr>
                                </tbody>
                            </table>
                        </div>

                    <!--駐車場情報-->
                    <div id="parking_info">
                        <table class="imui-form-search-condition">
                           <colgroup>
                                <col style="width:10%;"/>
                                <col/>
                                <col/>
                                <col style="width:30%;"/>
                            </colgroup>
            <tbody>
                            <tr>
                    <th><label>駐車場構造</label></th>
                    <td  colspan="2">
                        <select style="width: 200px;" id="stageCode"  tabindex="12" name="stageCode">
                            <option value=""></option>
                            <option value="1" selected="selected">なし</option>
                            <option value="2">屋外</option>
                            <option value="3">立体</option>
                        </select>
                    </td>
                   <td style="border:none" >
                  </td>

              <tr>
                    <th  style="width: 120px;"><label>駐車場所在地</label></th>
                    <td  style="width: 40%;" colspan="2">千葉県松戸市松戸新田
                    </td>
              </tr>
              <tr>
                    <th  style="width: 120px;" rowspan="3"><label>駐車場補足</label></th>
                    <td><a href="">区画マップ.xlsx </a></td>
                <td style="width: 100px;" >
                    <input class="imui-small-button check" id="geninshaBtn" type="button" value="参照">&nbsp;
                    <input class="imui-small-button check" id="geninshaBtn" type="button" value="削除"></td>
                </td>
                </tr>
                <tr>
                    <td><a href=""></a></td>
                <td style="width: 100px;" >
                    <input class="imui-small-button check" id="geninshaBtn" type="button" value="参照">&nbsp;
                    <input class="imui-small-button check" id="geninshaBtn" type="button" value="削除"></td>
                </td>
                </tr>
                <tr>
                    <td><a href=""></a></td>
                <td style="width: 100px;" >
                    <input class="imui-small-button check" id="geninshaBtn" type="button" value="参照">&nbsp;
                    <input class="imui-small-button check" id="geninshaBtn" type="button" value="削除"></td>
                </td>
                </tr>
                <tr>
                    <th  style="width: 120px;"><label>区画番号</label></th>
                    <td colspan="2">
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="000001"></input>
                    </td>
                </tr>
                <tr>
                    <th  style="width: 120px;"><label>貸与区分</label></th>
                    <td colspan="2">
                        貸与可
                    </td>
                </tr>
                <tr>
                    <th  style="width: 120px;"><label>使用者</label></th>
                    <td colspan="2">
                    </td>
                </tr>
              
                <tr>
                    <th  style="width: 120px;"><label>駐車場基本使用料</label></th>
                    <td colspan="2">5,537円
                    </td>
                </tr>

                <tr>
                    <th  style="width: 120px;"><label>駐車場調整金額</label></th>
                    <td colspan="2">
                      <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="-200"></input>&nbsp;円
                    </td>
                </tr>

                <tr>
                    <th  style="width: 120px;"><label>駐車場月額使用料</label></th>
                    <td colspan="2">5,537円
                    </td>
                </tr>
                <tr>
                    <th  style="width: 120px;" rowspan="4"><label>備考</label></th>
                    <td rowspan="4" colspan="2">
                        <textarea class="ime-off" style="width: 90%;" rows="5" cols="35"></textarea>
                    </td>
                </tr>
            </tbody>
 </table>

                    </div>

                    <div id="bihin_info">
                        <table class="imui-form">
                        <!-- 明細部 -->
                        <form id="bihinList">
                            <script type="text/javascript">
                                (function($){
                                $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
                                })(jQuery);
                            </script>

                            <table name="imui-8eqlrzst4hv6std" id="bihinListTable1"></table>

                            <div id="bihinListTable1-pager"></div>

                            <script type="text/javascript">
                                (function() {
                                    function imuiListTable() {
                                        var grid = jQuery('#bihinListTable1');
                                        var parameter = {
                                            "multiselect":false,
//                                            "pager":"#bihinListTable1-pager",
                                            "colNames":[
                                                "備品名称",
                                                "備付状況",
                                            ],
                                            "datatype":"local",
                                            "errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
                                            "rowNum":13,
                                            "width":"290",
                                            "shrinkToFit":"true",
                                            "cellsubmit":"clientArray",
                                            "loadonce":true,
                                            "colModel":[
                                                {"name":"bihin_name","width":"180","align":"left"}<!-- 備品名称 -->
                                                ,{"name":"sonaetsuke_status","width":"100","align":"center"}<!-- 備付状況 -->
                                            ],
                                            "rownumbers":false,
                                            "height":"400"
                                        };
                                        parameter.data = [
                                            {
                                                "bihin_name":"洗濯機",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1'>なし</option><option value='2'>備付</option><option value='3' selected>共有</option></select>"
                                            },{
                                                "bihin_name":"冷蔵庫",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1'>なし</option><option value='2'>備付</option><option value='3' selected>共有</option></select>"
                                            },{
                                                "bihin_name":"オーブンレンジ",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"掃除機",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"電子炊飯ジャー",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"テレビ",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"テレビ台",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"座卓(こたつ)",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"キッチンキャビネット",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"ルームエアコン",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"カーテン",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"照明器具",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1' selected>なし</option><option value='2'>備付</option><option value='3'>共有</option></select>"
                                            },{
                                                "bihin_name":"ガステーブル",
                                                "sonaetsuke_status":"<select style='width:95%;'><option value='0'></option><option value='1'>なし</option><option value='2' selected>備付</option><option value='3'>共有</option></select>"
                                            }
                                        ];

                                        grid.jqGrid(parameter);


// as
//                                            // 1行づつ網掛け挑戦
//                                            jQuery('#bihinListTable1').jqGrid({
//                                                loadComplete: function () {
//                                                    var rowIDs = jQuery('#bihinListTable1').getDataIDs(); 
//                                                    $.each(rowIDs, function (i, item) {
//                                                        if (i % 2 == 0) {
//                                                            $('#'+item).removeClass('ui-widget-content');
//                                                            $('#'+item).addClass('testcss');
//                                                        }
//                                                    });
//                                                },
//                                            });
//                                            jQuery('#bihinListTable1').jqGrid({
//                                                gridComplete: function () {
//                                                    $('tbody > tr:even', this).addClass('ui-row-even');
//                                                }
//                                            });
// ae

//                                        grid.jqGrid('navGrid','#bihinListTable1-pager',{
//                                            edit: false,
//                                            add: false,
//                                            del: false,
//                                            search: false,
//                                        });

                                        var gboxGridId     = 'gbox_bihinListTable1';
                                        var gboxGrid       = jQuery('#' + gboxGridId);
                                        var parentWidthOld = Number.MIN_VALUE;
                                    }

                                    (function($) {
                                        $(document).ready(function() {
                                            imuiListTable();
                                        });
                                    })(jQuery);

                                })();
                            </script>
                            <style type="text/css">  
                                <!--
                                    /* ヘッダテキスト中央寄せ */
                                    .ui-jqgrid .ui-jqgrid-htable th {
                                        display:table-cell;
                                        height: 32px;
                                        text-align:center;
                                        vertical-align:middle;
                                    }
                                    .ui-jqgrid .ui-jqgrid-htable th div {
                                        display:table-cell;
                                        height: 32px;
                                        text-align:center;
                                        vertical-align:middle;
                                    }
                                    /** 1行間隔で網掛け挑戦
                                    .testcss {
                                        border: 1px solid #a6c9e2;
                                        background-color: #e6e6fa ;
                                        color: #222222;
                                    }

                                    .ui-row-even {
                                        background-color: #e6e6fa ;
                                    }
                                    */

                                    /* データ行の改行許容 */
                                    #bihinListTable1 tr td{
                                        white-space:normal;
                                    }
                                -->
                            </style>
                        </form>
                    </div>

                    <div id="kanri_info">
                    <table class="imui-form-search-condition">
                        <colgroup>
                            <col style="width:10%;"/>
                            <col/>
                            <col/>
                            <col/>
                            <col/>
                            <col/>
                        </colgroup>
                        <tbody>
                            <!--駐車場構造-->
                            <tr >
                                <td style="width:15%;background-color:white;border:none"/>
                                <th style="width:20%;">
                                    <label style="width:165px;">管理会社</label>
                                </th>
                                <th style="width:20%;">
                                    <label style="width:165px;">鍵管理者</label>
                                </th>
                                <td style="width:20%;border:none;"></td>
                                <td style="width:20%;border:none;"></td>
                            </tr>
                            <!--会社名-->
                            <tr>
                                <th>
                                    <label style="width:185px">会社名</label>
                                </th>
                                <td>
                                    <input style="width:150px;" type="text" name="hoge002" value="〇〇管理会社" placeholder="例 〇〇株式会社"/>
                                </td>
                                <td>
                                    <input style="width:150px;" type="text" name="hoge002" value="〇〇管理会社"  placeholder="例 〇〇株式会社"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>担当者名</label>
                                </th>
                                <td>
                                    <input style="width:150px;height:98%" type="text" name="hoge002" value="川田　太郎" placeholder="例 中日本 太郎"/>
                                </td>
                                <td>
                                    <input style="width:150px;height:98%" type="text" name="hoge002" value="海田　次郎" placeholder="例 中日本 太郎"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>電子メールアドレス</label>
                                </th>
                                <td>
                                    <input style="width:260px;" type="text" name="hoge002" value="tarou@kawada.com" placeholder="例 t.nakanihon.aa@"/>
                                </td>
                                <td>
                                    <input style="width:260px;" type="text" name="hoge002" value="jirou@umida.net" placeholder="例 t.nakanihon.aa@"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>電話番号</label>
                                </th>
                                <td>
                                    <input style="width:150px;height:98%" type="text" name="hoge002" value="045-123-4567" placeholder="例 052-999-999"/>
                                </td>
                                <td>
                                    <input style="width:150px;height:98%" type="text" name="hoge002" value="045-123-4567" placeholder="例 052-999-999"/>
                                </td>

                            </tr>

                            <!--備考-->
                            <tr>
                                <th rowspan="4">
                                    <label>備考</label>
                                </th>
                                <td rowspan="4">
                                    <textarea class="ime-off" style="width:260px;" rows="4"></textarea>
                                </td>
                                <td rowspan="4">
                                    <textarea class="ime-off" style="width:260px;" rows="4"></textarea>
                                </td>
                            </tr>
                            <tr />
                            <tr />
                            <tr />
                        </tbody>
                    </table>
                    </div>
                    <div id="keiyaku_info">
                        <table class="imui-form-search-condition">
                            <colgroup>
                                <col style="width:5%;"/>
                                <col style="width:5%;"/>
                                <col style="width:7%;"/>
                                <col style="width:33%;"/>
                                <col style="width:5%;"/>
                                <col style="width:5%;"/>
                                <col style="width:7%;"/>
                                <col style="width:33%;"/>
                            </colgroup>
                            <tbody>
             <tr>
               <th rowspan="11" style=""><label>社宅</label></th>
               <th colspan="2"><label>契約番号</label></th>
               <td>
                        <select style="width: 200px;" id="stageCode"  tabindex="12" name="stageCode">
                            <option value=""></option>
                            <option value="1" selected="selected">1：契約開始日 2018/12/01</option>
                            <option value="2">2：契約開始日 2018/12/05</option>
                            <option value="3">3：契約開始日 2018/12/10</option>
                            <option value="4">4：契約開始日 2018/12/15</option>
                            <option value="5">5：</option>
                        </select>
                        <input name="doSendBack" id="" type="button" value="追加" class="imui-small-button"/>
                        <input name="doSendBack" id="" type="button" value="削除" class="imui-small-button" />

               </td>
               <th rowspan="11" style=""><label>駐車場</label></th>
                              <th colspan="2"><label>契約番号</label></th>
               <form>
               <td>
                        <select style="width: 200px;" id="Pack1" tabindex="12" name="Change1">
                            <option value=""></option>
                            <option value="1" selected="selected">1：契約開始日 2018/12/01</option>
                            <option value="2">2：契約開始日 2018/12/05</option>
                            <option value="3">3：契約開始日 2018/12/10</option>
                            <option value="4">4：契約開始日 2018/12/15</option>
                            <option value="5">5：</option>
                        </select>
                        <input name="doSendBack" id="" type="button" value="追加" class="imui-small-button"/>
                        <input name="doSendBack" id="" type="button" value="削除" class="imui-small-button" />
               </td>

             </tr>

             <tr>
             


               <th style="width: 150px;"  colspan="2">
               <label>賃貸人（代理人）<label></th>
               <td>
               <input class="ime-off" style="width: 150px;" type="text" value="中日本太郎"></input>
               <input name="doSendBack" id="" type="button" value="支援" class="imui-small-button"  onclick="openChintaininWindow()"/>
               </td>

               <th  colspan="2"><label>契約形態</label></th>
               <td>
                                       <select id="IDOS" onchange="check(this)">
                            <option value=""></option>
                            <option value="社宅と一括契約" selected="selected">社宅と一括契約</option>
                            <option value="社宅と別契約">社宅と別契約</option>
                        </select>

               </td>
             </tr>
                                <tr>
                                    <th rowspan="2">
                                        <label>所在地</label>
                                    </th>
                                    <th>
                                        <label>郵便番号</label>
                                    </th>
                                    <td>
                                         111-1234

                                    </td>
              <th style="width: 150px;"  colspan="2">
               <label>賃貸人（代理人）<label></th>
               <td>
               <input class="ime-off" style="width: 150px;" type="text" value="中日本太郎"  name="Change2" disabled></input>
               <input name="doSendBack" id="" type="button" value="支援" class="imui-small-button"  onclick="openChintaininWindow()"/>
               </td>
                                </tr>
                                <!--住所-->
                                <tr>
                                    <th>
                                        <label>住所</label>
                                    </th>
                                    <td>

                                        東京都〇〇市△△△1-2-3  
                                    </td>
                                    
                                    
                                    <th rowspan="2">
                                        <label>所在地</label>
                                    </th>
                                    <th>
                                        <label>郵便番号</label>
                                    </th>
                                    <td>
                                        <input style="     width:85px;" type="text" value=""  name="Change3" disabled>
                                        <input name="doSendBack" id="" type="button" value="住所検索" class="imui-small-button" />
                                    </td>
                                </tr>

             <tr>
               <th style="width: 150px;" colspan="2">
               <label>経理連携用管理番号<label>
               </th>
               <td>
               <input class="ime-off" style="width: 150px; text-align: left;" type="text" value="A009160717202"></input>
               </td>
               <th><label>住所</label></th>
               <td>
               <input class="ime-off" style="width: 300px;" type="text" value=""  name="Change4" disabled></input>
               </td>
             </tr>

             <tr>
               <th style="width: 150px;" colspan="2">
               <label>契約開始日<label>
               </th>
                    <td>
                        <input type="text" name="cal003" id="cal003" value="2018/12/01"/>
                    </td>
               <th style="width: 150px;" colspan="2">
               <label>駐車場名<label>
               </th>
               <td>
               <input class="ime-off" style="width: 150px; text-align: left;" type="text" value="" name="Change5" disabled></input>
               </td>

             </tr>

             <tr>
               <th style="width: 150px;" colspan="2">
               <label>契約終了日<label>
               </th>
                    <td>
                        <input type="text" name="cal002" id="cal002" value=""/>
                    </td>
               <th style="width: 150px;" colspan="2">
               <label>経理連携用管理番号<label>
               </th>
               <td>
               <input class="ime-off" style="width: 150px; text-align: left;" type="text" value="" name="Change6" disabled></input>
               </td>
             </tr>

             <tr>
               <th style="width: 150px;" colspan="2"> 
               <label>家賃<label>
               </th>
                    <td>
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="50,000"></input>&nbsp;円
                    </td>
               <th style="width: 150px;"   colspan="2">
               <label>契約開始日<label>
               </th>
                    <td>
                        <input type="text" name="Change7" id="Change7" value="" disabled></input>
                    </td>

             </tr>

             <tr>
               <th style="width: 150px;" colspan="2">
               <label>共益費<label>
               </th>
                    <td>
                        <input class="ime-off" style="width: 100px; text-align: right;" type="text" value="10,000"></input>&nbsp;円
                    </td>

               <th style="width: 150px;"   colspan="2">
               <label>契約終了日<label>
               </th>
                    <td>
                        <input type="text" id="Change8" value="" disabled/>
                    </td>

             </tr>

             <tr>
               <th style="width: 150px;"   colspan="2">
               <label>駐車場料（地代）<label>
               </th>
                    <td>
                        <input id="Change11" name="Change11" style="width: 100px; text-align: right;" type="text" value="15,000"></input>&nbsp;円
                    </td>

				<th style="width: 150px;"   colspan="2">
               <label>駐車場料（地代）<label>
               </th>

                    <td>
                      <input id="Change12" name="Change12" style="width: 100px; text-align: right;" type="text" value="" disabled></input>&nbsp;円
                    </td>

               </tr>

               <tr>

               <th style="width: 150px;" rowspan ="2"   colspan="2">
               <label>備考<label>
               </th>
                    <td rowspan="2">
                        <textarea class="ime-off" style="width: 90%;" rows="2" cols="35"></textarea>
                    </td>
                    
               <th style="width: 150px;" rowspan ="2"   colspan="2">
               <label>備考<label>
               </th>
                    <td rowspan="2">
                        <textarea class="ime-off" style="width: 90%;" rows="2" cols="35"></textarea>
                    </td>   
               </tr>


</form>
                            </tbody>
                        </table>
                    </div>


    <!-- カレンダー出力用スクリプト -->
    <script type="text/javascript">
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal001").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal002").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal003").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#Change7").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#Change8").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal006").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal007").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal008").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);      
      (function($){ $.imDateUtil.setOffset(540); $(function () { $("#cal009").imuiCalendar({"altField":"#hoge777","nextText":"来月","format":"yyyy\/MM\/dd","dayNames":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"dayNamesShort":["日","月","火","水","木","金","土"],"prevText":"先月","url":"calendar\/tag\/caljson","currentText":"現在","calendarId":"JPN_CAL","firstDay":0,"closeText":"閉じる","dayNamesMin":["日","月","火","水","木","金","土"],"monthNamesShort":["1","2","3","4","5","6","7","8","9","10","11","12"],"monthNames":["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]}); }); })(jQuery);
    </script>
<!-- ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー -->
                <script>
                    $(function() {
                        $( "#tabs" ).tabs();
                    });
                </script>
<script type="text/javascript">
function ImageUp() {
window.open("../pop/pop_ShainSentaku.html","window1","width=650px,height=600px","menubar=no,resizable=yes");
}

function openWindow(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=680px,title=no';
  var window1 = window.open("../pop/pop_ShainNyuryokuShien.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}

function openChintaininWindow(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=700px,title=no';
  var window1 = window.open("../pop/pop_ChintaininSentaku.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}

</script>
				<script type="text/javascript">
				function check(sel) {
				var v = sel.value, frm = sel.form;
				flg = (v=='社宅と別契約' || v=='')?false:true;
				frm.elements['Change2'].disabled = flg;
				frm.elements['Change3'].disabled = flg;
				frm.elements['Change4'].disabled = flg;
				frm.elements['Change5'].disabled = flg;
				frm.elements['Change6'].disabled = flg;
				frm.elements['Change7'].disabled = flg;
				frm.elements['Change8'].disabled = flg;
				<!--frm.elements['Change11'].disabled = flg; -->
				frm.elements['Change12'].disabled = flg;
				frm.elements['Change11'].value = null;
				frm.elements['Change12'].value = null
				}
				</script>
            </div>
            
            <br/>
                        <div class="align-L float-L">    
                <input style="width:150px;" name="doSendBack" id="" type="button" value="前の画面へ" class="imui-medium-button" onclick="back1()"/>
            </div>
            <div class="align-R">
                <input style="width:150px;" name="doSendBack" id="" type="button" value="登録" class="imui-medium-button" />
                <input style="width:150px;" name="doSendBack" id="" type="button" value="削除" class="imui-medium-button" disabled/>
            </div>

            
            
            </div>
	<!-- コンテンツエリア　ここまで -->