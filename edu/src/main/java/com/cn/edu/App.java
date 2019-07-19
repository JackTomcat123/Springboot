package com.cn.edu;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
@MapperScan("com.cn.edu")
public class App {
public static void main(String[] args) {
	SpringApplication.run(App.class, args);
}
}
