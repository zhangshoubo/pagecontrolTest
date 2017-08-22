package com.lanou.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.bean.Message;
import com.lanou.mapper.MessageMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/8/18.
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Resource
    private MessageMapper mapper;

    public List<Message> findAllMessage() {
        List<Message> allMessage = mapper.findAllMessage();
        return allMessage;
    }

    public PageInfo<Message> queryPage(Integer pageNum, Integer pageSize) {
        pageNum=pageNum ==null? 1:pageNum;
        pageSize=pageSize ==null? 5:pageSize;
        PageHelper.startPage(pageNum,pageSize);
        List<Message> list = mapper.findAllMessage();
        //使用pageInfo对查询结果进行包装
        PageInfo<Message> pageInfo=new PageInfo<Message>(list);


        return pageInfo;
    }

    public void insertMessage(Message message) {
        mapper.insertMessage(message);
    }
    public void deleteMessage(@Param("id") Integer id){
        mapper.deleteMessage(id);
    }


}
