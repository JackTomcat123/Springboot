package com.example.iphone;

import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

public class MessageUtil {
	/**
	 * 时间戳接口配置
	 */
	public static final String TIMESTAMP = "https://api.mysubmail.com/service/timestamp";
	/**
	 * 备用接口
	 * http://api.mysubmail.com/service/timestamp
	 * https://api.submail.cn/service/timestamp
	 * http://api.submail.cn/service/timestamp
	 */
	
	public static final String TYPE_MD5 = "md5";
	public static final String TYPE_SHA1 = "sha1";
	
	/**
	    * API 请求接口配置
	    */
	private static final String URL="https://api.mysubmail.com/message/xsend";
	/**
	 * 备用接口
	 * @param args
	 * http://api.mysubmail.com/message/xsend
	 * https://api.submail.cn/message/xsend
	 * http://api.submail.cn/message/xsend
	 */
	
	//Phone-->用户输入的手机号       StochasticNum-->系统随机的随机数    TemplateNum-->根据用户所选择的手机号登录或者手机号注册选择相对应的信息模板
	public static void SendMessage(String Phone,String StochasticNum ,String project ) {
		TreeMap<String, Object> requestData = new TreeMap<String, Object>();
		JSONObject vars = new JSONObject();
		/**
		 * --------------------------------参数配置------------------------------------
		 * 请仔细阅读参数配置说明
		 * 
		 * 配置参数包括 appid, appkey ,to ,project, signtype, vars
		 * appid, appkey, to, project 为必须参数
		 * 请访问 submail 官网创建并获取 appid 和 appkey，链接：https://www.mysubmail.com/chs/sms/apps
		 * 请访问 submail 官网创建获取项目标识 project_id，链接：https://www.mysubmail.com/chs/sms/templates
		 * 如何获取项目标识 project 参数，链接：https://www.mysubmail.com/chs/documents/developer/MmSw12
		 * vars参数
		 * 例： vars.put("code", "123456"), 其中 code 对应短信模板中的 @var(code) 变量
		 * signtype 为可选参数: normal | md5 | sha1
		 * 当 signtype 参数为空时，默认为 normal
		 *  --------------------------------------------------------------------------
		 */
		String appid = "23113";
		//注册后平台给予我们的两个变量值   -->appid  appkey
		String appkey = "97f7ed4aa5955e348e8e4f52bf104b8c";
		//接收到用户注册信息的手机号（可用于登录）
		String to = Phone;
		//根据用户选择的注册或登录不同的验证码模板
		//String project = "IQke11";//-->"kuQxf4"  只要能更换这个的ID 就行
		String signtype = ""; 
		//对接与平台的'code'变量-->验证码
		vars.put("code", StochasticNum);
		//对接与平台的'name'变量-->所做项目名称
		vars.put("name", "DM");
		//对接与平台的'time'变量-->发送验证码的有效时间   60s
		vars.put("time", 60); 
		
		/**
		 *  ---------------------------------------------------------------------------
		 */
		/**
		 *  签名验证方式
		 *  详细说明可参考 SUBMAIL 官网，开发文档 → 开始 → API 授权与验证机制
		 */
		requestData.put("appid", appid);
		requestData.put("project", project);// 这个？
		requestData.put("to", to);
		if(!vars.isEmpty()){
			requestData.put("vars",vars.toString());
		}
		MultipartEntityBuilder builder = MultipartEntityBuilder.create();
		@SuppressWarnings("deprecation")
		ContentType contentType = ContentType.create(HTTP.PLAIN_TEXT_TYPE,HTTP.UTF_8);
		for(Map.Entry<String, Object> entry: requestData.entrySet()){
			String key = entry.getKey();
			Object value = entry.getValue();
			if(value instanceof String){
				builder.addTextBody(key, String.valueOf(value),contentType);
			}
		}	
		if(signtype.equals(TYPE_MD5) || signtype.equals(TYPE_SHA1)){
			String timestamp = getTimestamp();
			requestData.put("timestamp", timestamp);
			requestData.put("sign_type", signtype);
			String signStr = appid + appkey + RequestEncoder.formatRequest(requestData) + appid + appkey;
			
			builder.addTextBody("timestamp", timestamp);
			builder.addTextBody("sign_type", signtype);
			builder.addTextBody("signature", RequestEncoder.encode(signtype, signStr), contentType);
		}else{
			builder.addTextBody("signature", appkey, contentType);
		}
		/**
		 * http post 请求接口
		 * 成功返回 status: success,其中 fee 参数为短信费用 ，credits 参数为剩余短信余额
		 * 详细的 API 错误日志请访问 SUBMAIL 官网 → 开发文档 → DEBUG → API 错误代码
		 */
		HttpPost httpPost = new HttpPost(URL);
		httpPost.addHeader("charset", "UTF-8");
		httpPost.setEntity(builder.build());
		try{
			CloseableHttpClient closeableHttpClient = HttpClientBuilder.create().build();
			HttpResponse response = closeableHttpClient.execute(httpPost);
			HttpEntity httpEntity = response.getEntity();
			if(httpEntity != null){
				String jsonStr = EntityUtils.toString(httpEntity, "UTF-8");
				System.out.println(jsonStr);
			}
		}catch(ClientProtocolException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	/**
	 * 获取时间戳
	 * @return
	 */
	private static String getTimestamp(){
		CloseableHttpClient closeableHttpClient = HttpClientBuilder.create().build();
		HttpGet httpget = new HttpGet(TIMESTAMP);
		try{
			HttpResponse response = closeableHttpClient.execute(httpget);
			HttpEntity httpEntity = response.getEntity();
			String jsonStr = EntityUtils.toString(httpEntity,"UTF-8");
			if(jsonStr != null){
				JSONObject json = JSONObject.fromObject(jsonStr);
				return json.getString("timestamp");
			}
			closeableHttpClient.close();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}