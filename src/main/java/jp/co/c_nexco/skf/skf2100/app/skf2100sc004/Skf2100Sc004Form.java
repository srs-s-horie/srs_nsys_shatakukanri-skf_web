package jp.co.c_nexco.skf.skf2100.app.skf2100sc004;

import java.util.Date;
import java.util.List;
import java.util.Map;

import jp.co.c_nexco.skf.skf2100.app.skf2100common.Skf2100CommonForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc004Form extends Skf2100CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// ボタン表示モードレベル
	private int dispMode;
	// CSS折り返し埋め込み用変数
	private String floatL;
	// 更新内容
	private String updateType;

	// モバイルルータ情報表示フラグ
	private boolean routerInfoViewFlag;
	// 申請可否フラグ
	private String hdnConfirmFlg;
	// コメントボタン表示フラグ
	private boolean commentViewFlag;
	// コメント入力欄表示フラグ
	private boolean commentInputFlag;
	//窓口返却日編集フラグ
	private boolean returnDayEditFlag;	

	/** 「故障」チェックボックス選択状態 */
	private String hdnChkFaultSelect;
	
	/** エラー */
	// 窓口返却日
	private String returnDayErr;
	private String lastUseDayErr;
	
	// ボタン非活性フラグ
	// 承認ボタン
	private String btnApproveDisabled;
	// コメント欄非活性フラグ
	private String commentDisabled = "false";
	//　承認者用ボタン表示フラグ
	private boolean allButtonEscape;

	// 社員番号
	private String hdnApplShainNo;
	// 申請書類履歴テーブル申請日
	private Date applHistoryDate;
}
