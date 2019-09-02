package jp.co.c_nexco.skf.skf2060.app.skf2060sc001;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import jp.co.c_nexco.nfw.webcore.app.DownloadFile;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2060Sc001Form extends NfwfileScDwdForm {
	
	private static final long serialVersionUID = 5285848663756806913L;
	
	private String pageMode = "0";
	
	//提示対象者名
	private String presentedName;
	//提示状況
	private String presentedStatus;
	//提示日
	private String presentedDate;
	//借上社宅名
	private String shatakuName;
	//郵便番号
	private String postalCd;
	//住所
	private String address;
	//コメント
	private String comment;
	//借上社宅名エラークラス
	private String shatakuNameError;
	//郵便番号エラークラス
	private String postalCdError;
	//住所エラークラス
	private String addressError;
	
	//支援ボタン制御
	private String supportDisabled;
	
	//コメントボタン表示切替用
	private boolean commentViewFlag;
	
	//借上候補物件番号
	private long candidateNo;
	//添付ファイル番号
	private String attachedNo;

	// リストテーブルデータ
	private List<Map<String, Object>> listTableData;
	//　リストテーブルチェックボックス要素
	private String[] teijiVal;
	
	
	/** 借上候補物件登録画面hidden項目連携用 */
	//提示対象者番号
	private String presentedNo;
	//更新日時
	private String updateDate;
	// 会社コード
	private String hdnCompanyCd;
	// 借上候補物件番号
	private String hdnCandidateNo;
	//添付ファイル番号
	private String hdnAttachedNo;
	
	//申請書類ID
	private String applId;
	
	//添付ファイル用
	private List<DownloadFile> dlFile;
	
}
