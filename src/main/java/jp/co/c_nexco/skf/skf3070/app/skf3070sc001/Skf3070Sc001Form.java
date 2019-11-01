package jp.co.c_nexco.skf.skf3070.app.skf3070sc001;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3070Sc001Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 検索結果表示用
	private List<Map<String, Object>> listTableData;

	// 賃貸人（代理人） 氏名又は名称
	private String ownerName;
	// 賃貸人（代理人） 氏名又は名称（フリガナ）
	private String ownerNameKk;
	// 住所(居所）又は所在地
	private String address;
	// 個人法人区分
	private String businessKbn;
	// 社宅名
	private String shatakuName;
	// 社宅住所
	private String shatakuAddress;
	// 対象年
	private String targetYear;
	// 個人番号受領状態
	private String acceptStatus;

}
