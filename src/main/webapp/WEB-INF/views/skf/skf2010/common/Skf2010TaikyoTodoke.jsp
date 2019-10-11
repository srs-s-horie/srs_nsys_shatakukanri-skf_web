<%@ taglib prefix="imart" uri="http://www.intra-mart.co.jp/taglib/core/standard" %>
<%@ page import="jp.co.c_nexco.skf.common.constants.SkfCommonConstant" %>
<!-- 退居（（自動車の保管場所返還）届 -->
<div name="imui-8eqlrzsrdhv6itd" id="imui-8eqlrzsrdhv6htd" data-im-default-open="true">
	<tbody>
		<div class="align-L">
			<tr>
				<font size="4"  face="ＭＳ Ｐ明朝">別記様式３号</font><br>
			</tr>
		</div>
		<br><br><br>
		<div class="align-R">
			<tr>
				<font size="4"  face="ＭＳ Ｐ明朝">${f:h(form.applNo )}</font><br>
			</tr>
		</div>
		<br><br><br>
		<div class="align-L">
			<tr>
				<font size="4"  face="ＭＳ Ｐ明朝">中日本高速道路株式会社殿</font><br>
			</tr>
		</div>
		<br>
		<div class="align-C">
			<table>
				<tr width="1000px">
					<td  width="100px">
           				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           			</td>
            		<td width="300px">
            			<font size="3"  face="ＭＳ Ｐ明朝">機&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;関</font>
           			</td>
            		<td width="500px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
            			<font size="3"  face="ＭＳ Ｐ明朝">${f:h(form.nowAgency )}</font>
					</td>
				</tr>
				<tr>
					<td width="400px">
						<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
					</td>
				</tr>
				<tr>
					<td  width="100px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td width="400px">
						<font size="3"  face="ＭＳ Ｐ明朝">部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;等</font>
					</td>
					<td width="500px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
						<font size="3"  face="ＭＳ Ｐ明朝">${f:h(form.nowAffiliation1 )}</font>
					</td>
				</tr>
				<tr>
				    <td width="400px">
				    	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
				    </td>
				</tr>
				<tr>
					<td  width="100px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td width="400px">
						<font size="3"  face="ＭＳ Ｐ明朝">室、チーム又は課</font>
					</td>
					<td width="500px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
						<font size="3"  face="ＭＳ Ｐ明朝">${f:h(form.nowAffiliation2 )}</font>
					</td>
				</tr>
				<tr>
				    <td width="400px">
				    	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
				   	</td>
				</tr>
				<tr>
					<td  width="100px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td width="400px">
						<font size="3"  face="ＭＳ Ｐ明朝">現&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所</font>
					</td>
					<td width="500px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
						<font size="3"  face="ＭＳ Ｐ明朝">${f:h(form.address )}</font>
					</td>
				</tr>
				<tr>
					<td width="400px">
						<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
					</td>
				</tr>
				<tr>
				    <td width="400px">
				    	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
				    </td>
				</tr>
				<tr>
					<td  width="100px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td width="400px">
						<font size="3"  face="ＭＳ Ｐ明朝">氏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</font>
					</td>
					<td width="500px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
						<font size="3"  face="ＭＳ Ｐ明朝">${f:h(form.name )}</font>
					</td>
				</tr>
			</table>          
		</div>
		<br><br>
		<div class="align-C">		
			<tr>
				<td>
					<font size="4"  face="ＭＳ Ｐ明朝">
						<c:if test="${f:h(form.shatakuTaikyoKbn != '3' )}">
						              退居
						</c:if>
						<c:if test="${f:h(form.shatakuTaikyoKbn == '3' )}">
							<del>退居</del>
						</c:if>
						<c:if test="${f:h(form.shatakuTaikyoKbn != '2' )}">
							（自動車の保管場所返還）届
						</c:if>
						<c:if test="${f:h(form.shatakuTaikyoKbn == '2' )}">
							（<del>自動車の保管場所返還</del>）届
						</c:if>
					</font>
				</td>
			</tr>
			<br><br>        
			<tr>
				<td>
					<font size="3"  face="ＭＳ Ｐ明朝">今般次の理由により現在使用中の中日本高速道路株式会社社宅（自動車の保管場所）を退居（返還）いたしますのでお届けします。</font>
				</td>
			</tr>
			<br><br><br><br>
			<tr>
				<td>
					<font size="3"  face="ＭＳ Ｐ明朝">記</font>
				</td>
			</tr>
        </div>
		<br><br> 
        <div class="align-R">
        </div>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;１．退居（返還）する社宅又は、自動車の保管場所</font>
        </td>
        <br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■社宅</font>
        </td>
        <br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f:h(form.shatakuName )}</font>
        </td>
        <br><br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■駐車場１</font>
        </td>
        <br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f:h(form.parkingAddress1)}</font>
        </td>
        <br><br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■駐車場2</font>
        </td>
        <br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f:h(form.parkingAddress2)}</font>
        </td>
        <br><br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;２．退居日</font>
        </td>
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社宅等:</font>
        	<imart:decision case="${form.taikyoDateFlg}" value="<%= SkfCommonConstant.NOT_CHANGE %>">
        		<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;${f:h(form.taikyoDate)}</font>
        	</imart:decision>
        	<imart:decision case="${form.taikyoDateFlg}" value="<%= SkfCommonConstant.DATE_CHANGE %>">
        		<font size="3" color="red" face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;${f:h(form.taikyoDate)}</font>
        	</imart:decision>
        <br>
        <font size="3"  face="ＭＳ Ｐ明朝">
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	駐車場:
	    </font>
	    <imart:decision case="${form.parkingEDateFlg}" value="<%= SkfCommonConstant.NOT_CHANGE %>">
	        <font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;${f:h(form.parkingHenkanDate )}</font>
	    </imart:decision>
      	<imart:decision case="${form.parkingEDateFlg}" value="<%= SkfCommonConstant.DATE_CHANGE %>">
	        <font size="3" color="red" face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;${f:h(form.parkingHenkanDate )}</font>
	    </imart:decision>  
        <br><br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;３．退居（返還）理由所</font>
        </td>
        <br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f:h(form.taikyoRiyu )}</font>
        </td>
        <br><br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;４．退居後の連絡先</font>
        </td>
        <br>
        <td width="150px">
        	<font size="3"  face="ＭＳ Ｐ明朝">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f:h(form.taikyogoRenrakusaki )}</font>
        </td>
        <br><br>
        <br><br>
	</div>
</tbody>