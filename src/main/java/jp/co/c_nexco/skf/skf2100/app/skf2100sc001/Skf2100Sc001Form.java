package jp.co.c_nexco.skf.skf2100.app.skf2100sc001;

import jp.co.c_nexco.skf.skf2100.app.skf2100common.Skf2100CommonForm;
import java.util.*;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100Sc001Form extends Skf2100CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 添付資料情報
	private List<Map<String, Object>> attachedFileList; // 添付資料
	
	// 読み取り専用フラグ
	private boolean bihinReadOnly;
	// 「申請中」フラグ
	private boolean status01Flag;
	// 「搬入済」フラグ
	private boolean status24Flag;
	// 備品申請ラジオボタンフラグ
	private String bihinCheckFlag;
	// モバイルルータ情報表示フラグ
	private boolean routerInfoViewFlag;
	// 申請可否フラグ
//	private String hdnConfirmFlg;
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
	
	// コメント
	private String commentNote;
	private boolean commentBtnVisibled;
	
	// モバイルルーター本体受領チェックフラグ
	private String hdnBodyReceiptChecked;
	// モバイルルーター手引き受領チェックフラグ
	private String hdnHandbookReceiptChecked;
	// 返却資材受領チェックフラグ
	private String hdnMaterialsReceivedChecked;

	/** ボタン非活性フラグ */
	// 搬入完了ボタン
	private String btnImportFinidhedDisabled;	
	//　申請要件を確認ボタン
	private String btnCheckDisabled;
	// 一時保存ボタン
	private String btnSaveDisabled;
	// 取下げボタン
	private String btnCancelDisabled;
	// 申請ボタン
	private String btnApplicationDisabled;
	
	// モバイルルーター本体受領チェックフラグ
	private String bodyReceiptCheckFlagDisabled;
	// モバイルルーター手引き受領チェックフラグ
	private String handbookReceiptCheckFlagDisabled;
	// 返却資材受領チェックフラグ
	private String materialsReceivedCheckFlagDisabled;
	
	/** エラー状態*/
	private String useStartHopeDayErr;
	private String mailAddressErr;
	private String telErr;
	private String receivedDateErr;
}
