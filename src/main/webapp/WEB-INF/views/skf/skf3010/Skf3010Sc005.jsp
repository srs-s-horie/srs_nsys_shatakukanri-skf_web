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
<style type="text/css">

</style>
		<script type="text/javascript">
			function back1() {
	var url="skf/Skf3010Sc004/init?SKF3010_SC004&tokenCheck=0"
	nfw.common.doBack(url, "前の画面へ戻ります。よろしいですか？編集中の内容は無効になります。");
			}

			}
		</script>
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" style="width: 95%;">
			<nfwui:Table use="search">
				<tbody>
					<tr>
						<th style="width: 4%;height:24px">
<!-- 							<label style="width:80px;">社宅名</label> -->
							<nfwui:LabelBox id="lblShatakuName" code="<%=MessageIdConstant.SKF3010_SC004_SHATAKU_NAME %>" />					
						</th>
						<td style="width: 10%;">
							<label>${form.shatakuName}<label>
						</td>
						<th style="width: 5%;">
<!-- 									<label>地域区分</label> -->
							<nfwui:LabelBox id="lblAreaKbn" code="<%=MessageIdConstant.SKF3010_SC004_AREA_KBN %>" />
						</th>
						<td style="width: 4%;">
							<label>${form.areaKbn}<label>
						</td>
						<th style="width: 5%;">
<!-- 							<label>社宅区分</label> -->
							<nfwui:LabelBox id="lblShatakuKbn" code="<%=MessageIdConstant.SKF3010_SC004_SHATAKU_KBN %>" />
						</th>
						<td style="width: 4%;">
							<label>${form.shatakuKbn}<label>
						</td>
						<th style="width: 6%;">
<!-- 									<label>空き部屋数</label> -->
									<nfwui:LabelBox id="lblEmptyRoomCount" code="<%=MessageIdConstant.SKF3010_SC004_EMPTY_ROOM_COUNT %>" />
						</th>
						<td style="width: 4%;">
							<label>${form.emptyRoomCount}<label>
						</td>
						<th style="width: 7%;">
<!-- 									<label>空き駐車場数</label> -->
									<nfwui:LabelBox id="lblEmptyParkingCount" code="<%=MessageIdConstant.SKF3010_SC004_EMPTY_PARKING_COUNT %>" />
						</th>
						<td style="width: 4%;">
							<label>${form.emptyParkingCount}<label>
						</td>
					</tr>
				</tbody>
			</nfwui:Table>
			<div id="tabs">
				<ul>
					<li><a href="#room_info">部屋情報</a></li>
					<li><a href="#bihin_info">備品情報</a></li>
				</ul>
				<div id="room_info">
					<table class="imui-form-search-condition">
						<tbody>
							<!--部屋番号-->
							<tr>
								<th style="width:12%">
									<label style="width:135px">部屋番号</label>
								</th>
								<td style="width:21.3%;" >
									<input style="width:130px;" type="text" value="101" />
								</td>
								<th style="width:12%">
									<label>本来延面積</label>
								</th>
								<td style="width:21.3%;" >
									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="79.83">㎡</input>
								</td>
							</tr>
							<tr>
								<th>
									<label>本来規格</label>
								</th>
								<td>
									<select style="width:135px;">
										<option value="0"></option>
										<option value="1">1R</option>
										<option value="2">1K</option>
										<option value="3">1DK</option>
										<option value="4">1LDK</option>
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
										<option value="15">3LDKS</option>
										<option value="16">3LK</option>
										<option value="17">3SLDK</option>
										<option value="18">4LDK</option>
										<option value="19">その他</option>
									</select>
									<script type="text/javascript">
										(function($) {
											$('#id_roomInfoSelect_1').imuiSelect({});
										})(jQuery);
										width:45%;
									</script>
									<input style="width:130px;" type="text" value="１２畳" />
								</td>
								<th>
									<label style="width:135px;">貸与延面積</label>
								</th>
								<td>
									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="79.83">㎡</input>
								</td>
							</tr>
							<tr>
								<th>
									<label>本来用途</label>
								</th>
								<td>
									<select style="width:135px;">
										<option value="0"></option>
										<option value="1">世帯</option>
										<option value="2">単身</option>
										<option value="3">独身</option>
									</select>
									<script type="text/javascript">
										(function($) {
											$('#id_roomInfoSelect_2').imuiSelect({});
										})(jQuery);
										width:45%;
									</script>
									<input style="width:130px;" type="text" placeholder="例　本来用途" />
								</td>
								<th>
									<label>サンルーム面積</label>
								</th>
								<td>
									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="0.00">㎡</input>
								</td>
							</tr>
							<tr>
								<th>
									<label>貸与区分</label>
								</th>
								<td>
									<select style="width:135px;">
										<option value="0"></option>
										<option value="1">貸与可</option>
										<option value="2">貸与不可</option>
									</select>
									<script type="text/javascript">
										(function($) {
											$('#id_roomInfoSelect_3').imuiSelect({});
										})(jQuery);
										width:45%;
									</script>
									<input style="width:130px;" type="text" placeholder="例　貸与区分" />
								</td>
								<th>
									<label>寒冷地減免事由区分</label>
								</th>
								<td>
									<select style="width:155px;">
										<option value="0"></option>
										<option value="1">無し</option>
										<option value="2">サンルーム無し</option>
										<option value="3">暖房無し</option>
									</select>
								</td>
							</tr>
							<!--備考-->
							<tr>
								<th rowspan="3">
									<label>備考</label>
								</th>
								<td rowspan="3">
									<textarea style="width:270px;" rows="6"></textarea>
								</td>
								<th>
									<label>階段面積</label>
								</th>
								<td>
									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="0.00">㎡</input>
								</td>
							</tr>
							<tr>
								<th>
									<label>物置面積</label>
								</th>
								<td>
									<input class="ime-off" style="text-align: right;width:130px;" type="text" value="1.00">㎡</input>
								</td>
							</tr>
							<tr>
								<th>
									<label>物置調整面積</label>
								</th>
								<td style="height:24px">
									<label>0.00㎡</label>
								</td>
								<td style="width:33.4%;border:none;"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="bihin_info">
					<table class="imui-form-search-condition">
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
//											"pager":"#bihinListTable1-pager",
										"colNames":[
											"備品名称",
											"備付状況",
										],
										"datatype":"local",
										"errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
//										"rowNum":13,
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
											"sonaetsuke_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5' selected>共有</option></select>"
										},{
											"bihin_name":"冷蔵庫",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5' selected>共有</option></select>"
										},{
											"bihin_name":"オーブンレンジ",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"掃除機",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"電子炊飯ジャー",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"テレビ",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"テレビ台",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"座卓(こたつ)",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"キッチンキャビネット",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"ルームエアコン",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"カーテン",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"照明器具",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1' selected>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4'>備付</option><option value='5'>共有</option></select>"
										},{
											"bihin_name":"ガステーブル",
											"sonaetsuke_status":"<select style='width:95%;'><option value='1'>なし</option><option value='2'>会社保有</option><option value='3'>レンタル</option><option value='4' selected>備付</option><option value='5'>共有</option></select>"
										}
									];

									grid.jqGrid(parameter);


// as
//											// 1行づつ網掛け挑戦
//											jQuery('#bihinListTable1').jqGrid({
//												loadComplete: function () {
//													var rowIDs = jQuery('#bihinListTable1').getDataIDs(); 
//													$.each(rowIDs, function (i, item) {
//														if (i % 2 == 0) {
//															$('#'+item).removeClass('ui-widget-content');
//															$('#'+item).addClass('testcss');
//														}
//													});
//												},
//											});
//											jQuery('#bihinListTable1').jqGrid({
//												gridComplete: function () {
//													$('tbody > tr:even', this).addClass('ui-row-even');
//												}
//											});
// ae

									grid.jqGrid('navGrid','#bihinListTable1-pager',{
										edit: false,
										add: false,
										del: false,
										search: false,
									});

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
			</div>
			<br />
			<div class="align-L float-L">	
				<imui:button id="returnBtn" value="前の画面へ" class="imui-medium-button" style="width: 150px" onclick="back1()"  />
			</div>
			<div class="align-R">
				<input style="width:150px;" type="button" value="登録" class="imui-medium-button" />
				<input style="width:150px;" type="button" value="削除" class="imui-medium-button" disabled/>
			</div>
		</div>
		<script>
			$(function() {
				$( "#tabs" ).tabs();
			});
		</script>
	</div>
	<!-- コンテンツエリア　ここまで -->