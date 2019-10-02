package jp.co.c_nexco.skf.skf2060.app.skf2060sc003;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import jp.co.c_nexco.nfw.webcore.app.DownloadFile;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2060Sc003Form extends NfwfileScDwdForm {
	
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
	
    // 操作ガイド
    private String operationGuide;
	//コメントボタン表示切替用
	private boolean commentViewFlag;
	//「完了」ボタン、「再提示」ボタン表示切替用
	private boolean buttonViewFlag;
    
    //隠し要素
    //申請書類管理番号
    private String applNo;
    //選択物件番号
    private String checkCandidateNo;
    
    
    //借上物件リスト
    private List<Map<String, String>> kariageTeijiList;
    //ラジオボタン用借上物件番号
    private String radioCandidateNo;
    
    //添付ファイル用
	//借上候補物件番号
	private String hdnCandidateNo;
	//添付ファイル番号
	private String hdnAttachedNo;

}
