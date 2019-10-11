package jp.co.c_nexco.skf.skf3090.app.skf3090sc008;

import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import jp.co.c_nexco.nfw.webcore.app.DownloadFile;

import java.util.*;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc008AsyncForm extends AsyncBaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;
	
	//お知らせ内容
	private String note;
	//公開開始日カレンダー
	private String openDateBox;
	
	//確認ダイアログフラグ
	private boolean dialogFlg;
	
	
}
