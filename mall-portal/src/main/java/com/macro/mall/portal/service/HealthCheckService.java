package com.macro.mall.portal.service;

import com.macro.mall.portal.domain.HealthCheckResult;

/**
 * 首页内容管理Service
 * Created by macro on 2019/1/28.
 */
public interface HealthCheckService {

    /**
     * 获取首页内容
     */
    HealthCheckResult healthCheck();
}
