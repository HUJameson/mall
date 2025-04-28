package com.macro.mall.portal.service.impl;

import com.macro.mall.portal.domain.HealthCheckResult;
import com.macro.mall.portal.service.HealthCheckService;
import org.springframework.stereotype.Service;

/**
 * 健康检查Service实现类
 * Created by jameson on 2025/4/28.
 */
@Service
public class HealthCheckServiceImpl implements HealthCheckService {
    @Override
    public HealthCheckResult healthCheck() {
        HealthCheckResult result = new HealthCheckResult();
        //获取服务描述
        result.setServiceDescription("mall-portal");
        return result;
    }
}
