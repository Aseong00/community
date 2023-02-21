package com.project.community.service;

import com.project.community.domain.UserDto;

import java.util.List;

public interface UserService {
    int signUp(UserDto userDto) throws Exception;

    List<UserDto> getList() throws Exception;

    UserDto select(String id)throws Exception;
    UserDto findId(String email)throws Exception;
    int update(UserDto userDto) throws  Exception;

    int delete(UserDto userDto) throws Exception;
}
