package ultil;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class SessionUlti {
	public static boolean isLogedIn(){
		Map<String, Object> sessionInfo=ActionContext.getContext().getSession();
		if(sessionInfo.containsKey("login")){
			return true;
			
		}else {
			return false;
		}
		
	}
	
	public static Map<String , Object> getSession(){
		Map<String, Object> sessionInfo=ActionContext.getContext().getSession();
		return sessionInfo;
	}
}
