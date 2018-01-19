package cn.guxiangfly.riceflowerblog.config;

import cn.guxiangfly.riceflowerblog.interceptor.TokenInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * ApplicationConfig
 *
 * @author guxiang
 * @date 2018/1/20
 */
@Configuration
public class MyWebAppConfigurer  extends WebMvcConfigurerAdapter{

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new TokenInterceptor()).addPathPatterns("/manage/**");
        super.addInterceptors(registry);
    }
}
