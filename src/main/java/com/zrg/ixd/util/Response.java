package com.zrg.ixd.util;

/**
 * Title: ͳһ��Ӧ�ṹ Description:ʹ��REST���ʵ��ǰ��˷���ܹ���������Ҫ����ȷ�����ص�JSON��Ӧ�ṹ��ͳһ�ģ�
 * Ҳ����˵��ÿ��REST���󽫷�����ͬ�ṹ��JSON��Ӧ�ṹ����������һ�����ͨ�õ�JSON��Ӧ�ṹ����
 * �а��������֣�Ԫ�����뷵��ֵ�����У�Ԫ���ݱ�ʾ�����Ƿ�ɹ��뷵��ֵ��Ϣ�ȣ�����ֵ��Ӧ����˷��������ص����ݡ� { "meta": { "success":
 * true, "message": "ok" }, "data": ... }
 * 
 * @author Snail
 *
 */
public class Response {

	private static final String OK = "ok";
	private static final String ERROR = "error";

	private Meta meta; // Ԫ����
	private Object data; // ��Ӧ����

	public Response success() {
		this.meta = new Meta(true, OK);
		return this;
	}

	public Response success(Object data) {
		this.meta = new Meta(true, OK);
		this.data = data;
		return this;
	}

	public Response failure() {
		this.meta = new Meta(false, ERROR);
		return this;
	}

	public Response failure(String message) {
		this.meta = new Meta(false, message);
		return this;
	}

	public Meta getMeta() {
		return meta;
	}

	public Object getData() {
		return data;
	}

	/**
	 * Title: ����Ԫ����
	 * 
	 * @author rico
	 * @created 2017��7��4�� ����5:08:12
	 */
	public class Meta {

		private boolean success;
		private String message;

		public Meta(boolean success) {
			this.success = success;
		}

		public Meta(boolean success, String message) {
			this.success = success;
			this.message = message;
		}

		public boolean isSuccess() {
			return success;
		}

		public String getMessage() {
			return message;
		}
	}
}