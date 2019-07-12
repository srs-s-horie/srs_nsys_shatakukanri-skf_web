package jp.co.c_nexco.skf.skf2010.app.skf2010sc009;

import java.util.List;
import java.util.Map;
import org.springframework.web.multipart.MultipartFile;
import jp.co.c_nexco.nfw.webcore.app.GridForm;
import lombok.EqualsAndHashCode;

@lombok.Data
@EqualsAndHashCode(callSuper = true)
public class Skf2010Sc009Form extends GridForm {

	private static final long serialVersionUID = 5285848663756806913L;

	private String pageMode = "0";

	// 申請書類番号
	private String applNo;
	// 申請書類ID
	private String applId;
	// 申請書類名
	private String applName;
	// 添付書類
	private MultipartFile attachedFile;
	// 添付書類リスト
	private List<Map<String, Object>> attachedFileList;

	// 削除対象添付番号
	private String attachedNo;

	// エラー表示
	private String errorAttachedFile;
}
