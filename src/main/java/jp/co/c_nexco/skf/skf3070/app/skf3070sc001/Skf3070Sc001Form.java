/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3070.app.skf3070sc001;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.skf.skf3070.app.skf3070common.Skf3070CommonForm;
import lombok.EqualsAndHashCode;

/**
 * 法定調書データ管理画面同期処理Form Skf3070Sc001Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3070Sc001Form extends Skf3070CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/* 項目 */
	// 所持物件数
	private String propertiesOwnedCnt;

	/* ドロップダウン */
	// 対象年ドロップダウン
	private List<Map<String, Object>> ddlTargetYearList;
	// 個人法人区分ドロップダウン
	private List<Map<String, Object>> ddlBusinessKbnList;
	// 個人番号ドロップダウン
	private List<Map<String, Object>> ddlAcceptFlgList;

	// 検索結果表示用
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;
}
