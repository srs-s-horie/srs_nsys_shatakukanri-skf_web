/*
 * Copyright(c) 2020 NEXCO Systems company limited All rights reserved.
 */
package jp.co.c_nexco.skf.skf3090.app.skf3090sc005;

import java.util.List;
import java.util.Map;
import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import lombok.EqualsAndHashCode;

/**
 * 従業員マスタ登録同期処理Form Skf3090Sc005Form
 * 
 * @author NEXCOシステムズ
 *
 */
@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc005Form extends BaseForm {

	private static final long serialVersionUID = 5285848663756806913L;

	/** 画面遷移時に設定されたコード */
	// 社員番号
	private String hdnShainNo;
	// 氏名
	private String hdnName;
	// 氏名カナ
	private String hdnNameKk;
	// 原籍会社コード
	private String hdnOriginalCompanyCd;
	// 機関コード
	private String hdnAgencyCd;
	// 部等コード
	private String hdnAffiliation1Cd;
	// 室、チーム又は課コード
	private String hdnAffiliation2Cd;
	// リストテーブルで選択された社員番号
	private String hdnSelectedShainNo;
	// 更新フラグ
	private String updateFlag;

	/** ドロップダウンリスト系 */
	// 会社ドロップダウンリスト
	List<Map<String, Object>> companyList;
	// 機関ドロップダウンリスト
	List<Map<String, Object>> agencyList;
	// 部等ドロップダウンリスト
	List<Map<String, Object>> affiliation1List;
	// 室、チーム又は課ドロップダウンリスト
	List<Map<String, Object>> affiliation2List;
	// 事業領域ドロップダウンリスト
	List<Map<String, Object>> businessAreaList;

	/** 画面表示系 */
	// 社員番号
	private String shainNo;
	// 氏名
	private String name;
	// 氏名カナ
	private String nameKk;
	// メールアドレス
	private String mailAddress;
	// 退職日
	private String retireDate;
	// 原籍会社コード（ドロップダウン選択値）
	private String originalCompanyCd;
	// 機関コード（ドロップダウン選択値）
	private String agencyCd;
	// 部等コード（ドロップダウン選択値）
	private String affiliation1Cd;
	// 室、チーム又は課コード（ドロップダウン選択値）
	private String affiliation2Cd;
	// 事業領域コード（ドロップダウン選択値）
	private String businessAreaCd;

	/** エラー系 **/
	// 社員番号
	private String shainNoError;
	// 氏名
	private String nameError;
	// 氏名カナ
	private String nameKkError;
	// メールアドレス
	private String mailAddressError;
	// 退職日
	private String retireDateError;
	// 原籍会社コード（ドロップダウン選択値）
	private String originalCompanyCdError;

	/** DBから取得したhidden項目 */
	// ロールID
	private String roleId;
	// 登録フラグ
	private String registFlg;

	/** コントロール設定値 */
	private String shainNoDisabled;
	private String deleteRemoveFlag;

}
