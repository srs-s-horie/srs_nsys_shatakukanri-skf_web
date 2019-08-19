package jp.co.c_nexco.skf.skf3090.app.skf3090sc007;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc007Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/** 画面遷移時に設定されたコード */
	// 会社コード
	private String hdnCompanyCd;
	// 機関コード
	private String hdnAgencyCd;
	// 部等コード
	private String hdnAffiliation1Cd;
	// 室、チーム又は課コード
	private String hdnAffiliation2Cd;
	// 事業領域
	private String hdnBusinessAreaCd;
	// 更新フラグ
	private String updateFlag;

	/** エラー系 */
	// 機関コード
	private String agencyCdError;
	// 部等コード
	private String affiliation1CdError;
	// 室、チーム又は課コード
	private String affiliation2CdError;
	// 機関
	private String agencyNameError;
	// 部等
	private String affiliation1NameError;
	// 室、チーム又は課
	private String affiliation2NameError;

	/** コントロール系 */
	// 会社ドロップダウン操作可否判定
	private String companyCdDisabled;
	// 機関コードテキストボックス操作可否判定
	private String agencyCdDisabled;
	// 部等コードテキストボックス操作可否判定
	private String affiliation1CdDisabled;
	// 室、チーム又は課コードテキストボックス操作可否判定
	private String affiliation2CdDisabled;
	// 機関テキストボックス操作可否判定
	private String agencyNameDisabled;
	// 部等テキストボックス操作可否判定
	private String affiliaiton1NameDisabled;
	// 室、チーム又は課テキストボックス操作可否判定
	private String affiliation2NameDisabled;
	// 事業領域ドロップダウン操作可否判定
	private String businessAreaCdDisabled;

	/** ドロップダウンリスト系 */
	// 会社ドロップダウンリスト
	List<Map<String, Object>> companyList;
	// 事業領域ドロップダウンリスト
	List<Map<String, Object>> businessAreaList;

	/** 画面表示系 */
	// 会社コード
	private String companyCd;
	// 機関コード
	private String agencyCd;
	// 部等コード
	private String affiliation1Cd;
	// 室、チーム又は課コード
	private String affiliation2Cd;
	// 事業領域コード
	private String businessAreaCd;
	// 機関
	private String agencyName;
	// 部等
	private String affiliation1Name;
	// 室、チーム又は課
	private String affiliation2Name;

}
