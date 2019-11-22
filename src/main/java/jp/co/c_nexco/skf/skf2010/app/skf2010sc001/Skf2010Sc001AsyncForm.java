package jp.co.c_nexco.skf.skf2010.app.skf2010sc001;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.AsyncBaseForm;
import jp.co.c_nexco.nfw.webcore.app.PopupForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc001AsyncForm extends AsyncBaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String pageMode = "0";

	// 社員番号
	private String popShainNo;
	// 氏名
	private String popName;
	// 氏名（カナ）
	private String popNameKk;
	// 現所属
	private String popAgency;

	// リストテーブル情報
	private List<Map<String, Object>> popListTableList;

	// 親画面ID
	private String nyukyoFlag;

	// エラー関連
	private String errShainNo;
	private String errName;
	private String errNameKk;
	private String errAgency;
}
