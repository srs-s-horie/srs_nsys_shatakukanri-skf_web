/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3090.app.skf3090sc005;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf3090Sc005AsyncForm 従業員マスタ登録非同期処理Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc005AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 1L;

	/** ドロップダウンリスト系 */
	// ドロップダウンを表示するために必要な情報
	// 原籍会社コード（ドロップダウン選択値）
	private String originalCompanyCd;
	// 機関コード（ドロップダウン選択値）
	private String agencyCd;
	// 部等コード（ドロップダウン選択値）
	private String affiliation1Cd;
	// 室・課等コード（ドロップダウン選択値）
	private String affiliation2Cd;
	// 事業領域コード（ドロップダウン選択値）
	private String businessAreaCd;

	// 会社ドロップダウンリスト
	List<Map<String, Object>> companyList;
	// 機関ドロップダウンリスト
	List<Map<String, Object>> agencyList;
	// 部等ドロップダウンリスト
	List<Map<String, Object>> affiliation1List;
	// 室・課等ドロップダウンリスト
	List<Map<String, Object>> affiliation2List;
	// 事業領域ドロップダウンリスト
	List<Map<String, Object>> businessAreaList;

}
