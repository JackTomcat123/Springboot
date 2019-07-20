package com.cn.alipay.config;


import java.io.FileWriter;
import java.io.IOException;
/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092300577541";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCNTLu5qo3/daFexSO5ci8+ZAHkKikQLpKK+MnHPWMNLC/ZOgpXxmlZjv7olngpYhNmHtwXotSvbFkCg4v/QKq3rTeo8m6pffrEwU68MoBauq2UrT0yfM5toqin7xfVRRDEEk0r0A/IE/iRwOLNfmeJ5iGsa8EvYdnUlb4HpgRj3KQblIhOvjcy9KcEQgsWWUSlQKJYYIv4+lT3ouCHu0d7snIEdtUZ1qSnHsK+0BVw8ooQe0zZOe/vRHHv27gEYut/FuhlvbnrGTBOFJVH+BUEFoVxeIYJB0yCcsc2HzcYQG/ktPstEKU9sfINPL/IierVNMnCf8eMhzP67Bib79l1AgMBAAECggEABz8VLYtqptxAf1y63UrW02tLkYj7/CF3UHs71eT3DHjkp05Ls36wbnBf8EuvM+gcuJMClI+8Opbi5bcbWebWGn9eqGJufHDCiI6lXA9297A1MLfFuK4f5A2AesRPQ5e8KWIK5SFRfeBQUiFDQGioJLFRrscD7EsnYbigO0IvXXOizwuWADOvP22LhXcnHi876AvcykH5iPmgI0ZoG2vRvW9msbnSM/U3XFNFv3bv/emPhx/OnhHhNHHm4mMIGt9D0xyzXbNauF0nSDOdtAuUWiOlx4J1qF2EvsnLLZYrRMd57GQW1V0HWK29SVAoAYYTJUZvG1a/7k+dQuLTyf5qYQKBgQDDdlidrmf2UgiM1T1dV8dLxXe+00iqtNomtFrAkTx3+o9OgLu6ICq5JNUqW3RolPE8NAu/AauUOgC1C4Nb9o1bC5wyoKXwTW07GB4W1PWWZzSEqkyMeYerJEjQn3H4UmBNLm8YU91bFhctZa9wJ9xgOpkYRnIc+2RUulGDvruxjQKBgQC5D/3ClAWOtqo4kuYqyUh2mxlVnDCmd+hXUyjKcIWTxP31f+Ib1HhBAQ8EQwLArKmtecXfMtfqWHvstA+odSpwNBFVYxYUbySO92/WJOqMMS57Ue5rI9wqck6tvkHvj/fYr9+6Xm2oBAcU2u56E9Zkfk5HGG/TduSZcc0ughdpiQKBgFWh+6DZT+Kyfdx1b7T9R+sCUDviBOwE364lRb0n4/4MX8xcyeH5Rb5nTJyKBK3s0uM1ShAcgzclUjn/GUWo9rT0mTH0/74PrdM99bC7C/0gqfmVQoQomi94bg44TI4mSNqHhVR7KXdGblENQ5c3X20pPvlLo6Le4E3ecuftH/3hAoGBAITIa4wkRwSKHgKvrERA3iRzzq61fdbDrEqT2W2/ZKiNLKbsliDfx1Tk3JBzQFNcz/YvrIEkavWzfV9uJtn5D3UodtNsYBhTUsjd0zm0jTH/y9kiBU6MkVlHYRqaq5anFu876ew/+rAWC7q0B25CM48xbRrn9rykzwsmM1FOeFv5AoGAaYS4bZimcmKTvnmzeRT5vmYbWu3RJh9r8m6i7IHyi7i+PrxjPurbRT1jGctJNcjcDd99540bZ6OxYGFVvO/u6scSOC4irUCkm1AiBZDqKpe/lYMTewXUu2K4sF5nd0Y6kHWV1i2qrhN8NuqcoPHSKgcXJT9+Tzm2TZaRFbHNzDo=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtoQRZDunawqNj1b0EubPAWeIyWykYNqrYHExodW508A9X/AX1GUezFo1YVgj4jbuTt3ihf7wkusItOsEJukSLgPp2ScPQUkoGRkaoWfRpa7Us6vks/7OPHoAs/cppreW7AA9z9HhshtvFEjz3OusOhRlKBlNqH8kXnT0dclvRO9vZFwzp6XQt+uLWzOkOQ6HsNl2Hw7hZ/z+RuZn++09qP2B0m1qs2rD8rWWBOS9Rk4E1AJnfoKRTMTIb+8tXwb5IT46DmSKrnNHK6vMxcUE6CEHCnzlIeSqshj+WHc7MuRAvMYzzCHp292fLz0Ycdyoa5KV+AwxAwq7ANzRchhp1QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://127.0.0.1:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问target="main"
	public static String return_url = "http://localhost:8080/DormMange/teacher/success.jsp";					  									
	// 签名方式
	public static String sign_type = "RSA2";	
	// 字符编码格式															${pageContext.servletContext.contextPath}/
	public static String charset = "utf-8";
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	// 支付宝网关
	public static String log_path = "C:\\";
   //↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

