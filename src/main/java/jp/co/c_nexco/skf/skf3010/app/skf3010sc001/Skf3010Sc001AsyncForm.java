/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3010.app.skf3010sc001;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * 社宅一覧非同期処理Form
 * 
 * @author k.takagi
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3010Sc001AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * listTable用
	 */
	private List<Map<String, Object>> listTableData;

	private String act;

	/** 検索キー */
	// 管理会社コード(検索キー)
	private String selectedCompanyCd;
	// 管理機関コード(検索キー)
	private String agencyCd;
	// 社宅区分コード(検索キー)
	private String shatakuKbnCd;
	// 空き部屋コード(検索キー)
	private String emptyRoomCd;
	// 利用区分コード(検索キー)
	private String useKbnCd;
	// 空き駐車場コード(検索キー)
	private String emptyParkingCd;
	// 社宅名(検索キー)
	private String shatakuName;
	// 社宅住所(検索キー)
	private String shatakuAddress;
	
	/** 表示/非表示フラグ */
	// 外部機関表示フラグ
	private Boolean agencyDispFlg;

	/** ドロップダウンリスト */
	// 管理会社リスト
	private List<Map<String, Object>> manageCompanyList; // IM標準版
	// 管理機関リスト
	private List<Map<String, Object>> manageAgencyList; // IM標準版
	// 社宅区分リスト
	private List<Map<String, Object>> shatakuKbnList; // IM標準版
	// 空き部屋リスト
	private List<Map<String, Object>> emptyRoomList; // IM標準版
	// 利用区分リスト
	private List<Map<String, Object>> useKbnList; // IM標準版
	// 空き駐車場リスト
	private List<Map<String, Object>> emptyParkingList; // IM標準版

}
