package jp.co.c_nexco.skf.skf2100.app.skf2100sc003;

import jp.co.c_nexco.skf.skf2100.app.skf2100common.Skf2100CommonForm;
import java.util.*;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc003Form extends Skf2100CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 読み取り専用フラグ
	private boolean bihinReadOnly;
	// 「申請中」フラグ
	private boolean status01Flag;
	// モバイルルータ情報表示フラグ
	private boolean routerInfoViewFlag;
	// コメントボタン表示フラグ
	private boolean commentViewFlag;
	// コメント入力欄表示フラグ
	private boolean commentInputFlag;
	// 最終利用日編集フラグ
	private boolean lastUseDayEditFlag;
	
	// 貸出管理簿ID
	private String hdnRouterKanriId;
	
	/** 「故障」チェックボックス選択状態 */
	private String hdnChkFaultSelect;
	// コメント
	private String commentNote;
	private boolean commentBtnVisibled;

	/** ボタン非活性フラグ */
	//　申請要件を確認ボタン
	private String btnCheckDisabled;
	// 一時保存ボタン
	private String btnSaveDisabled;
	// 取下げボタン
	private String btnCancelDisabled;
	// 申請ボタン
	private String btnApplicationDisabled;
	// 故障フラグ
	private String faultFlagDisabled;
	
	/** エラー状態*/
	private String lastUseDayErr;
	private String telErr;
}
