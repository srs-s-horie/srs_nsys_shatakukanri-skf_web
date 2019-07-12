package jp.co.c_nexco.skf.skf1010.app.skf1010sc001;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf1010Sc001Form extends BaseForm {
	
	private static final long serialVersionUID = 5285848663756806913L;
	
	// 代行ログインフラグ test3
    private String alterLoginFlg;
}
