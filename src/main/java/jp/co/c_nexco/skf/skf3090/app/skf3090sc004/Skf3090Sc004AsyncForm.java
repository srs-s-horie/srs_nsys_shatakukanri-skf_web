/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3090.app.skf3090sc004;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * 従業員マスタ一覧非同期処理Form
 * 
 * @author k.takagi
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc004AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * listTable用
	 */
	private List<Map<String, Object>> listTableData;

	private String act;

	/**
	 * 検索フォーム用
	 */
	// 社員番号
	private String shainNo;
	// 社員名
	private String name;
	// 社員名（フリガナ）
	private String nameKk;
	// 会社コード
	private String selectedCompanyCd;
	// 機関コード
	private String agencyCd;
	// 部等コード
	private String affiliation1Cd;
	// 室、チームまたは課コード
	private String affiliation2Cd;

	// 会社リスト
	private List<Map<String, Object>> companyList; // IM標準版
	private String companyCdListJson; // 共通FW版

	// 機関リスト
	private List<Map<String, Object>> agencyList; // IM標準版
	private String agencyCdListJson; // 共通FW版

	// 部等リスト
	private List<Map<String, Object>> affiliation1CdList; // IM標準版
	private String affiliation1CdListJson; // 共通FW版

	// 室、チーム又は課リスト
	private List<Map<String, Object>> affiliation2CdList; // IM標準版
	private String affiliation2CdListJson; // 共通FW版

	/**
	 * 検索処理。
	 */
	public static interface Search {}

	/**
	 * 簡易エクセルファイルダウンロード処理。
	 */
	public static interface Download {}

	/**
	 * データダウンロード処理。
	 */
	public static interface DataDownload {}

}
