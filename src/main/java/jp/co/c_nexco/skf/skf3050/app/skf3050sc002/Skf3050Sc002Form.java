/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3050.app.skf3050sc002;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;

import java.util.List;
import java.util.Map;

import lombok.EqualsAndHashCode;

/**
 * Skf3050Sc002AsyncForm 月次運用管理画面の同期Form
 * 
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3050Sc002Form extends NfwfileScDwdForm {
	
	private static final long serialVersionUID = 5285848663756806913L;
	
	private String pageMode = "0";
	
	/** ドロップダウンリスト */
	private List<Map<String, Object>> dropDownList;
	/** 月次処理状況グリッド */
	private List<Map<String, Object>> getujiGrid;
	
	/**
	 * hidden 項目
	 */
	/** 実行指示予定処理年月 */
	private String hdnJikkouShijiYoteiNengetsu;
	/** 実行指示予定カラム */
	private String hdnJikkouShijiYoteiShoriCol;
	/** 実行指示予定インデックス */
	private String hdnJikkouShijiYoteiShoriIdx;
	/** 選択された「対象年度」（ドロップダウン） */
	private String hdnSelectedTaisyonendo;
	/** 「仮計算」ボタン非活性判定用 */
	private boolean hdnBtnKariKeisanDisabled;
	/** 「締め処理」ボタン非活性判定用 */
	private boolean hdnBtnShimeShoriDisabled;
	/** 「給与連携データ作成」ボタン非活性判定用 */
	private boolean hdnBtnRenkeiDataSakuseiDisabled;
	/** 「締め解除」ボタン非活性判定用 */
	private boolean hdnBtnShimeKaijoDisabled;
	/** 「給与連携データ確定」ボタン非活性判定用 */
	private boolean hdnBtnRenkeiDataKakuteiDisabled;
	/** 「仮計算」ボタン押下時のメッセージ */
	private String hdnKariKeisanBtnMsg;
	/** 「締め処理」ボタン押下時のメッセージ */
	private String hdnShimeShoriBtnMsg;
	/** 「給与連携データ作成」ボタン押下時のメッセージ */
	private String hdnRenkeiDataSakuseiBtnMsg;
	/** 「締め解除」ボタン押下時のメッセージ */
	private String hdnShimeKaijoBtnMsg;
	/** 「給与連携データ確定」ボタン押下時のメッセージ */
	private String hdnRenkeiDataKakuteiBtnMsg;
	/** 備品貸与日について警告が出ている状態でも処理続行するか判定するフラグ */
	private String hdnBihinTaiyoWarnContinueFlg;
	/** 備品返却日について警告が出ている状態でも処理続行するか判定するフラグ */
	private String hdnBihinHenkyakuWarnContinueFlg;
	/** チェック処理等で表示する警告メッセージ */
	private String hdnWarnMsg;
}
