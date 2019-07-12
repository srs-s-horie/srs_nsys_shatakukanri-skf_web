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
								<label style="width:60px;">年</label>
							</th>
							<td>
								<select style="width:80px;">
									<option value="0">2018</option>
									<option value="1">2019</option>
									<option value="2">2020</option>
									<option value="3">2021</option>
									<option value="4">2022</option>
									<option value="5">2023</option>
									<option value="6">2024</option>
									<option value="7">2025</option>
									<option value="8">2026</option>
									<option value="9">2027</option>
									<option value="10">2028</option>
									<option value="11">2029</option>
									<option value="12">2030</option>
								</select>
							</td>
							<th>
								<label style="width:60px;">月</label>
							</th>
							<td>
								<select style="width:50px;">
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12" selected>12</option>
								</select>
							</td>
							<th>
								<label style="width:60px;">締め処理</label>
							</th>
							<td style="width:1px;">
								<div style="width:60px;">未実行</div>
							</td>
							<th style="width:60px;">
								<label style="width:60px;">HR連携</label>
							</th>
							<td colspan="5" style="width:1%;">
								<div style="width:60px;">未実行</div>
							</td>
						</tr>
						<tr>
							<th>
								<label>管理会社</label>
							</th>
							<td colspan="3">
								<select style="width:220px">
									<option value="0"></option>
									<option value="1">NEXCO中日本</option>
									<option value="2">NEXCO東日本</option>
									<option value="4">NEXCO西日本</option>
									<option value="5">高速道路総合研究所</option>
									<option value="6">外部機関</option>
								</select>
							</td>
							<th>
								<label>社員番号</label>
							</th>
							<td colspan="3">
								<input class="ime-off" style="width:200px;" type="text" placeholder="例 00123456（半角）"/>
							</td>
							<th>
								<label style="width:60px;">社宅名</label>
							</th>
							<td>
								<input type="text" style="width:200px" placeholder="例 社宅名"/>
							</td>
							<th>
								<label style="width:60px;">相互利用</label>
							</th>
							<td style="width:30%;">
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">なし</option>
									<option value="2">あり</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<label>管理機関</label>
							</th>
							<td colspan="3">
								<select style="width:220px">
									<option value="0"></option>
									<option value="1"></option>
									<option value="2"></option>
									<option value="4"></option>
									<option value="5"></option>
									<option value="6"></option>
								</select>
							</td>
							<th>
								<label>社員名</label>
							</th>
							<td colspan="3">
								<input style="width:200px;" type="text" placeholder="例 中日本　太郎"/>
							</td>
							<th>
								<label style="width:60px;">社宅区分</label>
							</th>
							<td colspan="3">
								<select style="width:120px;">
									<option value="0"></option>
									<option value="1">保有</option>
									<option value="2">借上</option>
									<option value="3">区分所有</option>
									<option value="3">一括借上</option>
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
//									"pager":"#sampleListTable1-pager",
									"colNames":[
										"",
										"",
										"管理会社",
										"管理機関",
										"社宅区分",
										"社宅名",
										"部屋番号",
										"社員番号",
										"社員氏名",
										"社宅提示",
										"備品提示",
										"社宅使用料",
										"共益費",
										"駐車場料金",
										"入居日",
										"退居日",
										"管理事業領域",
										"相互利用",
									],
									"datatype":"local",
									"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
//									"rowNum":10,
									"width":"1280",
									"shrinkToFit":"true",
									"cellsubmit":"clientArray",
									"loadonce":true,
									"colModel":[
										{"hidden":true,"name":"id","key":true}
										,{"name":"detail","width":"70","align":"center"}<!-- 詳細 -->
										,{"name":"admin_company","width":"120","align":"left"}<!-- 管理会社 -->
										,{"name":"admin_organ","width":"120","align":"left"}<!-- 管理会社 -->
										,{"name":"shataku_kbn","width":"60","align":"center"}<!-- 社宅区分 -->
										,{"name":"shataku_name","width":"210","align":"left"}<!-- 社宅名 -->
										,{"name":"room_no","width":"60","align":"left"}<!-- 部屋番号 -->
										,{"name":"syain_no","width":"75","align":"left"}<!-- 社員番号 -->
										,{"name":"shain_name","width":"105","align":"left"}<!-- 社員氏名 -->
										,{"name":"shataku_teiji","width":"60","align":"center"}<!-- 社宅提示 -->
										,{"name":"bihin_teiji","width":"60","align":"center"}<!-- 備品提示 -->
										,{"name":"shataku_fee","width":"70","align":"right"}<!-- 社宅使用料 -->
										,{"name":"comm_fee","width":"70","align":"right"}<!-- 共益費-->
										,{"name":"parking_fee","width":"70","align":"right"}<!-- 駐車場料金 -->
										,{"name":"nyukyo_yotei_date","width":"65","align":"center"}<!-- 入居日 -->
										,{"name":"taikyo_yotei_date","width":"65","align":"center"}<!-- 退居日 -->
										,{"name":"admin_business_region","width":"160","align":"left"}<!-- 管理事業領域 -->
										,{"name":"mutual_use","width":"60","align":"center"}<!-- 相互利用 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ｶｽﾀﾘｱ伏見",
										"room_no":"1005",
										"syain_no":"00002241",
										"shain_name":"中日本 2241",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2016/06/22",
										"taikyo_yotei_date":"2018/06/29",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":2,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"稲沢Ｂ棟",
										"room_no":"608",
										"syain_no":"00015154＊",
										"shain_name":"中日本 5154",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"0円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2015/03/26",
										"taikyo_yotei_date":"2018/07/18",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":3,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ﾘｯﾂｨ本山",
										"room_no":"121",
										"syain_no":"00016164",
										"shain_name":"中日本 6164",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"6,261円",
										"comm_fee":"2,280円",
										"parking_fee":"2,218円",
										"nyukyo_yotei_date":"2017/06/25",
										"taikyo_yotei_date":"2018/09/20",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":4,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"稲沢A棟",
										"room_no":"504",
										"syain_no":"00903906",
										"shain_name":"中日本 3906",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"2,981円",
										"comm_fee":"2,280円",
										"parking_fee":"1,056円",
										"nyukyo_yotei_date":"2018/10/10",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":5,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"103",
										"syain_no":"00016500",
										"shain_name":"中日本 6500",
										"shataku_teiji":"―",
										"bihin_teiji":"―",
										"shataku_fee":"25,270円",
										"comm_fee":"1,860円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2016/07/30",
										"taikyo_yotei_date":"2018/07/20",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":6,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"新石川寮",
										"room_no":"603",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"22,462円",
										"comm_fee":"0円",
										"parking_fee":"3,156円",
										"nyukyo_yotei_date":"2018/08/28",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":7,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"203",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"748円",
										"comm_fee":"0円",
										"parking_fee":"105円",
										"nyukyo_yotei_date":"2016/07/01",
										"taikyo_yotei_date":"2018/08/28",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":8,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ﾄﾞﾘｰﾑｸﾞﾗﾝﾃﾞ",
										"room_no":"202",
										"syain_no":"00043667",
										"shain_name":"中日本 3667",
										"shataku_teiji":"―",
										"bihin_teiji":"―",
										"shataku_fee":"32,800円",
										"comm_fee":"3,220円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2016/04/16",
										"taikyo_yotei_date":"2018/09/01",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":9,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ﾗ･ﾌｫｰﾚNA独身寮",
										"room_no":"204",
										"syain_no":"00048623",
										"shain_name":"中日本 8623",
										"shataku_teiji":"―",
										"bihin_teiji":"―",
										"shataku_fee":"7,699円",
										"comm_fee":"3,220円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2018/07/20",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":10,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ｺﾞｰﾙﾄﾞｸﾞﾗﾝﾊﾟｽ",
										"room_no":"305",
										"syain_no":"00048623",
										"shain_name":"中日本 8623",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,581円",
										"comm_fee":"2,660円",
										"parking_fee":"3,275円",
										"nyukyo_yotei_date":"2017/07/01",
										"taikyo_yotei_date":"2018/07/19",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":11,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ﾏﾝｼｮﾝarroz",
										"room_no":"308",
										"syain_no":"00073695",
										"shain_name":"中日本 3695",
										"shataku_teiji":"―",
										"bihin_teiji":"―",
										"shataku_fee":"0円",
										"comm_fee":"0円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":12,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"902",
										"syain_no":"00075065",
										"shain_name":"中日本 5065",
										"shataku_teiji":"―",
										"bihin_teiji":"―",
										"shataku_fee":"45,600円",
										"comm_fee":"4,600円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2017/02/02",
										"taikyo_yotei_date":"2018/07/27",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":13,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"名岐寮",
										"room_no":"201",
										"syain_no":"00156734",
										"shain_name":"中日本 6734",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2018/07/24",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":14,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ｸﾞﾗﾝ･ｱﾍﾞﾆｭｰ栄",
										"room_no":"424",
										"syain_no":"00156734",
										"shain_name":"中日本 6734",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2017/06/25",
										"taikyo_yotei_date":"2018/07/24",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":15,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"ｱｽﾘｭｸｽ宮前平",
										"room_no":"205",
										"syain_no":"00164147",
										"shain_name":"中日本 4147",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2018/07/27",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":16,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"浅間寮(ｴﾊﾞｰｸﾞﾘｰﾝ)",
										"room_no":"302",
										"syain_no":"00246846",
										"shain_name":"中日本 6846",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2016/08/01",
										"taikyo_yotei_date":"2018/07/20",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":17,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":18,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":19,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 人事部",
										"mutual_use":"なし"
									},{
										"id":20,
										"detail":"<input type='button' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3030_Sc002/init'\"></input>",
										"admin_company":"NEXCO中日本",
										"admin_organ":"本社",
										"shataku_kbn":"借上",
										"shataku_name":"高蔵寺1",
										"room_no":"310",
										"syain_no":"00043234",
										"shain_name":"中日本 3234",
										"shataku_teiji":"<font style='color:blue'>承認",
										"bihin_teiji":"<font style='color:blue'>承認",
										"shataku_fee":"29,372円",
										"comm_fee":"4,120円",
										"parking_fee":"0円",
										"nyukyo_yotei_date":"2009/03/07",
										"taikyo_yotei_date":"",
										"admin_business_region":"本社 サービスエリア事業部",
										"mutual_use":"なし"
									}
								];

								grid.jqGrid(parameter);

								// ヘッダ結合
								grid.jqGrid('setGroupHeaders', {
									useColSpanStyle: true,
									groupHeaders:[
										{startColumnName: 'shataku_status', numberOfColumns: 2,  titleText: '社宅提示'},
										{startColumnName: 'bihin_status', numberOfColumns: 2,  titleText: '備品提示'},
									]
								});

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
				<input style="width:200px;" type="button" value="前月比較確認リスト出力" class="imui-medium-button" onclick="" />
				<input style="width:200px;" type="button" value="社宅管理台帳リスト出力" class="imui-medium-button" onclick="" />
			</div>
		</div>
	</div>
<!-- コンテンツエリア　ここまで -->