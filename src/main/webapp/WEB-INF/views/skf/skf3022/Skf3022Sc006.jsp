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
<%@ page import="jp.co.c_nexco.skf.common.constants.FunctionIdConstant" %>

<%-- コンテンツエリア --%>
<script type="text/javascript">
function back1() {
	var url="skf/Skf3022Sc005/init?SKF3022_SC005&tokenCheck=0"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？");
}
</script>

	<!-- コンテンツエリア -->
	<nfwui:Form id="form" name="form" modelAttribute="form">
		<input type="hidden" name="prePageId" id="prePageId" value="<%=FunctionIdConstant.SKF3022_SC006 %>" />
		<input type="hidden" name="hdnShatakuKanriNo" id="hdnShatakuKanriNo" value="${form.hdnShatakuKanriNo}" />
		<input type="hidden" name="hdnShatakuName" id="hdnShatakuName" value="${form.shatakuName}" />
		<input type="hidden" name="hdnParkingShienParkNo" id="hdnParkingShienParkNo" value="" />
		<input type="hidden" name="hdnParkingShienParkBlock" id="hdnParkingShienParkBlock" value="" />
		<input type="hidden" name="hdnParkingShienParkRentalAsjust" id="hdnParkingShienParkRentalAsjust" value="" />
		<input type="hidden" name="hdnParkingShienEndDay" id="hdnParkingShienEndDay" value="" />
	
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<table class="imui-form-search-condition">
				<tbody>
					<tr>
						<th>
							<label style="width:60px;">社員番号</label>
						</th>
						<td>
							<div style="width:100px;">
								00903906
							</div>
						</td>
						<td>
							<input type="button" value="申請内容" class="imui-small-button"/>
						</td>

						<th>
							<label style="width:60px;">社宅名</label>
						</th>
						<td colspan="2">
							<div style="width:200px;">稲沢A棟</div>
						</td>
						<th>
							<label style="width:100px;">貸与規格</label>
						</th>
						<td colspan="2">
							<div style="width:200px;">2LDK ⇒ 2LDK</div>
						</td>
						<td style="border:none;"></td>
						<td style="border:none;"></td>
						<th>
							<label style="width:60px;text-align:center;">入退居</label>
						</th>
						<th>
							<label style="width:60px;text-align:center;">社宅提示</label>
						</th>
						<th>
							<label style="width:60px;text-align:center;">備品提示</label>
						</th>
						<td style="width:20%;border:none;"></td>
					</tr>
					<tr>
						<th>
							<label style="width:60px;">社員氏名</label>
						</th>
						<td colspan="2">
							<div style="width:206px;">
								中日本 3906
							</div>
						</td>
						<th>
							<label style="width:60px;">部屋番号</label>
						</th>
						<td style="width:100px;">
							504
						</td>
						<td>
							<input type="button" value="社宅入力支援" class="imui-small-button" onclick="openWindow()"/>
						</td>
						<th>
							<label>社宅使用料月額</label>
						</th>
						<td style="width:100px;">
							19,081円
						</td>
						<td>
							<input type="button" value="使用料入力支援" class="imui-small-button" onclick="openWindow3()"/>
						</td>
						<td style="border:none;"></td>
						<td style="border:none;"></td>
						<td style="text-align:center;">
							入居
						</td>
						<td style="text-align:center;">
							<font style="color:green">同意済</font>
						</td>
						<td style="text-align:center;">
							<font style="color:green">作成中</font>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="tabs">
				<ul>
					<li><a href="#shataku_info">社宅情報</a></li>
					<li><a href="#bihin_info">備品情報</a></li>
					<li><a href="#officer_info">役員情報／相互利用情報</a></li>
				</ul>
				<div id="shataku_info">
					<table class="imui-form-search-condition">
						<tbody>
							<tr>
								<th rowspan="2">
									<label style="width:115px;">入居者情報</label>
								</th>
								<th>
									<label style="width:198px;">原籍会社名</label>
								</th>
								<td>
									<div style="width:200px;">
										<select style="width:180px">
											<option value="0"></option>
											<option value="1" selected>NEXCO中日本</option>
											<option value="2">NEXCO東日本</option>
											<option value="4">NEXCO西日本</option>
											<option value="5">高速道路総合研究所</option>
											<option value="6">外部機関</option>
										</select>
									</div>
								</td>
								<th rowspan="12">
									<label style="width:100px;">貸与駐車場</label>
								</th>
								<th rowspan="5">
									<label style="width:100px;">区画1</label>
									&nbsp;
									<nfwui:PopupButton id="parkingShien1" name="parkingShien1" value="支援" use="popup" 
											cssClass="imui-small-button" popupWidth="650" popupHeight="700"  
											modalMode="true" screenUrl="skf/Skf3022Sc002/init" 
											parameter="hdnShatakuKanriNo:hdnShatakuKanriNo,hdnShatakuName:hdnShatakuName,hoge777:hdnRiyouStartDay" disabled="" 
											 callbackFunc="parkingShienCallback1()" tabindex="6"/> 
									&nbsp;
									<input type="button" value="クリア" class="imui-small-button" />
								</th>
								<th>
									<label style="width:130px;">区画番号</label>
								</th>
								<td>
									<div style="width:185px;">
										<span id="park1blockNo">A12</span>
									</div>
								</td>
								<td style="width:38%;border:none;"></td>
							</tr>
							<tr>
								<th>
									<label>給与支給会社名</label>
								</th>
								<td>
									<select style="width:180px">
										<option value="0"></option>
										<option value="1" selected>NEXCO中日本</option>
										<option value="2">NEXCO東日本</option>
										<option value="4">NEXCO西日本</option>
										<option value="5">高速道路総合研究所</option>
										<option value="6">外部機関</option>
									</select>
								</td>
								<th>
									<label>利用開始日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge777" style="text-align: right;" type="text" value="2018/12/01"/>
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
							</tr>
							<tr>
								<th rowspan="15">
									<label>貸与社宅</label>
								</th>
								<th>
									<label>入居予定日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge778" style="text-align: right;" type="text" value="2018/12/01"/>
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge778").imuiCalendar({
													"altField":"#hoge778",
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
								<th>
									<label>利用終了日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge779" style="text-align: right;" type="text" value="____/__/__"/>
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge779").imuiCalendar({
													"disabled":"true",
													"altField":"#hoge779",
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
							</tr>
							<tr>
								<th>
									<label>退居予定日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge780" style="text-align: right;" type="text" value="____/__/__"/>
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge780").imuiCalendar({
													"disabled":"true",
													"altField":"#hoge780",
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
								<th>
									<label>駐車場使用料月額</label>
								</th>
								<td>
									2,412円
								</td>
							</tr>
							<tr>
								<th>
									<label>居住者区分</label>
								</th>
								<td>
									<select style="width:106px">
										<option value="0"></option>
										<option value="1" selected>本人同居</option>
									</select>
								</td>
								<th>
									<label>駐車場使用料日割金額</label>
								</th>
								<td>
									0円
								</td>
							</tr>
							<!--貸与用途-->
							<tr>
								<th>
									<label>貸与用途</label>
								</th>
								<td>
									世帯
								</td>
								<th rowspan="5">
									<label>区画2</label>
									&nbsp;
									<nfwui:PopupButton id="parkingShien2" name="parkingShien2" value="支援" use="popup" 
											cssClass="imui-small-button" popupWidth="650" popupHeight="700"  
											modalMode="true" screenUrl="skf/Skf3022Sc002/init" 
											parameter="hdnShatakuKanriNo:hdnShatakuKanriNo,hdnShatakuName:hdnShatakuName,hoge781:hdnRiyouStartDay" 
											 callbackFunc="parkingShienCallback2()" tabindex="6"/> 
									&nbsp;
									<input type="button" value="クリア" class="imui-small-button" />
								</th>
								<th>
									<label>区画番号</label>
								</th>
								<td><span id="park2blockNo"></span></td>
							</tr>
							<!--貸与規格-->
							<tr>
								<th>
									<label>貸与規格</label>
								</th>
								<td>
									2LDK
								</td>
								<th>
									<label>利用開始日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge781" style="width:160px;text-align: right;" type="text" value="____/__/__" />
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge781").imuiCalendar({
													"altField":"#hoge781",
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
							</tr>
							<!-- 役員算定 -->
							<tr>
								<th>
									<label>役員算定</label>
								</th>
								<td>
									<select style="width:60px">
										<option value="0"></option>
										<option value="1" selected>なし</option>
										<option value="2">あり</option>
									</select>
								</td>
								<th>
									<label>利用終了日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge782" style="width:160px;text-align: right;" type="text" value="____/__/__" />
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge782").imuiCalendar({
													"disabled":"true",
													"altField":"#hoge782",
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
							</tr>
							<!-- 社宅使用料月額 -->
							<tr>
								<th>
									<label>社宅使用料月額</label>
								</th>
								<td>
									19,081円
								</td>
								<th>
									<label>駐車場使用料月額</label>
								</th>
								<td>
									0円
								</td>
							</tr>
							<!-- 社宅使用料日割金額 -->
							<tr>
								<th>
									<label>社宅使用料日割金額</label>
								</th>
								<td>
									0円
								</td>
								<th>
									<label>駐車場使用料日割金額</label>
								</th>
								<td>
									0円
								</td>
							</tr>
							<!-- 社宅使用料調整金額 -->
							<tr>
								<th>
									<label>社宅使用料調整金額</label>
								</th>
								<td>
									<input class="ime-off" type="text" style="width:100px;text-align: right;" value="0"/>
									円
								</td>
								<th colspan="2">
									<label>駐車場使用料調整金額</label>
								</th>
								<td>
									<input class="ime-off" type="text" style="width:100px;text-align: right;" value="0"/>
									円
								</td>
							</tr>
							<!-- 社宅使用料月額(調整後) -->
							<tr>
								<th>
									<label>社宅使用料月額(調整後)</label>
								</th>
								<td>
									0円
								</td>
								<th colspan="2">
									<label>駐車場使用料月額(調整後)</label>
								</th>
								<td>
									0円
								</td>
							</tr>
							<!-- 個人負担共益費 協議中 -->
							<tr>
								<th>
									<label>個人負担共益費 協議中</label>
								</th>
								<td>
									<input type="checkbox"/>
								</td>
								<th rowspan="3">
									<label>備考</label>
								</th>
								<td rowspan="3" colspan="3">
									<textarea style="width:453px;" rows="5"></textarea>
								</td>
							</tr>
							<!-- 個人負担共益費月額 -->
							<tr>
								<th>
									<label>個人負担共益費月額</label>
								</th>
								<td>
									<input class="ime-off" type="text" style="width:100px;text-align: right;" value="0"/>
									円
								</td>
							</tr>
							<!-- 個人負担共益費調整金額 -->
							<tr>
								<th>
									<label>個人負担共益費調整金額</label>
								</th>
								<td>
									<input class="ime-off" type="text" style="width:100px;text-align: right;" value="0"/>
									円
								</td>
							</tr>
							<!-- 個人負担共益費月額(調整後) -->
							<tr>
								<th>
									<label>個人負担共益費月額(調整後)</label>
								</th>
								<td>
									0円
								</td>
							</tr>
							<!-- 共益費支払月 -->
							<tr>
								<th>
									<label>共益費支払月</label>
								</th>
								<td>
									<select style="width:60px">
										<option value="0"></option>
										<option value="1">翌月</option>
										<option value="2">当月</option>
										<option value="3">前月</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="bihin_info">
					<table class="imui-form-search-condition" width="1100px">
						<tbody>
							<tr>
								<td style="width: 35%;border:none;">
									<script type="text/javascript">
										(function($){
										$.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
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
				//											"pager":"#bihinListTable1-pager",
													"colNames":[
														"",
														"備品名称",
														"部屋備付状態",
														"",
														"備品貸与状態",
														"指示書",
													],
													"datatype":"local",
													"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
//													"rowNum":16,
													"width":"540",
													"shrinkToFit":"true",
													"cellsubmit":"clientArray",
													"loadonce":true,
													"colModel":[
														{"hidden":true,"name":"id","key":true}
														,{"name":"bihin_name","width":"205","align":"left"}<!-- 備品名称 -->
														,{"name":"sonaetsuke_status","width":"100","align":"center"}<!-- 部屋備付状態 -->
														,{"name":"mark","width":"40","align":"center"}<!-- マーク -->
														,{"name":"bihinTaiyo_status","width":"100","align":"center"}<!-- 備品貸与状態 -->
														,{"name":"directions","width":"70","align":"center"}<!-- 指示書 -->
													],
													"rownumbers":false,
													"height":"400"
												};
												parameter.data = [
													{
														"id":1,
														"bihin_name":"洗濯機",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":2,
														"bihin_name":"冷蔵庫",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":3,
														"bihin_name":"オーブンレンジ",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":4,
														"bihin_name":"掃除機",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":5,
														"bihin_name":"電子炊飯ジャー",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":6,
														"bihin_name":"テレビ",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":7,
														"bihin_name":"テレビ台",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":8,
														"bihin_name":"座卓(こたつ)",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3' selected>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":"搬入"
													},{
														"id":9,
														"bihin_name":"キッチンキャビネット",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2' selected>会社保有</option><option value='3' >レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":""
													},{
														"id":10,
														"bihin_name":"ルームエアコン",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2' >会社保有</option><option value='3' >レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":""
													},{
														"id":11,
														"bihin_name":"カーテン",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2' >会社保有</option><option value='3' >レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":""
													},{
														"id":12,
														"bihin_name":"照明器具",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2' >会社保有</option><option value='3' >レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":""
													},{
														"id":13,
														"bihin_name":"ガステーブル",
														"sonaetsuke_status":"なし",
														"mark":"<span class='im-ui-icon-common-16-arrow-right' />",
														"bihinTaiyo_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2' >会社保有</option><option value='3' >レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>",
														"directions":""
													}
												];

												grid.jqGrid(parameter);

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
								</td>
								<td style="border:none;">
									<div style="width:7px;"></div>
								</td>
								<td style="width: 80%;border:none;">
									<table class="imui-form-search-condition">
										<tbody>
											<tr>
												<th colspan="2">
													<label style="width:308px;">貸与日</label>
												</th>
												<td colspan="2">
													<div style="width:251px;">
														<input class="ime-off" id="hoge783" style="text-align: right;" type="text" value="2018/11/01" />
														<script type="text/javascript">
															(function($){
																$.imDateUtil.setOffset(540);
																$(function () {
																	$("#hoge783").imuiCalendar({
																		"altField":"#hoge783",
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
													</div>
												</td>
												<td style="width:40%;border:none;"></td>
											</tr>
											<tr>
												<th colspan="2">
													<label>返却日</label>
												</th>
												<td colspan="2">
													<input class="ime-off" id="hoge784" style="text-align: right;" type="text" value="____/__/__" />
													<script type="text/javascript">
														(function($){
															$.imDateUtil.setOffset(540);
															$(function () {
																$("#hoge784").imuiCalendar({
																	"disabled":"true",
																	"altField":"#hoge784",
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
											</tr>
											<tr>
												<th rowspan="4">
													<label>搬入</label>
												</th>
												<th>
													<label style="width:181px;">希望日時</label>
												</th>
												<td>
													<div style="width:142px;">
													<input class="ime-off" id="hoge785" style="text-align: right;" type="text" value="2018/11/01" />
													<script type="text/javascript">
														(function($){
															$.imDateUtil.setOffset(540);
															$(function () {
																$("#hoge785").imuiCalendar({
																	"altField":"#hoge785",
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
													</div>
												</td>
												<td>
													<select style="width:100px;">
														<option value="0"></option>
														<option value="1" selected>指定なし</option>
														<option value="2" >8:00～12:00</option>
														<option value="3" >12:00～15:00</option>
														<option value="4" >15:00～18:00</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>
													<label>本人連絡先</label>
												</th>
												<td colspan="2">
													<input class="ime-off" type="text" style="width:244px;" value="000-0000-0000" />
												</td>
											</tr>
											<tr>
												<th>
													<label>受取代理人</label>
												</th>
												<td>
													<input type="text" style="100px;" />
												</td>
												<td>
													<input type="button" value="社員入力支援" class="imui-small-button" />
												</td>
											</tr>
											<tr>
												<th>
													<label>受取代理人連絡先</label>
												</th>
												<td colspan="2">
													<input class="ime-off" type="text" style="width:244px;"/>
												</td>
											</tr>
											<tr>
												<th rowspan="4">
													<label>搬出</label>
												</th>
												<th>
													<label>希望日時</label>
												</th>
												<td>
													<input class="ime-off" id="hoge786" style="text-align: right;" type="text" value="____/__/__" />
													<script type="text/javascript">
														(function($){
															$.imDateUtil.setOffset(540);
															$(function () {
																$("#hoge786").imuiCalendar({
																	"disabled":"true",
																	"altField":"#hoge786",
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
												<td>
													<select style="width:100px;" disabled>
														<option value="0"></option>
														<option value="1" selected>指定なし</option>
														<option value="2" >8:00～12:00</option>
														<option value="3" >12:00～15:00</option>
														<option value="4" >15:00～18:00</option>
													</select>
												</td>
											</tr>
											<tr>
												<th>
													<label>本人連絡先</label>
												</th>
												<td colspan="2">
													<input class="ime-off" type="text" style="width:244px;" disabled/>
												</td>
											</tr>
											<tr>
												<th>
													<label>立会代理人</label>
												</th>
												<td>
													<input class="ime-off" type="text" style="100px;" disabled/>
												</td>
												<td>
													<input type="button" value="社員入力支援" class="imui-small-button" disabled/>
												</td>
											</tr>
											<tr>
												<th>
													<label>立会代理人連絡先</label>
												</th>
												<td colspan="2">
													<input class="ime-off" type="text" style="width:244px;" disabled/>
												</td>
											</tr>
											<tr>
												<th rowspan="3">
													<label style="width:100px;">代理人備考</label>
												</th>
												<td rowspan="3" colspan="3">
													<textarea style="width:450px;" rows="5"></textarea>
												</td>
											</tr>
											<tr></tr>
											<tr></tr>
											<tr>
												<th rowspan="3">
													<label>備考</label>
												</th>
												<td rowspan="3" colspan="3">
													<textarea style="width:450px;" rows="5"></textarea>
												</td>
											</tr>
											<tr></tr>
											<tr></tr>
											<tr><td style="height:40%;border:none;"></td></tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="officer_info">
					<table class="imui-form-search-condition">
						<tbody>
							<!--相互利用協定-->
							<tr >
								<th rowspan="9">
									<label style="width:115px">相互利用協定</label>
								</th>
								<th>
									<label style="width:198px">管理会社</label>
								</th>
								<td>
									<div style="width:200px;">
										NEXCO中日本
									</div>
								</td>
								<th rowspan="5">
									<label style="width:100px;">配属データ</label>
								</th>
								<th>
									<label style="width:125px;">配属会社名</label>
								</th>
								<td>
									<div style="width:312px;">
										<select style="width:185px">
											<option value="0"></option>
											<option value="1" selected>NEXCO中日本</option>
											<option value="2">NEXCO東日本</option>
											<option value="4">NEXCO西日本</option>
											<option value="5">高速道路総合研究所</option>
											<option value="6">外部機関</option>
										</select>
									</div>
								</td>
								<td style="width:40%;border:none;"></td>
							</tr>
							<!-- 出向の有無 -->
							<tr>
								<th>
									<label>出向の有無</label>
								</th>
								<td>
									<select style="width:60px">
										<option value="0"></option>
										<option value="1">なし</option>
										<option value="2" selected>あり</option>
									</select>
								</td>
								<th>
									<label>所属機関</label>
								</th>
								<td>
									<input type="text" style="width:306px;"/>
								</td>
							</tr>
							<!-- 貸与会社 -->
							<tr>
								<th>
									<label>貸与会社</label>
								</th>
								<td>
									<select style="width:185px">
										<option value="0"></option>
										<option value="1">NEXCO中日本</option>
										<option value="2">NEXCO東日本</option>
										<option value="4">NEXCO西日本</option>
										<option value="5" selected>高速道路総合研究所</option>
										<option value="6">外部機関</option>
									</select>
								</td>
								<th>
									<label>室・部名</label>
								</th>
								<td>
									<input type="text" style="width:306px;"/>
								</td>
							</tr>
							<!-- 借受会社 -->
							<tr>
								<th>
									<label>借受会社</label>
								</th>
								<td>
									<select style="width:185px">
										<option value="0"></option>
										<option value="1">NEXCO中日本</option>
										<option value="2">NEXCO東日本</option>
										<option value="4">NEXCO西日本</option>
										<option value="5" selected>高速道路総合研究所</option>
										<option value="6">外部機関</option>
									</select>
								</td>
								<th>
									<label>課等名</label>
								</th>
								<td>
									<input type="text" style="width:306px;"/>
								</td>
							</tr>
							<!-- 相互利用判定区分 -->
							<tr>
								<th>
									<label>相互利用判定区分</label>
								</th>
								<td>
									<select style="width:60px">
										<option value="0"></option>
										<option value="1" selected>なし</option>
										<option value="2">あり</option>
									</select>
								</td>
								<th>
									<label>配属データコード番号</label>
								</th>
								<td>
									<input type="text" style="width:306px;"/>
								</td>
							</tr>
							<!-- 社宅使用料会社間送金区分 -->
							<tr>
								<th>
									<label>社宅使用料会社間送金区分</label>
								</th>
								<td>
									<select style="width:60px">
										<option value="0"></option>
										<option value="1">なし</option>
										<option value="2" selected>あり</option>
									</select>
								</td>
							</tr>
							<!-- 共益費会社間送付区分 -->
							<tr>
								<th>
									<label>共益費会社間送付区分</label>
								</th>
								<td>
									<select style="width:60px">
										<option value="0"></option>
										<option value="1">なし</option>
										<option value="2" selected>あり</option>
									</select>
								</td>
							</tr>
							<!-- 開始日 -->
							<tr>
								<th>
									<label>開始日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge787" style="width:160px;text-align: right;" type="text" value="2018/12/01" />
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge787").imuiCalendar({
													"altField":"#hoge787",
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
							</tr>
							<!-- 終了日 -->
							<tr>
								<th>
									<label>終了日</label>
								</th>
								<td>
									<input class="ime-off" id="hoge788" style="width:160px;text-align: right;" type="text" value="____/__/__" />
									<script type="text/javascript">
										(function($){
											$.imDateUtil.setOffset(540);
											$(function () {
												$("#hoge788").imuiCalendar({
													"disabled":"true",
													"altField":"#hoge788",
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
							</tr>
							<!-- 社宅賃貸料 -->
							<tr>
								<th colspan="2">
									<label>社宅賃貸料</label>
								</th>
								<td>
									<input class="ime-off" type="text" style="width:100px;text-align: right;" value="0" />
									円
								</td>
							</tr>
							<!-- 駐車場料金 -->
							<tr>
								<th colspan="2">
									<label>駐車場料金</label>
								</th>
								<td>
									<input class="ime-off" type="text" style="width:100px;text-align: right;" value="0" />
									円
								</td>
							</tr>
							<!-- 共益費(事業者負担) -->
							<tr>
								<th colspan="2">
									<label>共益費(事業者負担)</label>
								</th>
								<td>
									<input class="ime-off" type="text" style="width:100px;text-align: right;" value="0" />
									円
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br />
			<div class="align-L float-L">	
				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()" tabindex="5" />
			</div>
			<div class="align-R">
				<input style="width:150px;" type="button" value="運用ガイド" class="imui-medium-button" />
				<input style="width:150px;" type="button" value="一時保存" class="imui-medium-button"/>
				<input style="width:150px;" type="button" value="作成完了" class="imui-medium-button"/>
			</div>
			<div class="align-R">
				<input style="width:150px;" type="button" value="次月予約" class="imui-medium-button" onclick="openWindow4()"/>
				<input style="width:150px;" type="button" value="入居情報の継続登録" class="imui-medium-button" disabled/>
				<input style="width:150px;" type="button" value="社宅管理台帳登録" class="imui-medium-button" disabled/>
			</div>
			<script>
				$(function() {
					$( "#tabs" ).tabs();
				});
			</script>
		</div>

	</div>
	<br><br><br>
<script type="text/javascript">
				(function($) {
					// 画面表示時に定義される処理
				    $(document).ready(function(){
				    	parkingShienCallback1 = function() {
				    		document.getElementById('park1blockNo').innerHTML = $("#hdnParkingShienParkBlock").val();
				    	}
				    	parkingShienCallback2 = function() {
				    		document.getElementById('park2blockNo').innerHTML = $("#hdnParkingShienParkBlock").val();
				    	}
				    });
					

					
				})(jQuery);
				</script>
	<script type="text/javascript">
function ImageUp() {
window.open("../pop/pop_ShatakuHeyaNyuryokuShien.html","window1","width=650px,height=600px","menubar=no,resizable=yes");
}

function openWindow(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=680px,title=no';
  var window1 = window.open("../pop/pop_ShatakuHeyaNyuryokuShien.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}
function openWindow2(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=680px,title=no';
  var window1 = window.open("../pop/pop_TyushajyoNyuryokuShien.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}
function openWindow3(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=750px,height=680px,title=no';
  var window1 = window.open("../pop/pop_ShiyoryokeisanShien.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}
function openWindow4(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=680px,title=no';
  var window1 = window.open("../pop/pop_JigenTouroku.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}


</script>
</nfwui:Form>
<!-- コンテンツエリア　ここまで -->