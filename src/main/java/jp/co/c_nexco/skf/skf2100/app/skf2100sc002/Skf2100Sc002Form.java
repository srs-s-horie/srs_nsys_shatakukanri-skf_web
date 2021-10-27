package jp.co.c_nexco.skf.skf2100.app.skf2100sc002;

import java.util.Date;
import java.util.List;
import java.util.Map;

import jp.co.c_nexco.skf.skf2100.app.skf2100common.Skf2100CommonForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc002Form extends Skf2100CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// ボタン表示モードレベル
	private int dispMode;
	// CSS折り返し埋め込み用変数
	private String floatL;
	// 更新内容
	private String updateType;
	// 一時保存フラグ
	private boolean Status00Flag;
	// モバイルルータ情報表示フラグ
	private boolean routerInfoViewFlag;
	// コメントボタン表示フラグ
	private boolean commentViewFlag;
	// コメント入力欄表示フラグ
	private boolean commentInputFlag;
	// 利用開始希望日編集フラグ
	private boolean useStartHopeDayEditFlag;
	
	// 原籍会社
	private String originalCompanyCd;
	private String originalCompany;
	// 給与支給会社
	private String payCompanyCd;
	private String payCompany;
	
	/** ドロップダウンリスト */
	private String originalCompanySelect;
	// 原籍会社選択リスト
	private List<Map<String, Object>> originalCompanySelectList;
	// 給与支給会社名選択リスト
	private List<Map<String, Object>> payCompanySelectList;

	/** エラー */
	// 原籍会社
	private String originalCompanySelectErr;
	// 給与支給会社名
	private String payCompanySelectErr;
	/** エラー状態*/
	private String useStartHopeDayErr;
	private String mailAddressErr;
	private String telErr;
	private String receivedDateErr;
	private String shippingDateErr;
	
	// ボタン非活性フラグ
	// 承認ボタン
	private String btnApproveDisabled;
	// コメント欄非活性フラグ
	private String commentDisabled = "false";
	//　承認者用ボタン表示フラグ
	private boolean allButtonEscape;

	// 原籍会社
	private Boolean originalCompanySelectDisableFlg;
	// 給与支給会社
	private Boolean payCompanySelectDisableFlg;
	
	// 社員番号
	private String hdnApplShainNo;
	// 申請書類履歴テーブル申請日
	private Date applHistoryDate;
	
	// 添付資料情報
	private List<Map<String, Object>> attachedFileList;
	
	private Long hdnMobileRouterNo;
	private String hdnIccid;
	private String hdnImei;
	private String jsonLabelList;
}
