package com.lanou.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.Message;
import com.lanou.service.MessageService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dllo on 17/8/15.
 */
@Controller
public class controller {
    @Resource
    private MessageService service;

    @RequestMapping(value = "/")
    public String frontPage(){
        // /WEB-INF/views/user/index.jsp
        return "user/index";
    }



    //格式是: addnew?content=xxx
    @RequestMapping(value = "/addnew")
    @ResponseBody
    public Message addNewMsg(Message message){

        service.insertMessage(message);
        System.out.println(message);
        return message;
    }

    //获取所有请求(假数据)
    // 请求地址/getall
    //无参数
    @RequestMapping(value = "/getall")
    @ResponseBody
    public List<Message> getAllMessage(){

        List<Message> allMessage = service.findAllMessage();
        return allMessage;
    }
    @RequestMapping(value = "/jq")
    public String jqTest(){

        return "user/jqTest";
    }
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Message deleteMsg(@Param("id") Integer id){
        System.out.println(id);
        service.deleteMessage(id);

        return null;
    }


    @RequestMapping(value = "/pagetest")
    @ResponseBody
    public PageInfo<Message> pageInfo(){
        PageInfo<Message> pageInfo = service.queryPage(1, 2);
        return pageInfo;
    }
    public void test(){
        System.out.println("1111");
    }

    @RequestMapping(value = "/test")
    @ResponseBody
    public String gittest(){
        return "bbb";
    }
    //编辑代码
    @RequestMapping(value = "/branch")
    public String brantest(){
        return "branch";
    }


}
