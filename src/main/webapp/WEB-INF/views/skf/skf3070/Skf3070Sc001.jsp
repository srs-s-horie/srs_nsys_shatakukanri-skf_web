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

<!-- コンテンツエリア -->
<div class="imui-form-container-wide" width="1450px" style="width: 100%; max-width: 1450px;">
<table align="center">
    <tr>
        <td>
            <div>
                <table class="imui-form-search-condition" width="1450px">
                    <td class="imui-form-container-wide" style="width: 100%; border: none;" >
                     <div class="imui-form-container-wide" style="height:200px;width: 1400px">
                       <div class="imui-chapter-title" style="margin-bottom: 1px;" >
                            <h2>検索条件</h2>
                        </div>
                            <form id="form" class="target_form mt-10" action="" method="POST">
                        <table class="imui-form-search-condition">
                            <tbody>
                            <tr>
                            </tr>
                                <tr>
                                    <th  style="width: 200px;"><label>氏名又は名称</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 350px;" type="text" value="中日本 0001" placeholder="例　中日本 一郎"></input>
                                    </td>
                                    <th  style="width: 200px;"><label>社宅名</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 350px;" type="text" placeholder="例　社宅名"></input>
                                    </td>
                                </tr>

                                <tr>
                                    <th  style="width: 200px;"><label>氏名又は名称（フリガナ）</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 350px;" type="text" placeholder="ナカニホン　イチロウ"></input>
                                    </td>
                                    <th  style="width: 170px;"><label>社宅住所</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 450px;" type="text" placeholder="例　愛知県名古屋市中区錦2-18-19"></input>
                                    </td>
                                </tr>

                                <tr>
                                    <th  style="width: 200px;"><label>住所（居所）又は所在地</label></th>
                                    <td>
                                    <input class="ime-off" style="width: 450px;" type="text" placeholder="例　愛知県名古屋市中区錦2-18-19"></input>
                                    </td>
                                    
                                    <th  style="width: 200px;"><label>対象年</label></th>
                                    <td>
                                        <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="     width:50%;">
                                            <option style="    " value="2019">2019</option>
                                            <option style="    " value="2018">2018</option>
                                            <option style="    " value="2017">2017</option>
                                            <option style="    " value="2016">2016</option>
                                            <option style="    " value="2015">2015</option>
                                            <option style="    " value="2014">2014</option>
                                            <option style="    " value="2013">2013</option>
                                            <option style="    " value="2012">2012</option>
                                            <option style="    " value="2011">2011</option>
                                            <option style="    " value="2010">2010</option>
                                        </select>
                                    </td>
                                    </tr>
                                    <tr>
                                    <th  style="width: 170px;"><label>個人法人区分</label></th>
                                    <td>
                                        <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="     width:50%;">
                                            <option style="    " value="0" label=""></option>
                                            <option style="    " value="1" label="個人">個人</option>
                                            <option style="    " value="2" label="法人">法人</option>
                                        </select>
                                    </td>
                                    <th  style="width: 170px;"><label>個人番号</label></th>
                                    <td>
                                        <select name="imui-8eqlrzssihv6mtd" id="imui-8eqlrzssihv6ltd" style="     width:70%;">
                                            <option style="    " value="0" label=""></option>
                                            <option style="    " value="1" label="提出済">提出済</option>
                                            <option style="    " value="2" label="未提出（拒否議事録提出済）">未提出（拒否議事録提出済）</option>
                                            <option style="    " value="3" label="未提出（収集中）">未提出（収集中）</option>
                                            <option style="    " value="4" label="提出不要（個人への支払い、かつ、15万未満）">提出不要（個人への支払い、かつ、15万未満）</option>
                                            <option style="    " value="5" label="提出不要（法人への支払い）">提出不要（法人への支払い）</option>
                                        </select>
                                    
                                    <td style="width: 170px;border:none;"></td>
                                    <td style="border:none;">
                                        
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                            </form>
        
                         <div class="align-L">    
                             <input tabindex="19" name="imui-8euruuk15dn9qtq" id="submit0" type="button" value="検索" class="imui-medium-button" >
                         </div>
                         </div>

</table>
</div>

</div>

<script type="text/javascript">
  (function($){
    $.imui.util.loadCSS("../../ui/libs/jquery.jqGrid-4.3.3/css/ui.jqgrid.css", { media: "screen" });
  })(jQuery);
</script>

</div>




<!-- テーブル一覧箇所 -->
<div class="imui-form-container" width="1400px" style="width: 100%; max-width: 1400px;">
<!-- 明細＆細目未満 -->
  <!-- 明細部 -->
  <form id="sampleList1">
    <div class="imui-chapter-title" width="1400px" style="width:1400px; max-width:1400px;"><h2>検索結果一覧</h2></div>
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
                                                "氏名又は名称 ",   
                                                "氏名又は名称<br>（フリガナ）",             
                                                "住所（居所）又は所在地",                            
                                                "法人個人",  
                                                "個人番号",
                                                "所有物件数",
                                                "編集",
                                                "物件",
                                                
                                            ],
                                            "datatype":"local",
                                            "errorCell":function(xhr) { imuiShowErrorMessage($(xhr.responseText).find('dt').text()); },
                                            "rowNum":10,
                                            "width":"1400",
                                            "shrinkToFit":"false",
                                            "cellsubmit":"clientArray",
                                            "loadonce":true,
                                            "colModel":[
{"hidden":true,"name":"id","key":true}
,{"name":"A001","width":"160","align":"left"}<!-- 氏名又は名称 -->
,{"name":"A002","width":"150","align":"left"}<!-- 氏名又は名称(フリガナ) -->
,{"name":"A003","width":"380","align":"left"}<!-- 住所（居所）又は所在地-->
,{"name":"A004","width":"060","align":"center"}<!-- 法人個人-->
,{"name":"A008","width":"300","align":"left"}<!-- 個人番号-->
,{"name":"A005","width":"080","align":"right"}<!-- 所有物件数-->
,{"name":"A006","width":"100","align":"center"}<!-- 編集-->
,{"name":"A007","width":"100","align":"center"}<!-- 物件-->

                                            ],
                                            "rownumbers":true,
                                            "height":"232"
                                        };
                                        parameter.data = [
                                            {
"A001":"中日本 001",
"A002":"ナカニホン001",
"A003":"〇〇県××市△△△ 1-2-3",
"A004":"個人",
"A005":"2",
"A006":"<a hidden>編集</a><input type='button' value='編集' class='imui-small-button' onclick=\"location.href='../所有者情報一覧・詳細/S0000_ShoyushaJouhouTouroku.html'\">",
"A007":"<a hidden>物件</a><input type='button' value='物件' class='imui-small-button' onclick=\"location.href='../所有者情報一覧・詳細/S0000_ShoyushaJouhouSyousai.html'\">",
"A008":"受領済",
                                                "id":1
                                            },{
"A001":"中日本 002",
"A002":"ナカニホン002",
"A003":"〇〇県××市△△△ 1-2-3",
"A004":"個人",
"A005":"3",
"A006":"<a hidden>編集</a><input type='button' value='編集' class='imui-small-button' onclick=\"location.href='../所有者情報一覧・詳細/S0000_ShoyushaJouhouTouroku.html'\">",
"A007":"<a hidden>物件</a><input type='button' value='物件' class='imui-small-button' onclick=\"location.href='../所有者情報一覧・詳細/S0000_ShoyushaJouhouSyousai.html'\">",
"A008":"提出不要（個人への支払い、かつ、15万未満）",
                                                "id":2
                                            },{
"A001":"中日本 003",
"A002":"ナカニホン003",
"A003":"〇〇県××市△△△ 1-2-3",
"A004":"",
"A005":"0",
"A006":"<a hidden>編集</a><input type='button' value='編集' class='imui-small-button' onclick=\"location.href='../所有者情報一覧・詳細/S0000_ShoyushaJouhouTouroku.html'\">",
"A007":"<a hidden>物件</a><input type='button' value='物件' class='imui-small-button' onclick=\"location.href='../所有者情報一覧・詳細/S0000_ShoyushaJouhouSyousai.html'\">",
"A008":"未提出（拒否議事録提出済）",
                                                "id":3
                                                }
                                        ];

      grid.jqGrid(parameter);

      grid.jqGrid('navGrid','#sampleListTable1-pager',{
        edit: false,
        add: false,
        del: false,
        search: false
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

  </form>
</div>
</div>


 <br><br>

</table>
                <div class="align-R">
                                    <input name="doSendBack" id="" type="button" value="法定調書データ出力" class="imui-medium-button" style="width:150px"/>
                    <input name="doSendBack" id="" type="button" value="賃貸人（代理人）情報出力" class="imui-medium-button"  style="width:200px"/>

                    <input name="doSendBack" id="" type="button" value="新規登録" class="imui-medium-button" onclick="location.href='../所有者情報一覧・詳細/S0000_ShoyushaJouhouTouroku.html'"  style="width:150px"/>
                </div>


</div>
<!-- コンテンツエリア　ここまで -->