package jp.co.c_nexco.skf.skf2060.app.skf2060sc002;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import jp.co.c_nexco.nfw.webcore.app.DownloadFile;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2060Sc002Form extends NfwfileScDwdForm {
	
	private static final long serialVersionUID = 5285848663756806913L;
	
	private String pageMode = "0";

	//申請状況
	private String applStatus;
	//機関
	private String agency;
	//部等
	private String affiliation1;
	//室、チームまたは課
	private String affiliation2;
	//勤務先のTEL
	private String tel;
	//社員番号
	private String shainNo;
	//氏名
	private String name;
	//等級
	private String tokyu;
	//性別
	private String gender;
	//借上社宅名
	private String shatakuName;
	//社宅所在地
	private String shatakuNameAddress;
	//添付ファイル
	private String attachedFile;
    //理由ドロップダウン
    private List<Map<String, Object>> riyuList;
    //理由ドロップダウン選択された要素
    private String riyuDropdown;
    //備考
    private String biko;
	
    // 操作ガイド
    private String operationGuide;
	//コメントボタン表示切替用
	private boolean commentViewFlag;
	//「選択」ボタン表示切替用
	private boolean selectViewFlag;
    
    //隠し要素
    //申請書類管理番号
    private String applNo;
    // 申請書類ID
    private String applId;
    //提示回数
    private String teijiKaisu;
    
    //借上物件リスト
    private List<Map<String, String>> kariageTeijiList;
    //ラジオボタン用借上物件番号
    private String radioCandidateNo;
    
    //非活性制御用
    //理由ドロップダウン
    private String riyuDropdownDisabled;
    //備考テキストボックス
    private String bikoDisabled;
    
    //添付ファイル用
	//借上候補物件番号
	private String hdnCandidateNo;
	//添付ファイル番号
	private String hdnAttachedNo;

}
