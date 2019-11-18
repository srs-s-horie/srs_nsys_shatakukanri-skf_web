/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3022.app.skf3022sc005;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.*;

import lombok.EqualsAndHashCode;

/**
 * Skf3022Sc005Form 提示データ一覧Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3022Sc005Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	//検索条件
	// 社員番号
	private String shainNo;
	// 社員名
	private String shainName;
	// 社宅名
	private String shatakuName;
	// 入退居区分
	private String nyutaikyoKbn;
	// 入退居区分リスト
	private List<Map<String, Object>> nyutaikyoKbnList;
	// 社宅提示
	// 社宅提示状況
	private String stJyokyo;
	// 社宅提示状況リスト
	private List<Map<String, Object>> stJyokyoList;
	// 社宅提示確認督促
	private String stKakunin;
	// 社宅提示確認督促リスト
	private List<Map<String, Object>> stKakuninList;
	// 備品提示
	// 備品提示状況
	private String bhJyokyo;
	// 備品提示状況リスト
	private List<Map<String, Object>> bhJyokyoList;
	// 備品提示確認督促
	private String bhKakunin;
	// 備品提示確認督促リスト
	private List<Map<String, Object>> bhKakuninList;
	// 備品搬入搬出督促
	private String moveInOut;
	// 備品搬入搬出督促リスト
	private List<Map<String, Object>> moveInOutList;
	
	//検索結果一覧用
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;
	
	//ボタン制御
	private String btnShatakuTeijiDisabled;
	private String btnBihinTeijiDisabled;
	private String btnBihinInOutDisabled;
	//督促カウント
	private String hdnStTeijiCnt;
	private String hdnBhTeijiCnt;
	private String hdnMoveInOutCnt;
	
	//メール送信リスト文字列
	private String mailListData;
	//送信対象提示区分
	private String mailTeijiKbn;
	
	//削除時パラメータ
	private String delTeijiNo;
	private String delShainNo;
	private String delNyutaikyoKbn;
    private String delUpdateDate;
    private String delUpdateDateNtk;
    private String delUpdateDateShataku;
    private String delUpdateDateParkOne;
    private String delUpdateDateParkTwo;
    private String delShatakuNo;
    private String delRoomNo;
    private String delParkOne;
    private String delParkTwo;
    
	//画面連携項目
	//提示番号
	private String hdnTeijiNo;
	//入居予定日
	private String hdnNyukyoDate;
	//退居予定日
	private String hdnTaikyoDate;
	//申請書類管理番号
	private String hdnShoruikanriNo;
	//入退居区分
	private String hdnNyutaikyoKbn;
	//申請区分
	private String hdnApplKbn;
	//社員番号変更フラグ
	private String hdnShainNoChangeFlg;
	
	//検索条件退避
	//社員番号
	private String searchInfoShainNo;
	//社員氏名
	private String searchInfoShainName;
	//社宅名
	private String searchInfoShatakuName;
	//入退居区分
	private String searchInfoNyutaikyoKbn;
	//社宅提示状況
	private String searchInfoStJyokyo;
	//社宅提示確認督促
	private String searchInfoStKakunin;
	//備品提示状況
	private String searchInfoBhJyokyo;
	//備品提示確認督促
	private String searchInfoBhKakunin;
	//備品搬入搬出督促
	private String searchInfoMoveInout;

}
