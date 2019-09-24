/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3090.app.skf3090sc003;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
* 事業領域マスタ登録非同期処理Form
* 
* @author NEXCOシステムズ
*
*/
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc003AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * 追加フォーム用
	 */	
	// - 管理会社
	private String selectedAddManageCompanyCd;
	// - 事業領域コード
	private String addBusinessAreaCd;
	// - 事業領域名
	private String addBusinessAreaName;
	// 管理会社リスト
	List<Map<String, Object>> addManageCompanyList;
	// 管理機関リスト
	List<Map<String, Object>> addManageAgencyList;

}
