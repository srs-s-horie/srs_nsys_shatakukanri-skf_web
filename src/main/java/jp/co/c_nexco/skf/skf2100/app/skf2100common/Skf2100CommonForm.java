package jp.co.c_nexco.skf.skf2100.app.skf2100common;

import java.util.Date;
import java.util.List;
import java.util.Map;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2100CommonForm extends NfwfileScDwdForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// ユーザID
	private String userId;
	// 申請書類番号
	private String applNo;
	// 申請書類ID
	private String applId;
	// 申請状況
	private String applStatus;
	private String sendApplStatus;
	private String applStatusText;
	// 申請日時
	private Date applDate;
	// 社員番号
	private String hdnShainNo;

	// 【所属】
	// 機関
	private String agency;
	// 部等
	private String affiliation1;
	// 室、チームまたは課
	private String affiliation2;
	// 勤務先のTEL
	private String tel;
	// 申請者社員番号
	private String shainNo;
	// 氏名
	private String name;
	// メールアドレス
	private String mailAddress;
	// モバイルルーター通しNo
	private Long mobileRouterNo;
	// ICCID
	private String iccid;
	// IMEI
	private String imei;
	
	//ルーター借用希望申請書
	// 利用開始希望日
	private String useStartHopeDay;
	private String useStartHopeDaylbl;
	// 発送日
	private String shippingDate;
	private String shippingDatelbl;
	// 受領日
	private String receivedDate;
	private String receivedDatelbl;
	// モバイルルーター本体受領チェックフラグ
	private String bodyReceiptCheckFlag;
	// モバイルルーター手引き受領チェックフラグ
	private String handbookReceiptCheckFlag;
	// 返却資材受領チェックフラグ
	private String materialsReceivedCheckFlag;
	
	
	//ルーター返却申請書
	// 故障フラグ
	private String faultFlag;
	// 最終利用日
	private String lastUseDay;
	private String lastUseDaylbl;
	// 窓口返却日
	private String returnDay;
	private String returnDaylbl;
	
	// コメント
	private String commentNote;
	// コメントボタン表示フラグ
	private boolean commentViewFlag;
	// コメント入力欄表示フラグ
	private boolean commentInputFlag;
	
	/** 補足ファイル */
	private String hdnHosoku;
	private String hdnAttachedNo;
	private String attachedNo;

	//ファイル番号
	private String fileNo;
	//種別
	private String hosokuType;
	
	
	// 表示フラグ系
	// 「搬入完了日」非活性フラグ
	private boolean completionDayDisabled;

	// 操作ガイド
	private String operationGuide;

	// 戻るボタン遷移先用URL
	private String backUrl;

}
