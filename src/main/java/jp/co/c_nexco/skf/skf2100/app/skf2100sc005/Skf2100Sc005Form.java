/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf2100.app.skf2100sc005;

import jp.co.c_nexco.businesscommon.entity.skf.exp.Skf2100Sc005.Skf2100Sc005GetListTableDataExpParameter;
import jp.co.c_nexco.businesscommon.entity.skf.exp.Skf3030Sc001.Skf3030Sc001GetShatakuKanriDaichoInfoExpParameter;
import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;

import java.util.List;
import java.util.Map;

import lombok.EqualsAndHashCode;

/**
 * Skf2100Sc005Form モバイルルーター貸出管理簿同期処理Form
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc005Form extends NfwfileScDwdForm {

	private static final long serialVersionUID = 4895690713868819526L;
	
	private String pageMode = "0";

	/** 「年」ドロップダウンリスト */
	private List<Map<String, Object>> yearDropDownList;
	/** 「月」ドロップダウンリスト */
	private List<Map<String, Object>> monthDropDownList;
	/** 「契約区分」ドロップダウンリスト */
	private List<Map<String, Object>> contractKbnDropDownList;

	/** 「検索結果一覧」リスト */
	private List<Map<String, Object>> searchDataList;

	/** 「締め処理」ラベル */
	private String labelShimeShori;
	/** 「POSITIVE連携」ラベル */
	private String labelPositiveRenkei;

	
	/** 「通しNo」テキスト */
	private String txtRouterNo;
	/** 「社員番号」テキスト */
	private String txtShainNo;
	/** 「電話番号」テキスト */
	private String txtTel;
	/** 「社員名」テキスト */
	private String txtShainName;
	/** 「契約終了日From」テキスト */
	private String txtContractEndDateFrom;
	/** 「契約終了日To」テキスト */
	private String txtContractEndDateTo;
	/** 「空きモバイルルーター」チェックボックス */
	private String chkAkiRouter;

	/**
	 * hidden 項目
	 */
	/** 選択された「年」ドロップダウンリストの選択 */
	private String hdnYearSelect;
	/** 選択された「月」ドロップダウンリストの選択 */
	private String hdnMonthSelect;
	/** 選択された 「契約区分」ドロップダウンリストの選択 */
	private String hdnContractKbnSelect;
	/** 「空きモバイルルーター」チェックボックス選択 */
	private String hdnChkAkiRouterSelect;
	
	/** 検索結果一覧の選択されたインデックス */
	private String hdnSelIdx;

	/** エラー*/
	private String txtContractEndDateToErr;
	private String txtContractEndDateFromErr;
	private String txtRouterNoErr;
	
	/** 検索パラメータ */
	private Skf2100Sc005GetListTableDataExpParameter searchParam;

}
