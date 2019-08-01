/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3090.app.skf3090sc006;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * 組織マスタ一覧非同期処理Form
 * 
 * @author y.morita
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc006AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 会社コード
	private String companyCd;
	// 機関コード
	private String agencyCd;
	// 部等コード
	private String affiliation1Cd;
	// 室、チーム又は課
	private String affiliation2Cd;
	// 事業領域コード
	private String businessAreaCd;

	// 会社リスト
	private List<Map<String, Object>> companyList;

	// 機関リスト
	private List<Map<String, Object>> agencyList;

	// 部等リスト
	private List<Map<String, Object>> affiliation1List;

	// 室、チーム又は課
	private List<Map<String, Object>> affiliation2List;

	// 事業領域リスト
	private List<Map<String, Object>> businessAreaList;

}
