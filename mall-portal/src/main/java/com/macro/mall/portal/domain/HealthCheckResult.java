package com.macro.mall.portal.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 健康检查返回信息封装
 * Created by jameson on 2025/4/28.
 */
@Getter
@Setter
public class HealthCheckResult {
    @ApiModelProperty("服务说明")
    private String serviceDescription;
}
