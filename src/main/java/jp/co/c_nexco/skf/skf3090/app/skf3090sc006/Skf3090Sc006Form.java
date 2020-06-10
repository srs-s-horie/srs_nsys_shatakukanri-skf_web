package jp.co.c_nexco.skf.skf3090.app.skf3090sc006;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc006Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// value値
	// 会社コード
	private String companyCd;

	// 機関コード
	private String agencyCd;

	// 部等コード
	private String affiliation1Cd;

	// 課
	private String affiliation2Cd;

	// 事業領域
	private String businessAreaCd;

	// 「管理会社」ドロップダウンリスト
	private List<Map<String, Object>> companyList;

	// 「機関」ドロップダウンリスト
	private List<Map<String, Object>> agencyList;

	// 「部等」ドロップダウンリスト
	private List<Map<String, Object>> affiliation1List;

	// 「室・課等」ドロップダウンリスト
	private List<Map<String, Object>> affiliation2List;

	// 「事業領域」ドロップダウンリスト
	private List<Map<String, Object>> businessAreaList;

	// リストテーブルデータ
	private List<Map<String, Object>> createTableList;

	// ページの最大表示数
	private String listTableMaxRowCount;

	// 更新フラグ
	private String updateFlag;

	// 登録フラグ
	private String registFlag;

	/** 組織マスタ登録画面hidden項目連携用 */
	// 会社コード
	private String hdnCompanyCd;
	// 機関コード
	private String hdnAgencyCd;
	// 部等コード
	private String hdnAffiliation1Cd;
	// 室・課等
	private String hdnAffiliation2Cd;
	// 事業領域
	private String hdnBusinessAreaCd;

}
