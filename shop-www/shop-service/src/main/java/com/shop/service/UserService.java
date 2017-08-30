package com.shop.service;

import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shop.base.BaseDto;
import com.shop.dao.UserDao;
import com.shop.dao.memberDao;
import com.shop.dto.MemberDto;
import com.shop.model.Member;
import com.shop.model.User;
import com.shop.util.AssertUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private memberDao memberDao;

    public PageList<User> find(BaseDto baseDto) {
        PageList<User> users = userDao.find(baseDto.buildPageBounds());
        return users;
    }

public void add(MemberDto memberDto, String verifyCodeFromSession,
                String phoneVerifyCodeFromSession){
    //1  非空验证+两次密码验证+图片验证码验证+短信验证码验证
checkRegisterParams(memberDto,verifyCodeFromSession,phoneVerifyCodeFromSession);


    //2 唯一性校验



    // 写入数据库

    
    //返回

                }


    private static void checkRegisterParams(MemberDto memberDto,
                                            String sessionVerifyCode, String sessionPhoneVerifyCode) {
        AssertUtil.isNotEmpty(memberDto.getUsername(), "请输入用户名");
        AssertUtil.isNotEmpty(memberDto.getPassword(), "请输入密码");
        AssertUtil.isTrue(!memberDto.getPassword().equals(memberDto.getRePassword()), "两次密码输入不相同");
        AssertUtil.isNotEmpty(memberDto.getEmail(), "请输入邮箱");
        AssertUtil.isNotEmpty(memberDto.getPhone(), "请输入手机号");
        AssertUtil.isNotEmpty(memberDto.getPhoneVerifyCode(), "请输入手机验证码");
        AssertUtil.isTrue(!memberDto.getPhoneVerifyCode().toLowerCase().equals(sessionPhoneVerifyCode), "手机验证码输入有误，请重新输入");
        AssertUtil.isNotEmpty(memberDto.getVerifyCode(), "请输入验证码");
        AssertUtil.isTrue(!memberDto.getVerifyCode().toLowerCase().equals(sessionVerifyCode), "图片验证码输入有误，请重新输入");
    }
    private void checkResgisterUnique (MemberDto memberDto) {

        Member member = memberDao.findByColumn("username", memberDto.getUsername());
        AssertUtil.isTrue(member != null, "该用户名已注册");
        member = memberDao.findByColumn("email", memberDto.getEmail());
        AssertUtil.isTrue(member != null, "该邮箱已注册");
        member = memberDao.findByColumn("phone", memberDto.getPhone());
        AssertUtil.isTrue(member != null, "该手机号已注册");
          }
}
   /*

        // 唯一性验证：userName email phone
        checkResgisterUnique(memberDto);
        // 密码加密
        Member member = new Member();
        BeanUtils.copyProperties(memberDto, member);
        member.setPassword(MD5.toMD5(memberDto.getPassword()));
        // 写入数据库
        memberDao.insert(member);
        // 返回
        LoginIndentity loginIndentity = new LoginIndentity();
        loginIndentity.setUsername(member.getUsername());
        loginIndentity.setPhone(member.getPhone());
        loginIndentity.setId(member.getId());
        loginIndentity.setEmail(member.getEmail());
        return loginIndentity;
    }

    /**
     * 注册时基本参数验证
     * @param memberDto
     * @param sessionVerifyCode
     * @param sessionPhoneVerifyCode
     */




//}*/
