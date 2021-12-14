package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthVO {

	private String userId;
	private String userAuth;
	
//	public void setAuthVO(String userid, String auth) {
//		this.userId=userid;
//		this.auth=auth;
//	}
}
