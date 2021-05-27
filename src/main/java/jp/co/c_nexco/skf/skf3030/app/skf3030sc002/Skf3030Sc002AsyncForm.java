/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3030.app.skf3030sc002;

import java.util.Map;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3030Sc002AsyncForm 入退居情報登録非同期Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3030Sc002AsyncForm extends AsyncBaseForm {

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

	/** 使用料計算入力パラメータ */
	private String sc006KukakuNoOne;
	private String hdnChushajoKanriNo1;
	private String hdnChushajoNoOneOld;
	private String sc006KukakuNoTwo;
	private String hdnChushajoKanriNo2;
	private String hdnChushajoNoTwoOld;
	
	/** 駐車場区画クリア処理 */
	private String hdnNengetsu;
	private String hdnShatakuKanriId;
	private String hdnChushajoKanriNo;
	private String parkingLendNo;
	private String checkResult;
	
	/** 役員算定チェック処理 */
	//役員算定
	private String yakuinSanteiSelectedValue;
	//社宅賃貸料
	private String txtShatakuChintairyo;
	//区画1  区画番号
	private String litKukaku1No;
	//区画2  区画番号
	private String litKukaku2No;
	//駐車場料金
	private String txtChishajoRyokin;
	//チェック結果
	private String sc006ChintaiRyoErr;
	//チェック結果
	private String sc006TyusyajoRyokinErr;
	
	/** 共益費日割計算対応 2021/5/14 add start **/
	// 個人負担共益費調整金額
	private String sc006KyoekihiTyoseiPay;
	// 共益費支払月選択値
	private String sc006KyoekihiPayMonthSelect;
	// 個人負担共益費月額
	private String sc006KyoekihiMonthPay;
	// 共益費支払月に対する支払額
	private String sc006KyoekihiMonth;
	// 個人負担共益費入居時加算額
	private String sc006KyoekihiNyukyoKasan;
	// 個人負担共益費退居時加算額
	private String sc006KyoekihiTaikyoKasan;
	// 個人負担共益費月額(調整後)
	private String sc006KyoekihiPayAfter;
	/** 共益費日割計算対応 2021/5/14 add end **/
}
