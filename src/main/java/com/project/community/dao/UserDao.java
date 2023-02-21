package com.project.community.dao;

import com.project.community.domain.UserDto;

import java.util.List;

public interface UserDao {
    int insertUser(UserDto userDto) throws Exception;

    List<UserDto> selectAll() throws Exception;

    UserDto selectUser(String id) throws Exception;
    UserDto findId(String email) throws Exception;

    int updateUser(UserDto userDto) throws Exception;

    int deleteUser(UserDto userDto) throws Exception;
}
