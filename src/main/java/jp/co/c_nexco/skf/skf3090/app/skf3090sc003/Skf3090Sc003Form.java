package jp.co.c_nexco.skf.skf3090.app.skf3090sc003;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.List;
import java.util.Map;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc003Form extends BaseForm {
	
	private static final long serialVersionUID = -1902278406295003652L;

	/**
	 * listTable用
	 */
	// - 検索結果一覧
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;
	private String registEditData;
	// - 登録部の情報
	private List<Map<String, Object>> listAddTableData;
	
	/**
	 * 検索フォーム用
	 */	
	// - 管理会社
	private String selectedManageCompanyCd;
	// - 事業領域コード
	private String businessAreaCd;
	// - 事業領域名
	private String businessAreaName;
	// 管理会社リスト
	List<Map<String, Object>> manageCompanyList;

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
	
	/**
	 *  hidden項目連携用
	　*/
	// - 管理会社
	private String hdnSelectedCompanyCd;
	// - 事業領域コード
	private String hdnBusinessAreaCd;
	// - 事業領域名
	private String hdnBusinessAreaName;

	// 登録ボタンの活性／非活性
	private boolean registButtonDisabled;

	/**
	 *  選択行項目
	　*/
	// 管理会社コード
	private String hdnRowCompanyCd;
	// 事業領域コード
	private String hdnRowBusinessAreaCd;
	// 事業領域名（隠し：変更前のもの）
	private String hdnRowBusinessAreaName;
	// 管理機関（隠し：変更前のもの）
	private String hdnRowAgencyCd;
	// 更新日時
	private String hdnRowUpdateDate;

	/**
	 *  追加行項目
	　*/
	// 管理会社コード
	private String hdnAddCompanyCd;
	// 事業領域コード
	private String hdnAddBusinessAreaCd;
	// 事業領域名
	private String hdnAddBusinessAreaName;
	// 管理機関
	private String hdnAddAgencyCd;
	
	/**
	 *  追加行項目エラー系
	　*/
	// エラーチェック情報
	private List <Boolean> errorListAddTable;
	
}
