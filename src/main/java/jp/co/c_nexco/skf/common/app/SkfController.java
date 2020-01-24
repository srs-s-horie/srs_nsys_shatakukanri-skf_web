package jp.co.c_nexco.skf.common.app;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import jp.co.c_nexco.nfw.webcore.app.AsyncResponse;
import jp.co.c_nexco.nfw.webcore.app.BaseControllerAbstract;
import jp.co.c_nexco.skf.common.constants.SkfCommonConstant;
import jp.co.intra_mart.foundation.authz.annotation.Authz;

/**
 * 
 * テスト用コントローラー
 *
 */
@Controller
public class SkfController extends BaseControllerAbstract {

	private static final String C_SYSTEMID = SkfCommonConstant.C_SYSTEM_ID;

	/**
	 * 動的にマッピング。
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param pageId 画面ID
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/{pageId}/{actionId}")
	public String doAction(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String pageId, @PathVariable String actionId) throws Exception {
		return super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
	}

	/**
	 * 社宅管理TOP
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf1010Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf1010Sc001/init", action = "execute")
	public String doActionSkf1010Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf1010Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社員名入力支援
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc001/init", action = "execute")
	public String doActionSkf2010Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 申請書類確認
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc002/init", action = "execute")
	public String doActionSkf2010Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 申請状況一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc003/init", action = "execute")
	public String doActionSkf2010Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 申請内容表示／引戻し
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc004/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc004/init", action = "execute")
	public String doActionSkf2010Sc004(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc004";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 申請条件確認
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc007/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc007/init", action = "execute")
	public String doActionSkf2010Sc007(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc007";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 添付資料入力支援
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc009/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc009/init", action = "execute")
	public String doActionSkf2010Sc009(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc009";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社宅入居希望等調書（申請者用）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2020Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf2020Sc002/init", action = "execute")
	public String doActionSkf2020Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2020Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社宅入居希望等調書（アウトソース用）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2020Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf2020Sc003/init", action = "execute")
	public String doActionSkf2020Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2020Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 備品希望申請（申請者用）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2030Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf2030Sc001/init", action = "execute")
	public String doActionSkf2030Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2030Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 備品希望申請（アウトソース用）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2030Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf2030Sc002/init", action = "execute")
	public String doActionSkf2030Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2030Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 退居（自動車の保管場所返還）届（申請者用）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2040Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf2040Sc001/init", action = "execute")
	public String doActionSkf2040Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2040Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 退居（自動車の保管場所返還（アウトソース用））届
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2040Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf2040Sc002/init", action = "execute")
	public String doActionSkf2040Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2040Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 備品返却確認（申請者用）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2050Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf2050Sc001/init", action = "execute")
	public String doActionSkf2050Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2050Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 備品返却確認（アウトソース用）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2050Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf2050Sc002/init", action = "execute")
	public String doActionSkf2050Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2050Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 承認一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc005/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc005/init", action = "execute")
	public String doActionSkf2010Sc005(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc005";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 申請書類承認／差戻し／通知
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc006/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc006/init", action = "execute")
	public String doActionSkf2010Sc006(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc006";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * レンタル備品指示書出力
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3040Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3040Sc001/init", action = "execute")
	public String doActionSkf3040Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3040Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 備品搬入・搬出確認リスト出力
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3040Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3040Sc002/init", action = "execute")
	public String doActionSkf3040Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3040Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社員番号一括設定
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3050Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3050Sc001/init", action = "execute")
	public String doActionSkf3050Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3050Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 月次運用管理
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3050Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3050Sc002/init", action = "execute")
	public String doActionSkf3050Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3050Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 年齢加算対象者一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3060Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3060Sc001/init", action = "execute")
	public String doActionSkf3060Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3060Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 借上候補物件登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2060Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf2060Sc001/init", action = "execute")
	public String doActionSkf2060Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2060Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 借上候補物件確認
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2060Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf2060Sc002/init", action = "execute")
	public String doActionSkf2060Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2060Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 借上候補物件提示確認
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2060Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf2060Sc003/init", action = "execute")
	public String doActionSkf2060Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2060Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 借上候補物件状況一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2060Sc004/{actionId}")
	@Authz(uri = "service://skf/Skf2060Sc004/init", action = "execute")
	public String doActionSkf2060Sc004(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2060Sc004";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社宅一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3010Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3010Sc001/init", action = "execute")
	public String doActionSkf3010Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3010Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 保有社宅登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3010Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3010Sc002/init", action = "execute")
	public String doActionSkf3010Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3010Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社員名入力支援
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3010Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf3010Sc003/init", action = "execute")
	public String doActionSkf3010Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3010Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 保有社宅部屋一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3010Sc004/{actionId}")
	@Authz(uri = "service://skf/Skf3010Sc004/init", action = "execute")
	public String doActionSkf3010Sc004(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3010Sc004";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 保有社宅部屋登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3010Sc005/{actionId}")
	@Authz(uri = "service://skf/Skf3010Sc005/init", action = "execute")
	public String doActionSkf3010Sc005(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3010Sc005";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 借上社宅登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3010Sc006/{actionId}")
	@Authz(uri = "service://skf/Skf3010Sc006/init", action = "execute")
	public String doActionSkf3010Sc006(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3010Sc006";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 駐車場契約情報登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3010Sc007/{actionId}")
	@Authz(uri = "service://skf/Skf3010Sc007/init", action = "execute")
	public String doActionSkf3010Sc007(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3010Sc007";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 現社宅照会（ポップアップ）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3020Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3020Sc001/init", action = "execute")
	public String doActionSkf3020Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3020Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 転任者情報取込
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3020Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3020Sc002/init", action = "execute")
	public String doActionSkf3020Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3020Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 転任者情報確認
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3020Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf3020Sc003/init", action = "execute")
	public String doActionSkf3020Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3020Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 転任者一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3020Sc004/{actionId}")
	@Authz(uri = "service://skf/Skf3020Sc004/init", action = "execute")
	public String doActionSkf3020Sc004(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3020Sc004";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 転任者登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3020Sc005/{actionId}")
	@Authz(uri = "service://skf/Skf3020Sc005/init", action = "execute")
	public String doActionSkf3020Sc005(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3020Sc005";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 入退居予定一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3021Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3021Sc001/init", action = "execute")
	public String doActionSkf3021Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3021Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 入退居申請照会（ポップアップ）
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3021Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3021Sc002/init", action = "execute")
	public String doActionSkf3021Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3021Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社宅部屋入力支援
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3022Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3022Sc001/init", action = "execute")
	public String doActionSkf3022Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3022Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 駐車場入力支援
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3022Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3022Sc002/init", action = "execute")
	public String doActionSkf3022Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3022Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 使用料計算入力支援
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3022Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf3022Sc003/init", action = "execute")
	public String doActionSkf3022Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3022Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 次月予約登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3022Sc004/{actionId}")
	@Authz(uri = "service://skf/Skf3022Sc004/init", action = "execute")
	public String doActionSkf3022Sc004(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3022Sc004";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 提示データ一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3022Sc005/{actionId}")
	@Authz(uri = "service://skf/Skf3022Sc005/init", action = "execute")
	public String doActionSkf3022Sc005(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3022Sc005";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 提示データ登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3022Sc006/{actionId}")
	@Authz(uri = "service://skf/Skf3022Sc006/init", action = "execute")
	public String doActionSkf3022Sc006(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3022Sc006";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 社宅管理台帳
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3030Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3030Sc001/init", action = "execute")
	public String doActionSkf3030Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3030Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 入退居情報登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3030Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3030Sc002/init", action = "execute")
	public String doActionSkf3030Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3030Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 法定調書データ管理
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3070Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3070Sc001/init", action = "execute")
	public String doActionSkf3070Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3070Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 賃貸人（代理人）情報登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3070Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3070Sc002/init", action = "execute")
	public String doActionSkf3070Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3070Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 賃貸人（代理人）所有物件一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3070Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf3070Sc003/init", action = "execute")
	public String doActionSkf3070Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3070Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 賃貸人（代理人）入力支援
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3070Sc004/{actionId}")
	@Authz(uri = "service://skf/Skf3070Sc004/init", action = "execute")
	public String doActionSkf3070Sc004(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3070Sc004";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 代行ログイン
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf2010Sc008/{actionId}")
	@Authz(uri = "service://skf/Skf2010Sc008/init", action = "execute")
	public String doActionSkf2010Sc008(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf2010Sc008";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 現物支給価額マスタ一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc001/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc001/init", action = "execute")
	public String doActionSkf3090Sc001(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc001";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 現物支給価額マスタ登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc002/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc002/init", action = "execute")
	public String doActionSkf3090Sc002(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc002";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 事業領域マスタ登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc003/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc003/init", action = "execute")
	public String doActionSkf3090Sc003(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc003";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 従業員マスタ一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc004/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc004/init", action = "execute")
	public String doActionSkf3090Sc004(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc004";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 従業員マスタ登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc005/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc005/init", action = "execute")
	public String doActionSkf3090Sc005(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc005";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 組織マスタ一覧
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc006/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc006/init", action = "execute")
	public String doActionSkf3090Sc006(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc006";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 組織マスタ登録
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc007/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc007/init", action = "execute")
	public String doActionSkf3090Sc007(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc007";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * お知らせ管理画面
	 * 
	 * @param request リクエスト情報
	 * @param response レスポンス情報
	 * @param model モデル
	 * @param actionId アクションID
	 * @return JSP名
	 * @throws Exception 例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/Skf3090Sc008/{actionId}")
	@Authz(uri = "service://skf/Skf3090Sc008/init", action = "execute")
	public String doActionSkf3090Sc008(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String actionId) throws Exception {
		String pageId = "Skf3090Sc008";
		String result = super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
		return result;
	}

	/**
	 * 動的にマッピング。
	 * 
	 * @param request リクエスト情報(JSON)
	 * @param pageId 画面ID
	 * @param actionId アクションID
	 * @return JSONレスポンス
	 * @throws Exception 例外処理
	 */
	@ResponseBody
	@RequestMapping(produces = "application/json; charset=UTF-8", value = "/async/" + C_SYSTEMID
			+ "/{pageId}/{actionId}")
	public AsyncResponse doAsyncAction(HttpServletRequest request, @PathVariable String pageId,
			@PathVariable String actionId) throws Exception {
		return super.doAsyncAction(request, C_SYSTEMID, pageId, actionId);
	}

}
