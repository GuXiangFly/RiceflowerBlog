package com.guxiang.util;

import com.guxiang.common.CommonConstant;

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
