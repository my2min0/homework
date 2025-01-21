package com.my.spring.common.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class MyWebAppConfig implements WebMvcConfigurer {
    //jsp 화면으로 전환해주는 기능
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/member/enrollmember.do")
                .setViewName("member/enrollmember");
        registry.addViewController("/memo/memolist.do")
                .setViewName("memo/memolist");
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //국제화처리 bean 등록하기
    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        return messageSource;
    }
}
