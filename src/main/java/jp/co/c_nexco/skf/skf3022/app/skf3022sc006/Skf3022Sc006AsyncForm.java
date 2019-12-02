/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3022.app.skf3022sc006;

import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3022Sc006AsyncForm 提示データ登録非同期Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3022Sc006AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 社宅管理番号
	private String hdnShatakuKanriNo;
	// 非同期処理連携パラメータ
	private Map<String, String> mapParam;

	/** 使用料計算(提示データ登録画面)戻り値 */
	private String sc006TyusyaMonthPayAfter;
	private String sc006SiyoryoHiwariPay;
	private String sc006SyatauMonthPayAfter;
	private String sc006ShiyoryoTsukigaku;
	private String sc006TyusyaDayPayOne;
	private String sc006TyusyaMonthPayOne;
	private String sc006TyusyaDayPayTwo;
	private String sc006TyusyaMonthPayTwo;

	/** 使用料計算(提示データ登録画面)入力パラメータ */
	// パラメータ：駐車場管理番号
	private String sc006ChushajoKanriNo;
	// パラメータ：駐車場区画種別
	private String sc006ParkBlockKind;

	/** 駐車場変更戻り値 */
	// 駐車場区画更新日時
	private String hdnParkingBlockUpdateDate;

}
