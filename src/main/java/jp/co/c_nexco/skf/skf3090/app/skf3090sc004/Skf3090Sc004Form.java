/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3090.app.skf3090sc004;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * 従業員マスタ一覧同期処理Form
 * 
 * @author k.takagi
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc004Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * listTable用
	 */
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;

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
	private String originalCompanyCd;
	private String selectedCompanyCd;
	// 機関コード
	private String agencyCd;
	// 部等コード
	private String affiliation1Cd;
	// 室、チームまたは課コード
	private String affiliation2Cd;

	// 会社リスト
	private List<Map<String, Object>> companyList; // IM標準版

	// 機関リスト
	private List<Map<String, Object>> agencyList; // IM標準版

	// 部等リスト
	private List<Map<String, Object>> affiliation1List; // IM標準版

	// 室、チーム又は課リスト
	private List<Map<String, Object>> affiliation2List; // IM標準版

	// 検索フラグ
	private String searchFlag;

	/** 従業員マスタ登録画面hidden項目連携用 */
	// 社員番号
	private String hdnShainNo;
	// 氏名
	private String hdnName;
	// 氏名カナ
	private String hdnNameKk;
	// 原籍会社コード
	private String hdnOriginalCompanyCd;
	// 機関コード
	private String hdnAgencyCd;
	// 部等コード
	private String hdnAffiliation1Cd;
	// 室、チーム又は課コード
	private String hdnAffiliation2Cd;
	// 更新フラグ
	private String updateFlag;

}
