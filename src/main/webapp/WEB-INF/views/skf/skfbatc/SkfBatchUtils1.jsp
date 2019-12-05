<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 共通JSP --%>
<%@ include file="/WEB-INF/views/nfw/framework/common/CommonWithOutGrid.jsp" %>
<%@ taglib prefix="nfwui" uri="/WEB-INF/tld/nfw/framework/nfwFramework" %>
<%@ taglib prefix="imui" uri="http://www.intra-mart.co.jp/taglib/imui" %>
<%@ taglib prefix="im" uri="http://www.intra-mart.co.jp/taglib/im-tenant" %>
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
	
	
</script>
		<!-- コンテンツエリア -->
		<div class="imui-form-container-wide" width="1350px" style="width: 80%; min-width:1300px;max-width: 1350px;">
			<div class="imui-form-container-wide"  style="width:600px;">
				<div class="imui-chapter-title" style="width:35%;"><h2>排他チェックテスト</h2></div>
				<nfwui:Form id="form" name="form" modelAttribute="form">
					<hidden id=pageId name=pageId value="testPage" />
					
					画面表示時任意入力項目
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社員番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="shainNo" name="shainNo" style="width: 80%;" value="${form.shainNo}" placeholder="任意入力項目"  tabindex="1" />
								</td>
								<td style="border:none">
								</td>
							</tr>
							</tbody>
					</nfwui:Table>
					提示データ
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									提示番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="teijiDataTeijiNo" name="teijiDataTeijiNo" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							</tbody>
					</nfwui:Table>
					入退居予定データ
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社員番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="ntYoteiDataShainNo" name="ntYoteiDataShainNo" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									入退居区分
								</th>
								<td style="width: 60%;">
								<imui:textbox id="ntYoteiDataNyutaikyoKbn" name="ntYoteiDataNyutaikyoKbn" style="width: 50%;" placeholder="key2"  tabindex="1" />
								</td>
							</tr>
							</tbody>
					</nfwui:Table>
					社宅管理台帳基本
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理台帳ID
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sLedgerShatakuKanriId" name="sLedgerShatakuKanriId" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							</tbody>
					</nfwui:Table>
					社宅駐車場区画情報マスタ
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sParkingBlockShatakuKanriNo" name="sParkingBlockShatakuKanriNo" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									駐車場管理番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sParkingBlockParkingKanriNo" name="sParkingBlockParkingKanriNo" style="width: 50%;" placeholder="key2"  tabindex="1" />
								</td>
							</tr>
							</tbody>
					</nfwui:Table>
					社宅部屋情報マスタ
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sRoomShatakuKanriNo" name="sRoomShatakuKanriNo" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									部屋管理番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sRoomRoomKanriNo" name="sRoomRoomKanriNo" style="width: 50%;" placeholder="key2"  tabindex="1" />
								</td>
							</tr>
							</tbody>
					</nfwui:Table>
					社宅管理台帳相互利用基本TBL
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理台帳ID
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sMutualShatakuKanriId" name="sMutualShatakuKanriId" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
					月別相互利用履歴TBL
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理台帳ID
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sMutualRirekiShatakuKanriId" name="sMutualRirekiShatakuKanriId" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									年月
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sMutualRirekiYearMonth" name="sMutualRirekiYearMonth" style="width: 50%;" placeholder="key2"  tabindex="2" />
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
					月別駐車場履歴TBL
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理台帳ID
								</th>
								<td style="width: 60%;">
								<imui:textbox id="pRirekiShatakuKanriId" name="pRirekiShatakuKanriId" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									駐車場貸与番号
								</th>
								<td style="width: 60%;">
								<imui:textbox id="pRirekiParkingLendNo" name="pRirekiParkingLendNo" style="width: 50%;" placeholder="key2"  tabindex="2" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									年月
								</th>
								<td style="width: 60%;">
								<imui:textbox id="pRirekiYearMonth" name="pRirekiYearMonth" style="width: 50%;" placeholder="key3"  tabindex="3" />
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
					月別使用料履歴TBL
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理台帳ID
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sRentalRirekiShatakuKanriId" name="sRentalRirekiShatakuKanriId" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									年月
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sRentalRirekiYearMonth" name="sRentalRirekiYearMonth" style="width: 50%;" placeholder="key2"  tabindex="2" />
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
					社宅管理台帳備品基本TBL
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									社宅管理台帳ID
								</th>
								<td style="width: 60%;">
								<imui:textbox id="sBihinShatakuKanriId" name="sBihinShatakuKanriId" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
					提示備品データTBL
					<nfwui:Table use="search">
						<tbody>
							<tr>
								<th style="width: 30%;">
									提示備品データ
								</th>
								<td style="width: 60%;">
								<imui:textbox id="tBihinDataTeijiNo" name="tBihinDataTeijiNo" style="width: 50%;" placeholder="key1"  tabindex="1" />
								</td>
							</tr>
							<tr>
								<th style="width: 30%;">
									備品コード
								</th>
								<td style="width: 60%;">
								<imui:textbox id="tBihinDataBihinCd" name="tBihinDataBihinCd" style="width: 50%;" placeholder="key2"  tabindex="2" />
								</td>
							</tr>
						</tbody>
					</nfwui:Table>					
					結果コード
					<nfwui:Table use="search">
							<tbody>
							<div class="imui-chapter-title" style="width:35%;"><h2>処理終了コード</h2></div>
							<tr>
								<th style="width: 30%;">
									処理終了コード
								</th>
								<td style="width: 60%;">
								<imui:textbox id="returnStatus" name="returnStatus" style="width: 50%;" value="${form.returnStatus}" placeholder="正常：0 異常：9" tabindex="6" />
								</td>
								<td style="border:none">
								</td>
							</tr>
						</tbody>
					</nfwui:Table>
				</nfwui:Form>
			</div>
			<br />
			
			<div class="align-R">
				<nfwui:Button id="registe" name="registe" value="実行!" cssClass="imui-medium-button" 
						url="skf/SkfBatchUtils1/execute" formId="form" tabindex="8" />
			</div>
		</div>
	<!-- コンテンツエリア　ここまで -->