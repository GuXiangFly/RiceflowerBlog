package cn.guxiangfly.riceflowerblog.config;

import cn.guxiangfly.riceflowerblog.interceptor.TokenInterceptor;
import cn.guxiangfly.riceflowerblog.util.TokenManagerUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * ApplicationConfig
 *
 * 配置拦截器
 * @author guxiang
 * @date 2017/1/20
 */
@Configuration
public class MyWebAppConfigurer  extends WebMvcConfigurerAdapter{

    @Autowired
    private TokenManagerUtil tokenManager;

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        TokenInterceptor tokenInterceptor = new TokenInterceptor();
        tokenInterceptor.setTokenManager(tokenManager);
        registry.addInterceptor(tokenInterceptor).addPathPatterns("/manage/**");
        super.addInterceptors(registry);
    }
}
