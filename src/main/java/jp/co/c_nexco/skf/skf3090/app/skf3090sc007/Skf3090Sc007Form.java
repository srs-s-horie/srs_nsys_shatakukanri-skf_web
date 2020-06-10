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
	// 室・課等コード
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
	// 室・課等コード
	private String affiliation2CdError;
	// 機関
	private String agencyNameError;
	// 部等
	private String affiliation1NameError;
	// 室・課等
	private String affiliation2NameError;

	/** コントロール系 */
	// 会社ドロップダウン操作可否判定
	private String companyCdDisabled;
	// 機関コードテキストボックス操作可否判定
	private String agencyCdDisabled;
	// 機関コード名称を検索ボタン操作可否判定
	private String agencyCdSearchDisabled;
	// 部等コードテキストボックス操作可否判定
	private String affiliation1CdDisabled;
	// 部等コード名称を検索ボタン操作可否判定
	private String affiliation1CdSearchDisabled;
	// 室・課等コードテキストボックス操作可否判定
	private String affiliation2CdDisabled;
	// 機関テキストボックス操作可否判定
	private String agencyNameDisabled;
	// 部等テキストボックス操作可否判定
	private String affiliation1NameDisabled;
	// 室・課等テキストボックス操作可否判定
	private String affiliation2NameDisabled;
	// 事業領域ドロップダウン操作可否判定
	private String businessAreaCdDisabled;
	// 登録ボタン操作可否判定
	private String registButtonDisabled;
	// 登録ボタン表示可否判定
	private String registButtonRemove;
	// 削除ボタン操作可否判定
	private String deleteButtonDisabled;

	/** ドロップダウンリスト系 */
	// 会社ドロップダウンリスト
	List<Map<String, Object>> companyList;
	// 事業領域ドロップダウンリスト
	List<Map<String, Object>> businessAreaList;

	/** 画面表示系 */
	// 会社コード
	private String registCompanyCd;
	// 機関コード
	private String registAgencyCd;
	// 機関名称
	private String registAgencyName;
	// 部等コード
	private String registAffiliation1Cd;
	// 部等名称
	private String registAffiliation1Name;
	// 室・課等コード
	private String registAffiliation2Cd;
	// 室・課等名称
	private String registAffiliation2Name;
	// 事業領域コード
	private String registBusinessAreaCd;

	private String resultList;

}
