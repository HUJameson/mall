package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.portal.domain.HealthCheckResult;
import com.macro.mall.portal.service.HealthCheckService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 健康检查Controller
 * Created by jameson on 2025/4/28.
 */
@Controller
@Api(tags = "HealthCheckController")
@Tag(name = "HealthCheckController", description = "健康检查")
@RequestMapping("/health")
public class HealthCheckController {
    @Autowired
    private HealthCheckService healthCheckService;

    @ApiOperation("健康检查")
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<HealthCheckResult> content() {
        HealthCheckResult healthCheckResult = healthCheckService.healthCheck();
        return CommonResult.success(healthCheckResult);
    }
}
