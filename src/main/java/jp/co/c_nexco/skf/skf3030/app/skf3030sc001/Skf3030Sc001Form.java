/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3030.app.skf3030sc001;

import jp.co.c_nexco.businesscommon.entity.skf.exp.Skf3030Sc001.Skf3030Sc001GetShatakuKanriDaichoInfoExpParameter;
import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;

import java.util.List;
import java.util.Map;

import lombok.EqualsAndHashCode;

/**
 * Skf3030Sc001AsyncForm 社宅管理台帳同期処理Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3030Sc001Form extends NfwfileScDwdForm {

	private static final long serialVersionUID = 4895690713868819526L;
	
	private String pageMode = "0";

	/** 管理会社ドロップダウンリスト */
	private List<Map<String, Object>> companyAgencyDropDownList;
	/** 管理機関ドロップダウンリスト */
	private List<Map<String, Object>> agencyDropDownList;
	/** 「年」ドロップダウンリスト */
	private List<Map<String, Object>> yearDropDownList;
	/** 「月」ドロップダウンリスト */
	private List<Map<String, Object>> monthDropDownList;
	/** 「社宅区分」ドロップダウンリスト */
	private List<Map<String, Object>> shatakuKbnDropDownList;
	/** 「相互利用」ドロップダウンリスト */
	private List<Map<String, Object>> mutualuseDropDownList;
	/** 「検索結果一覧」リスト */
	private List<Map<String, Object>> searchDataList;

	/** 「締め処理」ラベル */
	private String labelShimeShori;
	/** 「POSITIVE連携」ラベル */
	private String labelPositiveRenkei;
	/** 「社員番号」テキスト */
	private String txtShainNo;
	/** 「社宅名」テキスト */
	private String txtShatakuName;
	/** 「社員名」テキスト */
	private String txtShainName;

	/**
	 * hidden 項目
	 */
	/** 選択された管理会社ドロップダウンリスト */
	private String hdnCompanyAgencySelect;
	/** 選択された管理機関ドロップダウンリストの選択 */
	private String hdnAgencySelect;
	/** 選択された「年」ドロップダウンリストの選択 */
	private String hdnYearSelect;
	/** 選択された「月」ドロップダウンリストの選択 */
	private String hdnMonthSelect;
	/** 選択された 「社宅区分」ドロップダウンリストの選択 */
	private String hdnShatakuKbnSelect;
	/** 選択された「相互利用」ドロップダウンリストの選択 */
	private String hdnMutualuseSelect;
	/** 管理機関ドロップダウン非活性 */
	private String hdnAgencyDisabled;
	/** 検索結果一覧の選択されたインデックス */
	private String hdnSelIdx;
	/** 社宅管理台帳検索パラメータ */
	private Skf3030Sc001GetShatakuKanriDaichoInfoExpParameter searchParam;

}
