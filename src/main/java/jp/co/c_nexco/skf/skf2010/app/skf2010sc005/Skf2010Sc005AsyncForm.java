package jp.co.c_nexco.skf.skf2010.app.skf2010sc005;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import lombok.EqualsAndHashCode;

/**
 * Skf2010Sc005 承認一覧非同期用Formクラス
 *
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc005AsyncForm extends AsyncBaseForm {

	/**
	 * シリアルナンバー
	 */
	private static final long serialVersionUID = 1L;

	/** 申請日From */
	private String applDateFrom;
	/** 申請日To */
	private String applDateTo;
	/** 承認日／修正依頼日From */
	private String agreDateFrom;
	/** 承認日／修正依頼日To */
	private String agreDateTo;
	/** 申請時の所属 */
	private String shinsei;
	/** 発令後の所属 */
	private String hatsurei;
	/** 機関 */
	private String agency;
	/** 部等 */
	private String affiliation1;
	/** 室、チーム又は課 */
	private String affiliation2;
	/** 申請者名 */
	private String applicantName;
	/** 申請書類種別 */
	private String applCtgry;
	/** 申請書類名 */
	private String applName;
	/** 承認者名 */
	private String agreementName;
	/** 申請状況 */
	private String[] applStatus;

	/** ドロップダウン：機関リスト */
	private List<Map<String, Object>> ddlAgencyList;
	/** ドロップダウン：部等リスト */
	private List<Map<String, Object>> ddlAffiliation1List;
	/** ドロップダウン：室、チーム又は課リスト */
	private List<Map<String, Object>> ddlAffiliation2List;

	private List<String> shainNoList;

	/** 検索結果一覧 */
	private List<Map<String, Object>> ltResultList;
}
