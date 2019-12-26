package jp.co.c_nexco.skf.skf3040.app.skf3040sc002;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3040Sc002Form extends NfwfileScDwdForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	// ページ種別対応
	private String pageMode = "0";	
	
	// 搬入・搬出日（From）
	private String carryingInOutTermFrom;
	private String carryingInOutTermFromErr;
	
	// 搬入・搬出日（To）
	private String carryingInOutTermTo;
	private String carryingInOutTermToErr;
	
	// 出力状況
	private String outSituation;
	
}
