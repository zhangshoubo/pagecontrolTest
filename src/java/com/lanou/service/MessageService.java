package com.lanou.service;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dllo on 17/8/18.
 */
public interface MessageService {
    List<Message> findAllMessage();

    PageInfo<Message> queryPage(Integer pageNum, Integer pageSize);



    void insertMessage(Message message);

    void deleteMessage(@Param("id") Integer id);
}
