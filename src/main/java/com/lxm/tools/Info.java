package com.lxm.tools;

import java.util.Map;

/**
 * 封装的信息类
 * state String --状态标识(辅助信息msg):200,400,404,500
 * msg String---信息:ok,error
 * attribues  HashMap---前台数据
 * params   HashMap--- 前台参数
 * url  String  ---跳转页面
 * @author lxm
 *
 */
public class Info {

	private String state;
	private String msg;
	private String url;
	private Map<String,Object> attributes;
	private Map<String,Object> params;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Map<String, Object> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	public Map<String, Object> getParams() {
		return params;
	}
	public void setParams(Map<String, Object> params) {
		this.params = params;
	}
	@Override
	public String toString() {
		return "Info [state=" + state + ", msg=" + msg + ", url=" + url + ", attributes=" + attributes + ", params="
				+ params + "]";
	}
	
	
	
	
}
