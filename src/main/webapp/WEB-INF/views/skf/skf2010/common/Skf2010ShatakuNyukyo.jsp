          <div name="imui-8eqlrzsrdhv6itd" id="imui-8eqlrzsrdhv6htd" data-im-default-open="false">

              <tbody>
                    <div class="align-C">
                        <tr><font size="5" face="ＭＳ Ｐ明朝">社宅入居希望等調書</font><br></tr>
                    </div>

                    <div class="align-R">
                        <tr><font size="4"  face="ＭＳ Ｐ明朝">${f:h(form.applNo)}</font><br></tr>
                    </div>

                    <table class="imui-table" >

                    <tr>
                        <td width="480px"  style="font-size: 120%;font-family: ＭＳ Ｐ明朝">1.新たに社宅を必要としますか？</th>
                        <td width="500px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                        ${f:h(form.taiyoHitsuyoTrue)}&nbsp;必要とする
                        ${f:h(form.taiyoHitsuyoFalse)}&nbsp;必要としない
                        ${f:h(form.taiyoHitsuyoParking)}&nbsp;駐車場のみ
                        </td>
                    </tr>

                    <tr>
                        <td width="420px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">2.社宅を「必要とする。」、理由を教えてください。</td>
                        <td width="400px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                        ${f:h(form.hitsuyoRiyuIdou)}&nbsp;異動のため
                        ${f:h(form.hitsuyoRiyuMarry)}&nbsp;結婚のため
                        ${f:h(form.hitsuyoRiyuOther)}&nbsp;その他
                        </td>
                    </tr>

                    <tr>
                        <td width="400px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">3.社宅を「必要としない。」、理由を教えてください。</td>
                        <td width="420px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                        ${f:h(form.fuhitsuyoRiyuMyHome)}&nbsp;自宅通勤
                        ${f:h(form.fuhitsuyoRiyuSelfRental)}&nbsp;自己借上
                        ${f:h(form.fuhitsuyoRiyuOther)}&nbsp;その他
                        </td>
                    </tr>
                </table>

                <table class="imui-table">
                                <tr>
                                    <td width="100px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">4.社員番号</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.shainNo)}
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">5.氏名</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.name)}
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">6.等級</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.tokyu)}
                                    </td>
                                </tr>
                                </table>
                                
                                <table class="imui-table">
                                <tr>
                                    <td rowspan="7" width="50px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">7.所属</td>
                                    <td rowspan="4" width="80px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">現所属</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝"  width="100px">支社等</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nowAgency)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">部・事務所</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nowAffiliation1)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">室、チーム又は課</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nowAffiliation2)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">勤務先のTEL</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nowTel)}
                                    </td>

                                    </td>
                                </tr>
                                
                                <tr>
                                    <td rowspan="4" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">新所属</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">支社等</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.newAgency)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">部・事務所</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.newAffiliation1)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">室、チーム又は課</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.newAffiliation2)}
                                    </td>
                                </tr>
                                </table>
                                
                                <table class="imui-table">
                                <tr>
                                    <td width="100px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">8.必要とする社宅</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.hitsuyouShatakuFamily)}&nbsp;世帯
				                        ${f:h(form.hitsuyouShatakuOnly)}&nbsp;単身
				                        ${f:h(form.hitsuyouShatakuSingle)}&nbsp;独身
                                    </td>
                                </tr>
                                </table>
                                
                                <table class="imui-table">
                                <tr>
                                    <td colspan="5" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">9.必要とする社宅で同居する家族</td>
                                </tr>
                                
                    
                    <td colspan="5" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                              <table border="1" height="100px" class="imui-table" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                                <tr  style="height:25px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                                    <td style="text-align:center;width:10%;font-size: 85%;font-family: ＭＳ Ｐ明朝;">続柄</td>
                                                    <td style="text-align:center;width:30%;font-size: 85%;font-family: ＭＳ Ｐ明朝;">氏名</td>
                                                    <td style="text-align:center;width:10%;font-size: 85%;font-family: ＭＳ Ｐ明朝;">年齢</td>
                                                    <td style="text-align:center;width:10%;font-size: 85%;font-family: ＭＳ Ｐ明朝;">続柄</td>
                                                    <td style="text-align:center;width:30%;font-size: 85%;font-family: ＭＳ Ｐ明朝;">氏名</td>
                                                    <td style="text-align:center;width:10%;font-size: 85%;font-family: ＭＳ Ｐ明朝;">年齢</td>

                                                </tr>

                                                <tr>
                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoRelation1 )}
                                                    </td>

                                                    <td style="text-align:left;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoName1 )}
                                                    </td>

                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoAge1 )}
                                                    </td>
                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoRelation2 )}
                                                    </td>

                                                    <td style="text-align:left;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoName2 )}
                                                    </td>

                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoAge2 )}
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoRelation3 )}
                                                    </td>

                                                    <td style="text-align:left;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoName3 )}
                                                    </td>

                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoAge3 )}
                                                    </td>
                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoRelation4 )}
                                                    </td>

                                                    <td style="text-align:left;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoName4)}
                                                    </td>

                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoAge4 )}
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                   ${f:h(form.dokyoRelation5)}
                                                    </td>

                                                    <td style="text-align:left;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoName5)}
                                                    </td>

                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoAge5)}
                                                    </td>
                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoRelation6)}
                                                    </td>

                                                    <td style="text-align:left;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                     ${f:h(form.dokyoName6)}
                                                    </td>

                                                    <td style="text-align:center;height:25px;font-size: 85%;font-family: ＭＳ Ｐ明朝;">
                                                    ${f:h(form.dokyoAge6)}
                                                    </td>
                                                </tr>
                                              </table>

                                </table>
                                
                                <table class="imui-table">

                                <tr>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">10.入居希望日（予定日）</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nyukyoYoteiDate)}
                                    </td>
                                </tr>

                                <tr>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">11.自動車の保管場所を必要としますか。</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.parkingUmuTrue)}&nbsp;必要とする
                                        ${f:h(form.parkingUmuFalse)}&nbsp;必要としない
                                    </td>
                                </tr>
                                </table>
                                
                                <table class="imui-table">
                                <tr>
                                    <td rowspan="4" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" width="70px">１台目</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝"  width="200px">12.自動車の車名等</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" width="10px" colspan="3">
                                        ${f:h(form.carName)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">13.自動車の登録番号</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.carNo)}
                                    </td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝" width="200px">14.車検の有効期間満了日</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.carExpirationDate)}
                                    </td>

                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">15.自動車の使用者</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="3">
                                        ${f:h(form.carUser)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="2">16.自動車の保管場所使用開始日（予定日）</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="2">
                                        ${f:h(form.parkingUserDate)}
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td rowspan="4" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">２台目</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">17.自動車の車名</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="3">
                                        ${f:h(form.carName2)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">18.自動車の登録番号</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.carNo2)}
                                    </td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">19.車検の有効期間満了日</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="2">
                                        ${f:h(form.carExpirationDate2)}
                                    </td>

                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">20.自動車の使用者</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="3">
                                        ${f:h(form.carUser2)}
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="2">21.自動車の保管場所使用開始日（予定日）</td>
                                    <td width="330px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="2">
                                       ${f:h(form.parkingUserDate2)}
                                    </td>
                                </tr>
                                </table>
                                
                                <table class="imui-table">
                                <tr>
                                    <td rowspan="3" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" width="120px">22.入居社宅</td>
                                    <td width="450px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝" colspan="2">
                                        ${f:h(form.nowShatakuPossession)}&nbsp;保有（会社借上含む）
                                        ${f:h(form.nowShatakuMyHome)}&nbsp;自宅
                                        ${f:h(form.nowShatakuSelfRental)}&nbsp;自己借上
                                        ${f:h(form.nowShatakuOther)}&nbsp;自己借上
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝" width="150px">保有社宅名</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝"  width="250px">
                                        ${f:h(form.nowShatakuName)}
                                    </td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">号室</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nowShatakuNo)}
                                    </td>

                                </tr>
                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝"   width="200px">規格（間取り）</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nowShatakuKikaku)}
                                    </td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">面積</td>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.nowShatakuMenseki)}㎡
                                    </td>


                                </tr>
                                </table>
                                
                                <table class="imui-table">

                                <tr>
                                    <td width="90px" rowspan="2" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">23.現保有社宅退去日</td>
                                    <td width="220px" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                        ${f:h(form.taikyoYoteiTrue)}&nbsp;退居する
                                        ${f:h(form.taikyoYoteiFalse)}&nbsp;継続使用する

                                    </td>
                                </tr>
                                <tr>
                                    <td width="220px" style="font-size: 120%;height:16px;font-family: ＭＳ Ｐ明朝">
                                   ${f:h(form.taikyoYoteiDate)}

                                    </td>
                                </tr>

                                 </table>
                                
                                <table class="imui-table">

                                <tr>
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝" width="220px">24.特殊事情等（希望地域、間取り、階層、具体の社宅名などを記入して下さい。）</td>
                                </tr>
                                <tr rowspan="2" style="font-size: 120%;font-family: ＭＳ Ｐ明朝">
                                    <td style="font-size: 120%;font-family: ＭＳ Ｐ明朝" height="100px">
                                    ${f:h(form.tokushuJijo)}
                                    
                                    </td>
                                </tr>
                                <tr>
                                
                                </tr>
                                
                                </tr>
                        </table>
                    </td>
                    </td>
                </tr>
            </tbody>
                                            ※　必ずご希望の社宅をご案内できない場合もございますので、予めご了承ください。
        </table>

    </div>
              </tbody>
