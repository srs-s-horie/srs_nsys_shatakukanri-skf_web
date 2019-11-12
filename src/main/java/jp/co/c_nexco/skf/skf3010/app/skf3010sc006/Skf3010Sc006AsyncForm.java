/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3010.app.skf3010sc006;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
* Skf3010Sc006AsyncForm　借上社宅登録非同期処理Form
* 
* @author NEXCOシステムズ
*
*/
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3010Sc006AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * listTable用
	 */
//	private List<Map<String, Object>> listTableData;

//	private String act;

	// 社宅管理番号
	private String hdnShatakuKanriNo;
	// 契約情報表示プルダウンインデックス
	private String hdnDispContractSelectedIndex;
	
	/** 表示/非表示フラグ */
	// 外部機関表示フラグ
	private Boolean agencyDispFlg;

	/** ドロップダウンリスト */
	private List<Map<String, Object>> useKbnList;
	private List<Map<String, Object>> manageCompanyList;
	private List<Map<String, Object>> manageAgencyList;
	private List<Map<String, Object>> manageBusinessAreaList;
	private List<Map<String, Object>> prefList;
	private List<Map<String, Object>> shatakuStructureList;
	private List<Map<String, Object>> elevatorList;
	/** ドロップダウンリスト選択値 */
	// 地域区分選択値コード
	private String areaKbnCd;
	// 利用区分コード選択値
	private String useKbnCd;
	// 管理会社コード選択値
	private String selectedCompanyCd;
	// 管理機関コード選択値
	private String agencyCd;
	// 管理事業領域コード選択値
	private String manageBusinessAreaCd;
	// 都道府県コード選択値
	private String prefCd;
	// 社宅構造区分コード選択値
	private String structureKbn;
	// エレベーター区分選択値
	private String elevatorKbn;
	// 駐車場構造区分コード選択値
	private String parkingStructure;

	/** テキストエリア */
	// 郵便番号
	private String zipCd;
	// 社宅住所
	private String shatakuAddress;
	// 建築年月日
	private String buildDate;
	// 実年数
	private String jituAge;
	// 次回算定年月日
	private String nextCalcDate;
	// 経年
	private String aging;
	// 駐車場基本使用料
	private String parkingBasicRent;
	// 駐車場台数
	private String parkingBlockCount;
	// 貸与可能総数
	private String lendPossibleCount;


	// 駐車場区画削除フラグ
	private Boolean parkingBlockDeleteFlg;
	// 削除駐車場管理番号
	private String deleteParkingKanriNo;
	// 削除駐車場区画番号
	private String deleteParkingBlockNo;

	/** リストテーブル */
//	// 駐車場区画情報リスト
//	private List<Map<String, Object>> parkingInfoListTableData;
//	// 駐車場情報リスト(初期表示時：DB取得時)
//	private List<Map<String, Object>> hdnStartingParkingInfoListTableData;
	// 駐車場区画調整金額リスト
	private ArrayList <String> parkingRentalAdjusts;
	// 駐車場区画使用料リスト
	private List <String> parkingBlockRentManys;
	// 駐車場区画情報1行データ(id, 貸与区分, 貸与状況)
	private ArrayList<String> parkingBlockRowData;

	/** エラー系 **/
	// 郵便番号
	private String zipCdErr;
	
	//借上登録
	// 本来用途
	private String originalAuse;
	// 物置面積
	private String barnMenseki;
	// 物置調整面積
	private String barnMensekiAdjust;	
	//駐車場調整金額
	private String parkingRentalAdjust;
	//駐車場月額使用料
	private String parkingShiyoMonthFei;
	//郵便番号
	private String parkingZipCd;
	//住所
	private String parkingContractAddress;
	//郵便番号エラー
	private String parkingZipCdError;
}
