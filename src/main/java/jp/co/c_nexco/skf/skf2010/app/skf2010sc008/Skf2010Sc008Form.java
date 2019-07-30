package jp.co.c_nexco.skf.skf2010.app.skf2010sc008;

import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc008Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 社員番号
	private String shainNo;
	// 社員氏名
	private String shainName;
	// 機関
	private String agency;
	// 部等
	private String affiliation1;
	// 室、チーム又は課
	private String affiliation2;
	// 機関名
	private String agencyName;
	// 部等名
	private String affiliation1Name;
	// 室、チーム又は課名
	private String affiliation2Name;
}
