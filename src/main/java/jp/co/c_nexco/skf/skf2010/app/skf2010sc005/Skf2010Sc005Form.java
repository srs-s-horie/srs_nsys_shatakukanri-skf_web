package jp.co.c_nexco.skf.skf2010.app.skf2010sc005;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.GridForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2010Sc005 承認一覧Formクラス
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc005Form extends GridForm {

	/**
	 * シリアルナンバー
	 */
	private static final long serialVersionUID = 1L;

	private String pageMode = "0";

	// 申請日From
	private String applDateFrom;
	// 申請日To
	private String applDateTo;
	// 承認日／修正依頼日From
	private String agreDateFrom;
	// 承認日／修正依頼日To
	private String agreDateTo;
	// 所属機関
	private String shozokuKikan;
	// 機関
	private String agency;
	// 部等
	private String affiliation1;
	// 室、チーム又は課
	private String affiliation2;
	// 申請者名
	private String name;
	// 申請書類種別
	private String applCtgry;
	// 申請書類名
	private String applName;
	// 承認者名
	private String agreementName;
	// 申請状況
	private String[] applStatus;

	// 一括承認用変数
	private String submitApplNo;

	// ドロップダウン：機関リスト
	private List<Map<String, Object>> ddlAgencyList;
	// ドロップダウン：部等リスト
	private List<Map<String, Object>> ddlAffiliation1List;
	// ドロップダウン：室、チーム又は課リスト
	private List<Map<String, Object>> ddlAffiliation2List;

	// private List<String> shainNoList;

	// 検索結果一覧 */
	private List<Map<String, Object>> ltResultList;

	// 操作ガイド
	private String operationGuide;

	// エラー項目
	private String applDateFromErr;
	private String applDateToErr;
	private String agreDateFromErr;
	private String agreDateToErr;
	private String applStatusErr;

	// 以下画面遷移用
	private String applNo;
	private String applId;
	private String sendApplStatus;
	private String applShainNo;
	private String shonin1;
	private String shonin2;

	private String backUrl;

	/**
	 * 検索処理。
	 */
	public static interface Search {}

	/**
	 * 簡易エクセルファイルダウンロード処理。
	 */
	public static interface Download {}

	/**
	 * データダウンロード処理。
	 */
	public static interface DataDownload {}
}
