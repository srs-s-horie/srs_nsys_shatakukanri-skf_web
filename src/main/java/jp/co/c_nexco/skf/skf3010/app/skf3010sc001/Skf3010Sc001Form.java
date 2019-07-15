package jp.co.c_nexco.skf.skf3010.app.skf3010sc001;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3010Sc001Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	/**
	 * listTable用
	 */
	private List<Map<String, Object>> listTableData;
	private String listTableMaxRowCount;
	/** 検索キー */
	// 会社コード
	private String selectedCompanyCd;
	// 機関コード
	private String agencyCd;
	// 社宅区分
	private String shatakuKbn;
	// 空き部屋
	private String emptyRoom;
	// 利用区分
	private String useKbn;
	// 空き駐車場
	private String emptyParking;
	// 社宅名
	private String shatakuName;
	// 社宅住所
	private String shatakuAddress;
	// 外部機関表示フラグ
	private Boolean agencyDispFlg;
	
	/** ドロップダウン */
	// 管理会社リスト
	private List<Map<String, Object>> manageCompanyList;
	// 管理機関リスト
	private List<Map<String, Object>> manageAgencyList;
	// 社宅区分リスト
	private List<Map<String, Object>> shatakuKbnList;
	// 空き部屋リスト
	private List<Map<String, Object>> emptyRoomList;
	// 利用区分リスト
	private List<Map<String, Object>> useKbnList;
	// 空き駐車場リスト
	private List<Map<String, Object>> emptyParkingList;
	
	/** 画面連携用 */
    // 対象行の社宅区分
    private String hdnShatakuKbn;
    // 対象行の社宅管理番号
    private String hdnShatakuKanriNo;
    // 対象行の社宅名
    private String hdnShatakuName;
    // 対象行の地域区分
    private String hdnAreaKbn;
    // 対象行の空き部屋数
    private String hdnEmptyRoomCount;
    // 対象行の空き駐車場数
    private String hdnEmptyParkingCount;
	// 会社名
	private String companyName;
	// 管理会社名
	private String agencyName;
    
    /** hdn検索キー */
	// 会社コード
	private String hdnSelectedCompanyCd;
	// 機関コード
	private String hdnAgencyCd;
	// 空き部屋
	private String hdnEmptyRoom;
	// 利用区分
	private String hdnUseKbn;
	// 空き駐車場
	private String hdnEmptyParking;
	// 社宅住所
	private String hdnShatakuAddress;

}
