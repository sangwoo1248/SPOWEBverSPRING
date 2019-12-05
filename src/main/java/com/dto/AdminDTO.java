package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("AdminDTO")
public class AdminDTO {
	private String admin_id;
	private String admin_passwd;
	private String admin_username;
	
	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_passwd() {
		return admin_passwd;
	}
	public void setAdmin_passwd(String admin_passwd) {
		this.admin_passwd = admin_passwd;
	}
	public String getAdmin_username() {
		return admin_username;
	}
	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}

	public AdminDTO(String admin_id, String admin_passwd, String admin_username) {
		super();
		this.admin_id = admin_id;
		this.admin_passwd = admin_passwd;
		this.admin_username = admin_username;
	}

	@Override
	public String toString() {
		return "AdminDTO [admin_id=" + admin_id + ", admin_passwd=" + admin_passwd + ", admin_username="
				+ admin_username + "]";
	}
		
}
	