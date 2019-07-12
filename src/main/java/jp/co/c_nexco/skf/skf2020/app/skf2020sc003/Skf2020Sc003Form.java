package jp.co.c_nexco.skf.skf2020.app.skf2020sc003;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.skf.skf2020.app.skf2020common.Skf2020CommonForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2020Sc003Form extends Skf2020CommonForm {

	private static final long serialVersionUID = 5285848663756806913L;

	// 申請番号
	private String applNo;
	// 新社宅
	// 所在地
	private String newShozaichi;
	// 社宅名
	private String newShatakuName;
	// 室番号
	private String newShatakuNo;
	// 規格
	private String newShatakuKikaku;
	// 面積
	private String newShatakuMenseki;
	// 使用料
	private String newRental;
	// 共益費
	private String newKyoekihi;
	// 入居可能日
	private String nyukyoKanoDate;
	// 位置番号
	private String carIchiNo;
	// 駐車場使用料（月）
	private String parkingRental;
	// 現保有の社宅 管理番号
	private String nowShatakuKanriNo;
	// 現保有の社宅 部屋管理番号
	private String nowShatakuRoomKanriNo;
	// 社宅の状態
	private String shatakuJotai;
	// 社宅管理番号
	private String newShatakuKanriNo;
	// 備品希望申請を希望する/しない ラジオボタン
	private String bihinKibo;
	// 社宅情報 寮長・自治会長 部屋名称
	private String manegeShatakuNo1;
	// 社宅情報 寮長・自治会長 氏名
	private String manegeName1;
	// 社宅情報 寮長・自治会長 電子メールアドレス
	private String manegeMailAddress1;
	// 社宅情報 寮長・自治会長 電話番号
	private String manegeTelNo1;
	// 社宅情報 寮長・自治会長 内線番号
	private String manegeExtensionNo1;
	// 社宅情報 鍵管理者 部屋名称
	private String manegeShatakuNo2;
	// 社宅情報 鍵管理者 氏名
	private String manegeName2;
	// 社宅情報 鍵管理者 電子メールアドレス
	private String manegeMailAddress2;
	// 社宅情報 鍵管理者 電話番号
	private String manegeTelNo2;
	// 社宅情報 鍵管理者 内線番号
	private String manegeExtensionNo2;
	// 社宅情報 寮母・管理会社 部屋名称
	private String manegeShatakuNo3;
	// 社宅情報 寮母・管理会社 氏名
	private String manegeName3;
	// 社宅情報 寮母・管理会社 電子メールアドレス
	private String manegeMailAddress3;
	// 社宅情報 寮母・管理会社 電話番号
	private String manegeTelNo3;
	// 社宅情報 寮母・管理会社 内線番号
	private String manegeExtensionNo3;
	// 駐車場情報 １台目 自動車の保管場所
	private String parkingAddress1;
	// 駐車場情報 １台目 位置番号等
	private String carIchiNo1;
	// 駐車場情報 １台目 使用料（月）
	private String parkingRental1;
	// 駐車場情報 １台目 使用開始可能日
	private String parking1StartDate;
	// 駐車場情報 １台目 自動車の保管場所
	private String parkingAddress2;
	// 駐車場情報 １台目 位置番号等
	private String carIchiNo2;
	// 駐車場情報 １台目 使用料（月）
	private String parkingRental2;
	// 駐車場情報 １台目 使用開始可能日
	private String parking2StartDate;

	// 表示フラグ類
	// 編集ボタン非表示フラグ
	private String editBtnVisible;
	// 確定ボタン非表示フラグ
	private String commitBtnVisible;
	// 取消しボタン非表示フラグ
	private String cancelBtnVisible;
	// 備品返却欄
	private boolean bihinVisible;

	// 申請状況（テキスト）
	private String applStatusText;

	// 添付資料情報
	private List<Map<String, Object>> shatakuAttachedFileList;
	// 添付資料番号
	private String attachedNo;

}
