package com.future.dao;

import java.util.List;

import com.future.domain.Evaluate;
import com.future.domain.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User user);

    int insertSelective(User user);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User user);
    
    List<User> getAllUser();

	User login(String username);

	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 * @return 
	 */
	List<User> getxzAllz();

	/**
	 * 批量插入评价数据
	 * 
	 * @author 刘阳阳
	 */
	int insertAll(List<Evaluate> evaList);

	/**
	 * 校正厅查询分管单位所有人
	 * 通过session中的单位id，传到dao查询到单位名称，再去User表中查询所有人。
	 * 
	 * @author 刘阳阳
	 */
	List<User> xzAllFenGuanUI(String name);

	/**
	 * 拿到session 评价人的userid，然后根据本次评价类别 2 厅级对下级，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
	 * 校正厅查询分管单位是否评价过
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllFenGuan(Evaluate isEval);

	/**
	 * 校副厅查询分管单位所有人员（分管单位有可能大于1，是2）
	 * 
	 * @author 刘阳阳
	 */
	List<User> xfAllFenGuanUI(String name);

	/**
	 * 党群查询所有互评的人员（所有院系书记副书记）
	 * @author 刘阳阳
	 */
	List<User> dangquanAllHPUser();

	/**
	 * 党群，查询所有本单位的下级 副
	 * 
	 * @author 刘阳阳
	 */
	List<User> dangquanAllDepDwon(User user);

	/**
	 * 教学书记副书记查询所有 党群机构
	 * 
	 * @author 刘阳阳
	 */
	List<User> JiaoxueShujiGetAlldangqun();

	/**
	 * 教学书记 评价 本单位所有副职
	 * 
	 * @author 刘阳阳
	 */
	List<User> jiaoxueshujiAllGetDepDown(User user);

	/**
	 * 行政教辅部门，与院系院长副院长 互评,拿到所有院系院长副院长的名单
	 * 
	 * @author 刘阳阳
	 */
	List<User> XzGetAllYxYz();

	/**
	 * 
	 * 行政教辅部门， 对其 所属单位的副职评价
	 * @author 刘阳阳
	 */
	List<User> XzGetAllDepDown(User user);

	/**
	 * 院系院长，与 行政教辅部门 互评
	 * 
	 * @author 刘阳阳
	 */
	List<User> YxYzGetXz();

	/**
	 * 院系院长，对本单位所有副职评价，得到所有副职列表
	 * 
	 * @author 刘阳阳
	 */
	List<User> YxYzGetAllDepDown(User user);


}