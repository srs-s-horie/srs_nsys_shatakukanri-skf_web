package jp.co.c_nexco.skf.skf2010.app.skf2010sc003;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc003Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 申請日From
	private String applDateFrom;
	// 申請日To
	private String applDateTo;
	// 承認日／修正依頼日From
	private String agreDateFrom;
	// 承認日／修正依頼日To
	private String agreDateTo;
	// 申請書類名
	private String applName;
	// 申請状況
	private String[] applStatus;
	private String sendApplStatus;
	// 申請番号
	private String applNo;
	// 申請書ID
	private String applId;

	// 検索結果一覧 */
	private List<Map<String, Object>> ltResultList;

	// 操作ガイド
	private String operationGuide;

	// エラー項目
	private String applDateFromErr;
	private String applDateToErr;
	private String agreDateFromErr;
	private String agreDateToErr;

}
