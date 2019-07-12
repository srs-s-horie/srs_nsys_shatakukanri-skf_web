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
	 * @param request
	 *            リクエスト情報
	 * @param response
	 *            レスポンス情報
	 * @param model
	 *            モデル
	 * @param pageId
	 *            画面ID
	 * @param actionId
	 *            アクションID
	 * @return JSP名
	 * @throws Exception
	 *             例外処理
	 */
	@RequestMapping(C_SYSTEMID + "/{pageId}/{actionId}")
	public String doAction(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable String pageId, @PathVariable String actionId) throws Exception {
		return super.doAction(request, response, model, C_SYSTEMID, pageId, actionId);
	}

	/**
	 * 動的にマッピング。
	 * 
	 * @param request
	 *            リクエスト情報(JSON)
	 * @param pageId
	 *            画面ID
	 * @param actionId
	 *            アクションID
	 * @return JSONレスポンス
	 * @throws Exception
	 *             例外処理
	 */
	@ResponseBody
	@RequestMapping(produces = "application/json; charset=UTF-8", value = "/async/" + C_SYSTEMID + "/{pageId}/{actionId}")
	public AsyncResponse doAsyncAction(HttpServletRequest request,
			@PathVariable String pageId,
			@PathVariable String actionId) throws Exception {
		return super.doAsyncAction(request, C_SYSTEMID, pageId, actionId);
	}

}
