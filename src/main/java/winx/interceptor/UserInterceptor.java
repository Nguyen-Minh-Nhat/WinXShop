package winx.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession ss = request.getSession();
		if (ss.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/login.htm");
			return false;
		}
		return true;

	}

}
