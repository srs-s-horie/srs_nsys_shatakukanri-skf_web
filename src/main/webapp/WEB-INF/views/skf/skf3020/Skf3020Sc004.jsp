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
								<label style="width:60px;">社員番号</label>
							</th>
							<td>
								<input class="ime-off" style="width:175px;" type="text" placeholder="例　00123456（半角）"/>
							</td>
							<th>
								<label style="width:80px;">入居・退居</label>
							</th>
							<td>
								<input id="id_check_nyukyo" type="checkbox" >
									<label for="id_check_nyukyo">入居</label>
								</input>
								&nbsp;
								<input id="id_check_taikyo" type="checkbox" >
									<label for="id_check_taikyo">退居</label>
								</input>
								&nbsp;
								<input id="id_check_change" type="checkbox" >
									<label for="id_check_change">変更</label>
								</input>
							</td>
							<th>
								<label style="width:60px;">新所属</label>
							</th>
							<td>
								<input style="width:175px;" type="text" placeholder="例 名古屋支社" />
							</td>
							<th>
								<label style="width:110px;">入退居予定作成区分</label>
							</th>
							<td>
								<select style="width:80px;">
									<option value="0"></option>
									<option value="1">未作成</option>
									<option value="2">作成済</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<label>社員氏名</label>
							</th>
							<td>
								<input style="width:175px;" type="text" placeholder="例　中日本　太郎"/>
							</td>
							<th>
								<label>現社宅</label>
							</th>
							<td>
								<select style="width:150px;">
									<option value="0"></option>
									<option value="1">未入居</option>
									<option value="2">入居中</option>
								</select>
							</td>
							<th>
								<label>現所属</label>
							</th>
							<td>
								<input style="width:175px;" type="text" placeholder="例 名古屋支社" />
							</td>
							<th>
								<label>備考</label>
							</th>
							<td colspan="2">
								<input style="width:310px;" type="text" />
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
										"入居",
										"退居",
										"変更",
										"社員番号",
										"社員氏名",
										"等級",
										"年齢",
										"新所属",
										"現所属",
										"備考",
										"取込日",
										"入退居予定<br />作成区分",
										"現社宅",
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
										,{"name":"nyukyo_flg","width":"35","align":"center"}<!-- 入居 -->
										,{"name":"taikyo_flg","width":"35","align":"center"}<!-- 退居 -->
										,{"name":"henkou_flg","width":"35","align":"center"}<!-- 変更 -->
										,{"name":"shain_no","width":"75","align":"left"}<!-- 社員番号 -->
										,{"name":"shain_name","width":"120","align":"left"}<!-- 社員氏名 -->
										,{"name":"grade","width":"35","align":"left"}<!-- 等級 -->
										,{"name":"age","width":"35","align":"right"}<!-- 年齢 -->
										,{"name":"new_affiliation","width":"185","align":"left"}<!-- 新所属 -->
										,{"name":"now_affiliation","width":"185","align":"left"}<!-- 現所属 -->
										,{"name":"note","width":"93","align":"left"}<!-- 備考 -->
										,{"name":"torikomi_date","width":"70","align":"center"}<!-- 取込日 -->
										,{"name":"nyutaikyo_yotei_kbn","width":"70","align":"center"}<!-- 入退居予定作成区分 -->
										,{"name":"now_shataku","width":"75","align":"center"}<!-- 現社宅-->
										,{"name":"detail","width":"70","align":"center"}<!-- 詳細 -->
										,{"name":"del_btn","width":"70","align":"center"}<!-- 削除 -->
									],
									"rownumbers":false,
									"height":"400"
								};
								parameter.data = [
									{
										"id":1,
										"nyukyo_flg":"<input type='checkbox' checked disabled></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000001",
										"shain_name":"中日本　2148",
										"grade":"役員",
										"age":"45",
										"new_affiliation":"東京支社 保全・サービス事業部 交通技術チーム（支社リーダー待遇）中日本ハイウェイ・エンジニアリング東京㈱ 土木技術部 交通技術課 課長（出向）",
										"now_affiliation":"東京支社 保全・サービス事業部 交通技術チーム サブリーダー",
										"note":"出向（2015.12.1～2017.11.30）",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:blue'>作成済",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":2,
										"nyukyo_flg":"<input type='checkbox' checked disabled></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000002＊",
										"shain_name":"中日本　6193",
										"grade":"L2",
										"age":"40",
										"new_affiliation":"名古屋支社 保全・サービス事業部 更新チーム サブリーダー",
										"now_affiliation":"本社 総務本部 総務部 法務チーム",
										"note":"転任",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:blue'>作成済",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":3,
										"nyukyo_flg":"<input type='checkbox' checked disabled></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000003",
										"shain_name":"中日本　6255",
										"grade":"T2",
										"age":"38",
										"new_affiliation":"金沢支社 富山保全・サービスセンター（総務企画担当）",
										"now_affiliation":"金沢支社 富山保全・サービスセンター 中日本ハイウェイ・メンテナンス北陸㈱ 富山道路事務所 工務課 主任（出向）",
										"note":"復職",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:blue'>作成済",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":4,
										"nyukyo_flg":"<input type='checkbox' ></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000004＊",
										"shain_name":"高速　ハナコ",
										"grade":"L2",
										"age":"41",
										"new_affiliation":"本社 関連事業本部 サービスエリア事業部 規格統括チーム（在東京）スリーエムジャパン㈱国土強靭化プロジェクト本部（出向）",
										"now_affiliation":"本社 関連事業本部 サービスエリア事業部 規格統括チーム（在東京）スリーエムジャパン㈱国土強靭化プロジェクト本部（出向）",
										"note":"出向期間延長（2015.12.1～2016.11.30）",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:red'>未作成",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' ></input>"
									},{
										"id":5,
										"nyukyo_flg":"<input type='checkbox'></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000005",
										"shain_name":"中日本　1195",
										"grade":"R4",
										"age":"61",
										"new_affiliation":"名古屋支社 環境・技術管理部 技術管理チーム",
										"now_affiliation":"名古屋支社 環境・技術管理部 技術管理チーム",
										"note":"再雇用期間更新 短時間勤務",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:red'>未作成",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' ></input>"
									},{
										"id":6,
										"nyukyo_flg":"<input type='checkbox' ></input>",
										"taikyo_flg":"<input type='checkbox' checked disabled></input>",
										"henkou_flg":"<input type='checkbox' ></input>",
										"shain_no":"00000006",
										"shain_name":"高速　次郎",
										"grade":"L2",
										"age":"38",
										"new_affiliation":"本社 技術・建設本部 技術管理部 技術管理チーム",
										"now_affiliation":"名古屋支社 建設事業部 計画設計チーム",
										"note":"転任",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:blue'>作成済",
										"now_shataku":"<input type='button' style='text-align:center' value='現社宅' class='imui-small-button' onclick='openWindow()' ></input>",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' style='visibility:hidden'></input>"
									},{
										"id":7,
										"nyukyo_flg":"<input type='checkbox' checked disabled></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000007",
										"shain_name":"高速　タロウ",
										"grade":"T2",
										"age":"32",
										"new_affiliation":"名古屋支社 建設事業部 計画設計チーム",
										"now_affiliation":"名古屋支社四日市工事事務所 菰野四日市工事区",
										"note":"配置換",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:red'>未作成",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' ></input>"
									},{
										"id":8,
										"nyukyo_flg":"<input type='checkbox' checked disabled></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000008",
										"shain_name":"高速0008",
										"grade":"T2",
										"age":"32",
										"new_affiliation":"名古屋支社 建設事業部 計画設計チーム",
										"now_affiliation":"名古屋支社四日市工事事務所 菰野四日市工事区",
										"note":"配置換",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:red'>未作成",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' ></input>"
									},{
										"id":9,
										"nyukyo_flg":"<input type='checkbox' checked disabled></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000009",
										"shain_name":"高速0009",
										"grade":"T2",
										"age":"32",
										"new_affiliation":"名古屋支社 建設事業部 計画設計チーム",
										"now_affiliation":"名古屋支社四日市工事事務所 菰野四日市工事区",
										"note":"配置換",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:red'>未作成",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' ></input>"
									},{
										"id":10,
										"nyukyo_flg":"<input type='checkbox' checked disabled></input>",
										"taikyo_flg":"<input type='checkbox' disabled></input>",
										"henkou_flg":"<input type='checkbox' disabled></input>",
										"shain_no":"00000010",
										"shain_name":"高速0010",
										"grade":"T2",
										"age":"32",
										"new_affiliation":"名古屋支社 建設事業部 計画設計チーム",
										"now_affiliation":"名古屋支社四日市工事事務所 菰野四日市工事区",
										"note":"配置換",
										"torikomi_date":"2016/02/22",
										"nyutaikyo_yotei_kbn":"<font style='color:red'>未作成",
										"now_shataku":"",
										"detail":"<input type='button' style='text-align:center' value='詳細' class='imui-small-button' onclick=\"location.href='../../skf/Skf3020_Sc005/init'\"></input>",
										"del_btn":"<input type='button' value='削除' class='imui-small-button' ></input>"
									}
								];

								grid.jqGrid(parameter);

//								// ヘッダ結合
//								grid.jqGrid('setGroupHeaders', {
//									useColSpanStyle: true,
//									groupHeaders:[
//										{startColumnName: 'detail', numberOfColumns: 2,  titleText: 'メンテナンス'},
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
		<script type="text/javascript">
function ImageUp() {
window.open("../pop/pop_ShainNyuryokuShien.html","window1","width=650px,height=600px","menubar=no,resizable=yes");
}

function openWindow(){
  info = 'toolbar=no,location=no,directories=no,status=no,menubar=no,' +
   'scrollbars=no,left=0,top=0,resizable=yes,width=650px,height=680px,title=no';
  var window1 = window.open("../pop/pop_GenshatakuShokai.html","window1",info);
  window1.moveTo(0, 0);
  window.opener = self;
}


</script>
			<br />
			<div class="align-R">
				<input style="width:170px;" type="button" value="仮社員番号のデータ削除" class="imui-medium-button" onclick=""/>
				<input style="width:150px;" type="button" value="転任者調書取込" class="imui-medium-button" onclick="location.href='../../skf/Skf3020_Sc002/init'"/>
				<input style="width:150px;" type="button" value="新規" class="imui-medium-button" onclick="location.href='../../skf/Skf3020_Sc005/init'"/>
				<input style="width:150px;" type="button" value="登録" class="imui-medium-button" onclick=""/>
			</div>
		</div>

	</div>
<!-- コンテンツエリア　ここまで -->