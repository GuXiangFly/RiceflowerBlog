package cn.guxiangfly.riceflowerblog.util;

import cn.guxiangfly.riceflowerblog.common.CommonConstant;

/**
 * Created by guxiang  .
 */
public class ReturnUtil {
    public static Boolean returnResult(Integer result) {
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
    public static String returnResult(Boolean result){
        if(result){
            return CommonConstant.OPERATE_SUCCESS_MESSAGE;
        }
        return CommonConstant.OPERATE_FAIL_MESSAGE;
    }
}
