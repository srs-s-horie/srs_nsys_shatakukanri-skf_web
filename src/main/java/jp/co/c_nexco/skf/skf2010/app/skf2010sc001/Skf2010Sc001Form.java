package jp.co.c_nexco.skf.skf2010.app.skf2010sc001;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.PopupForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc001Form extends PopupForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String pageMode = "0";

	// 社員番号
	private String shainNo;
	// 氏名
	private String name;
	// 氏名（カナ）
	private String nameKk;
	// 現所属
	private String agency;

	// リストテーブル情報
	private List<Map<String, Object>> listTableList;

	// 親画面ID
	private String nyukyoFlag;

	// エラー関連
	private String errShainNo;
	private String errName;
	private String errNameKk;
	private String errAgency;
}
