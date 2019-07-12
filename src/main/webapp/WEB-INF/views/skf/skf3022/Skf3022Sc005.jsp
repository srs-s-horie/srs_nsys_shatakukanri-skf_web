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
					<li>
						<a class="imui-toolbar-icon" title="最新情報"  tabindex="26">
							<span class="im-ui-icon-common-16-refresh" onclick="refresh()"></span>
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

<!-- 		<div class="alertDiv imui-box-warning" style="padding: 15px;margin-top: 10px;text-align:left;" id="errMainDiv"> -->
<!-- 			<div class="alert-errorIcon alert" style="margin:0;padding:0;margin-right:10px;"> -->
<!-- 			</div>  -->
<!-- 		</div> -->

		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 100%; min-width:1300px;max-width: 1350px;">
			<div class="imui-form-container-wide"  style="width:1280px;">
				<div class="imui-chapter-title"><h2>検索条件</h2></div>
				<table class="imui-form-search-condition">
					<tbody>
						<tr>
							<th>
								<label style="width:80px;">社員番号</label>
							</th>
							<td>
								<input class="ime-off" style="width:200px;" type="text" placeholder="例　00123456（半角）"/>
							</td>
							<th colspan="2">
								<label style="width:80px;">入退居区分</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">入居</option>
									<option value="2">退居</option>
									<option value="3">変更</option>
								</select>
							</td>
							<th rowspan="2">
								<label style="width:80px;">備品提示</label>
							</th>
							<th>
								<label style="width:80px;">状況</label>
							</th>
							<td style="width:40%;">
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">未申請</option>
									<option value="2">作成中</option>
									<option value="3">作成済</option>
									<option value="4">提示中</option>
									<option value="5">同意済</option>
									<option value="6">搬入待ち</option>
									<option value="7">搬入済</option>
									<option value="8">搬出待ち</option>
									<option value="9">搬出済</option>
									<option value="10">承認</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<label>社員氏名</label>
							</th>
							<td>
								<input style="width:200px;" type="text" placeholder="例　中日本　太郎"/>
							</td>
							<th rowspan="2">
								<label style="width:80px;">社宅提示</label>
							</th>
							<th>
								<label style="width:80px;">状況</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">作成中</option>
									<option value="2">作成済</option>
									<option value="3">提示中</option>
									<option value="4">同意済</option>
									<option value="5">承認</option>
								</select>
							</td>
							<th>
								<label>確認督促</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">未送付</option>
									<option value="2">送付済</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<label>社宅名</label>
							</th>
							<td>
								<input style="width:200px;" type="text" placeholder="例　社宅名"/>
							</td>
							<th>
								<label>確認督促</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">未送付</option>
									<option value="2">送付済</option>
								</select>
							</td>
							<th colspan="2">
								<label>備品搬入搬出督促</label>
							</th>
							<td>
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">未送付</option>
									<option value="2">送付済</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="align-L">	
					<input type="button" value="検索" class="imui-small-button" >
				</div>
			</div>
			<!-- 明細＆細目未満 -->
			<div class="imui-form-container-wide"  style="width:1280px;">
				<!-- 明細部 -->
				<form id="sampleList1">
					<div class="imui-chapter-title" ><h2>検索結果一覧</h2></div>
					<script type="text/javascript">
					  (function($){
					    $.imui.util.loadCSS("ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
					  })(jQuery);
					</script>

					<table name="imui-8eqlrzst4hv6std" id="sampleListTable1"></table>

					<div id="sampleListTable1-pager"></div>

					<script type="text/javascript">
						(function() {
							function imuiListTable() {
								var grid = jQuery('#sampleListTable1');
								var parameter = {
									"multiselect":false,
									"pager":"#sampleListTable1-pager",
									"colNames":[
										"",
										"督促<br /><INPUT type='checkbox'>",
										"入退居<br/>区分",
										"社員番号",
										"社員氏名",
										"申請<br />区分",
										"入居<br />予定日",
										"退居<br />予定日",
										"社宅名",
										"部屋番号",
										"用途",
										"社宅提示<br />状況",
										"社宅提示<br />確認督促",
										"備品提示<br />状況",
										"備品提示<br />確認督促",
										"搬入<br />搬出<br />督促",
										"詳細",
										"削除",
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
									"rowNum":1000,
									"width":"1280",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"select_flg","width":"35","align":"center"}<!-- 選択 -->
										,{"name":"nyutaikyo_kbn","width":"50","align":"center"}<!-- 入退居区分 -->
										,{"name":"syain_no","width":"70","align":"left"}<!-- 社員番号 -->
										,{"name":"shain_name","width":"108","align":"left"}<!-- 社員氏名 -->
										,{"name":"shinsei_kbn","width":"40","align":"center"}<!-- 申請区分 -->
										,{"name":"nyukyo_yotei_date","width":"65","align":"center"}<!-- 入居予定日 -->
										,{"name":"taikyo_yotei_date","width":"65","align":"center"}<!-- 退居予定日 -->
										,{"name":"shataku_name","width":"210","align":"left"}<!-- 社宅名 -->
										,{"name":"room_no","width":"60","align":"left"}<!-- 部屋番号 -->
										,{"name":"youto","width":"35","align":"center"}<!-- 用途-->
										,{"name":"shataku_status","width":"60","align":"center"}<!-- 社宅提示：状況 -->
										,{"name":"shataku_tokusoku","width":"60","align":"center"}<!-- 社宅提示：確認督促 -->
										,{"name":"bihin_status","width":"60","align":"center"}<!-- 備品：状況-->
										,{"name":"bihin_tokusoku","width":"60","align":"center"}<!-- 備品：確認督促 -->
										,{"name":"hannyu_hansyutu_tokusoku","width":"40","align":"center"}<!-- 搬入・搬出・督促 -->
										,{"name":"detail","width":"80","align":"center"}<!-- 詳細 -->
										,{"name":"delete","width":"80","align":"center"}<!-- 削除 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00002241",
										"shain_name":"中日本 2241",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2016/06/22",
										"taikyo_yotei_date":"2018/06/29",
										"shataku_name":"ｶｽﾀﾘｱ伏見",
										"room_no":"1005",
										"youto":"単身",
										"shataku_status":"<font style='color:green'>作成済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>提示中",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":2,
										"select_flg":"<input type='checkbox'></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00015154",
										"shain_name":"中日本 5154",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2015/03/26",
										"taikyo_yotei_date":"2018/07/18",
										"shataku_name":"稲沢Ｂ棟",
										"room_no":"608",
										"youto":"世帯",
										"shataku_status":"<font style='color:blue'>承認",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>搬出待ち",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":3,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00016164",
										"shain_name":"中日本 6164",
										"shinsei_kbn":"―",
										"nyukyo_yotei_date":"2017/06/25",
										"taikyo_yotei_date":"2018/09/20",
										"shataku_name":"ﾘｯﾂｨ本山",
										"room_no":"121",
										"youto":"",
										"shataku_status":"<font style='color:green'>作成中",
										"shataku_tokusoku":"―",
										"bihin_status":"<font style='color:green'>―",
										"bihin_tokusoku":"―",
										"hannyu_hansyutu_tokusoku":"―",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									},{
										"id":4,
										"select_flg":"<input type='checkbox' checked disabled></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00903906",
										"shain_name":"中日本 3906",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2018/10/10",
										"taikyo_yotei_date":"",
										"shataku_name":"稲沢A棟",
										"room_no":"504",
										"youto":"世帯",
										"shataku_status":"<font style='color:green'>同意済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>作成中",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":5,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00016500",
										"shain_name":"中日本 6500",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2016/07/30",
										"taikyo_yotei_date":"2018/07/20",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"103",
										"youto":"単身",
										"shataku_status":"<font style='color:blue'>承認",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>搬出待ち",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":6,
										"select_flg":"<input type='checkbox'></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2018/08/28",
										"taikyo_yotei_date":"",
										"shataku_name":"新石川寮",
										"room_no":"603",
										"youto":"単身",
										"shataku_status":"<font style='color:green'>同意済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:red'>未申請",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":7,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2016/07/01",
										"taikyo_yotei_date":"2018/08/28",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"203",
										"youto":"単身",
										"shataku_status":"<font style='color:green'>作成済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>作成中",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":8,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00043667",
										"shain_name":"中日本 3667",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2016/04/16",
										"taikyo_yotei_date":"2018/09/01",
										"shataku_name":"ﾄﾞﾘｰﾑｸﾞﾗﾝﾃﾞ",
										"room_no":"202",
										"youto":"独身",
										"shataku_status":"<font style='color:green'>作成済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>作成中",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":9,
										"select_flg":"<input type='checkbox'></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00048623",
										"shain_name":"中日本 8623",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2018/07/20",
										"taikyo_yotei_date":"",
										"shataku_name":"ﾗ･ﾌｫｰﾚNA独身寮",
										"room_no":"204",
										"youto":"独身",
										"shataku_status":"<font style='color:green'>同意済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:red'>未申請",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":10,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00048623",
										"shain_name":"中日本 8623",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2017/07/01",
										"taikyo_yotei_date":"2018/07/19",
										"shataku_name":"ｺﾞｰﾙﾄﾞｸﾞﾗﾝﾊﾟｽ",
										"room_no":"305",
										"youto":"独身",
										"shataku_status":"<font style='color:green'>作成済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>作成済",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":11,
										"select_flg":"<input type='checkbox'></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00073695",
										"shain_name":"中日本 3695",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2018/10/12",
										"taikyo_yotei_date":"",
										"shataku_name":"ﾏﾝｼｮﾝarroz",
										"room_no":"308",
										"youto":"単身",
										"shataku_status":"<font style='color:blue'>承認",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:red'>未申請",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":12,
										"select_flg":"<input type='checkbox'></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00075065",
										"shain_name":"中日本 5065",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2017/02/02",
										"taikyo_yotei_date":"2018/07/27",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"902",
										"youto":"独身",
										"shataku_status":"<font style='color:blue'>承認",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>搬出待ち",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":13,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00156734",
										"shain_name":"中日本 6734",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2018/07/24",
										"taikyo_yotei_date":"",
										"shataku_name":"名岐寮",
										"room_no":"201",
										"youto":"単身",
										"shataku_status":"<font style='color:green'>同意済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>作成中",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":14,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00156734",
										"shain_name":"中日本 6734",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2017/06/25",
										"taikyo_yotei_date":"2018/07/24",
										"shataku_name":"ｸﾞﾗﾝ･ｱﾍﾞﾆｭｰ栄",
										"room_no":"424",
										"youto":"単身",
										"shataku_status":"<font style='color:green'>作成済",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>作成中",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":15,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"入居",
										"syain_no":"00164147",
										"shain_name":"中日本 4147",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2018/07/27",
										"taikyo_yotei_date":"",
										"shataku_name":"ｱｽﾘｭｸｽ宮前平",
										"room_no":"205",
										"youto":"独身",
										"shataku_status":"<font style='color:blue'>承認",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>作成済",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":16,
										"select_flg":"<input type='checkbox'></input>",
										"nyutaikyo_kbn":"退居",
										"syain_no":"00246846",
										"shain_name":"中日本 6846",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2016/08/01",
										"taikyo_yotei_date":"2018/07/20",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"302",
										"youto":"単身",
										"shataku_status":"<font style='color:blue'>承認",
										"shataku_tokusoku":"",
										"bihin_status":"<font style='color:green'>提示中",
										"bihin_tokusoku":"",
										"hannyu_hansyutu_tokusoku":"",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":17,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"youto":"世帯",
										"shataku_status":"<font style='color:green'>作成中",
										"shataku_tokusoku":"",
										"bihin_status":"",
										"bihin_tokusoku":"―",
										"hannyu_hansyutu_tokusoku":"―",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									},{
										"id":18,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"youto":"世帯",
										"shataku_status":"<font style='color:green'>作成中",
										"shataku_tokusoku":"",
										"bihin_status":"",
										"bihin_tokusoku":"―",
										"hannyu_hansyutu_tokusoku":"―",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									},{
										"id":19,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"youto":"世帯",
										"shataku_status":"<font style='color:green'>作成中",
										"shataku_tokusoku":"",
										"bihin_status":"",
										"bihin_tokusoku":"―",
										"hannyu_hansyutu_tokusoku":"―",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									},{
										"id":20,
										"select_flg":"<input type='checkbox' disabled></input>",
										"nyutaikyo_kbn":"変更",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shinsei_kbn":"社宅",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"youto":"世帯",
										"shataku_status":"<font style='color:green'>作成中",
										"shataku_tokusoku":"",
										"bihin_status":"",
										"bihin_tokusoku":"―",
										"hannyu_hansyutu_tokusoku":"―",
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3022_Sc006/init'\"></input>",
										"delete":"<input type='button' value='削除' class='imui-small-button'></input>"
									}
								];

								grid.jqGrid(parameter);

//								// ヘッダ結合
//								grid.jqGrid('setGroupHeaders', {
//									useColSpanStyle: true,
//									groupHeaders:[
//										{startColumnName: 'shataku_status', numberOfColumns: 2,  titleText: '社宅提示'},
//										{startColumnName: 'bihin_status', numberOfColumns: 2,  titleText: '備品提示'},
//									]
//								});

// as
//									// 1行づつ網掛け挑戦
//									jQuery('#sampleListTable1').jqGrid({
//										loadComplete: function () {
//											var rowIDs = jQuery('#sampleListTable1').getDataIDs(); 
//											$.each(rowIDs, function (i, item) {
//												if (i % 2 == 0) {
//													$('#'+item).removeClass('ui-widget-content');
//													$('#'+item).addClass('testcss');
//												}
//											});
//										},
//									});
//									jQuery('#sampleListTable1').jqGrid({
//										gridComplete: function () {
//											$('tbody > tr:even', this).addClass('ui-row-even');
//										}
//									});
// ae

								grid.jqGrid('navGrid','#sampleListTable1-pager',{
									edit: false,
									add: false,
									del: false,
									search: false,
								});

								var gboxGridId     = 'gbox_sampleListTable1';
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
							#sampleListTable1 tr td{
								white-space:normal;
							}
						-->
					</style>
				</form>
			</div>
			<br />
			<div class="align-R">
				<input style="width:200px;" type="button" value="社宅提示データ本人確認督促" class="imui-medium-button" onclick="" disabled/>
				<input style="width:200px;" type="button" value="備品提示データ本人確認督促" class="imui-medium-button" onclick="" disabled/>
				<input style="width:150px;" type="button" value="備品搬入・搬出督促" class="imui-medium-button" onclick="" disabled/>
			</div>
		</div>
	</div>
<!-- コンテンツエリア　ここまで -->