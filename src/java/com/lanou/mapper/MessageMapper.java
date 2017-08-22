package com.lanou.mapper;

import com.lanou.bean.Message;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dllo on 17/8/18.
 */
@Repository
public interface MessageMapper {
    List<Message> findAllMessage();

    void insertMessage(Message message);

    void deleteMessage(@Param("id") Integer id);
}
