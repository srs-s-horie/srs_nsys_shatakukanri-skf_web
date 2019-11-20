package jp.co.c_nexco.skf.skf3090.app.skf3090sc001;

import jp.co.c_nexco.nfw.webcore.app.BaseForm;
import jp.co.c_nexco.nfw.nfwfile.app.nfwfilescdwd.NfwfileScDwdForm;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf3090Sc001Form extends NfwfileScDwdForm {
	
	private static final long serialVersionUID = 5285848663756806913L;

	// ページ種別対応
	private String pageMode = "0";
	
	/** 現物支給価額リスト */
	@JsonIgnore
	private MultipartFile listGenbutsuShikyuKagaku;	

	/**
	 * listTable用
	 */
	// - 検索結果一覧
	private List<Map<String, Object>> listTableData;
	
	
	// 改定日
	private String hdnEffectiveDate;
	// 状態区分
	private String hdnJyotaiKbn;
	
	private String fileBoxErr;
	
}
