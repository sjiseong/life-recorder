﻿package domain;

import java.util.Collection;

import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails{

	@Pattern(regexp="[a-zA-Z0-9]{4,20}", message="아이디는 영문과 숫자 4 ~ 20 글자로 구성됨")
	private String id;
	@Pattern(regexp="[a-zA-Z0-9!@#^*_-]{4,20}", message="비밀번호는 숫자와 영문, 특수문자(!@#^*_-) 4 ~ 20 글자로 구성됨")
	private String password;
	@Pattern(regexp="[ㄱ-ㅎ가-힣ㅏ-ㅣ0-9A-Za-z!@#^*_-]{2,20}", message="닉네임은 숫자와 영문, 한글, 특수문자(!@#^*_-) 2 ~ 20 글자로 구성됨")
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
