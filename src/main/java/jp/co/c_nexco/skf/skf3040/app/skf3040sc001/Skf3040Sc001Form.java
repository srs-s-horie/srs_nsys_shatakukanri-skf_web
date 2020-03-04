package jp.co.c_nexco.skf.skf3040.app.skf3040sc001;

import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;

import lombok.EqualsAndHashCode;
/**
 * Skf3040Sc001Form レンタル備品指示書出力画面クラス。　 
 * 
 * @author NEXCOシステムズ
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3040Sc001Form extends NfwfileScDwdForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	// ページ種別対応
	private String pageMode = "0";	
	
	// 希望日（From）
	private String desiredTermFrom;
	private String desiredTermFromErr;
	
	// 希望日（To）
	private String desiredTermTo;
	private String desiredTermToErr;
	
	// 再発行
	private String reIssuance;
	
}
