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

	// 「室、チーム又は課」ドロップダウンリスト
	private List<Map<String, Object>> affiliation2List;

	// 「事業領域」ドロップダウンリスト
	private List<Map<String, Object>> businessAreaList;

	// リストテーブルデータ
	private List<Map<String, Object>> listTableData;

}
