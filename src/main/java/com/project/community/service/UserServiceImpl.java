package com.project.community.service;

import com.project.community.dao.UserDao;
import com.project.community.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;
    @Override
    public int signUp(UserDto userDto) throws Exception{
        return userDao.insertUser(userDto);
    }

    @Override
    public List<UserDto> getList() throws Exception {
        return userDao.selectAll();
    }

    @Override
    public UserDto select(String id) throws Exception {
        return userDao.selectUser(id);
    }

    @Override
    public UserDto findId(String email) throws Exception {
        return userDao.findId(email);
    }

    @Override
    public int update(UserDto userDto) throws Exception {
        return userDao.updateUser(userDto);
    }

    @Override
    public int delete(UserDto userDto) throws Exception {
        return userDao.deleteUser(userDto);
    }
}
