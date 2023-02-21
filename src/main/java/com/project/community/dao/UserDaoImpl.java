package com.project.community.dao;

import com.project.community.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    public SqlSession session;

    public static String namespace = "com.project.community.dao.UserDao.";
    @Override
    public int insertUser(UserDto userDto) throws Exception {
        return session.insert(namespace + "insertUser", userDto);
    }

    @Override
    public List<UserDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAllUser");
    }

    @Override
    public UserDto selectUser(String id) throws Exception {
        return session.selectOne( namespace + "selectUser", id);
    }
    @Override
    public UserDto findId(String email) throws Exception {
        return session.selectOne(namespace + "selectUserId", email);
    }
    @Override
    public int updateUser(UserDto userDto) throws Exception {
        return session.update(namespace + "updateUser", userDto);
    }

    @Override
    public int deleteUser(UserDto userDto) throws Exception {
        return session.delete(namespace + "deleteUser", userDto);
    }
}
