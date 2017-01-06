package com.future.service;

import java.util.List;

import com.future.domain.Evaluate;
import com.future.domain.Role;
import com.future.domain.TempEval;
import com.future.domain.User;
import com.future.utils.PageBean;

public interface UserServiceI {
	
	int insert(User user);
	
	User selectByPrimaryKey(Integer userId);
	
	List<User> getAllUser();
	
	int updateByPrimaryKey(User user);

	/**
	 * 
	 * 
	 * 登陆 
	 * @author 刘阳阳
	 */
	User login(String username, String password);

	/**
	 * 
	 * 
	 * 批量插入评价数据
	 * 
	 * @author 刘阳阳
	 */
	int insertAll(List<Evaluate> evaList);
	
	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 */
	List<User> getxzAllz();

	/**
	 * 校正厅查询正职是否评价过正职
	 * 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllZheng(Evaluate isEval);

	/**
	 * 校正厅对所有分管单位 评价
	 * 通过session中的单位id，传到dao查询到单位名称，再去User表中查询所有人。
	 * 
	 * @author 刘阳阳
	 */
	List<User> xzAllFenGuanUI(String name);

	/**
	 * 
	 * 校正厅查询分管单位是否评价过
	 * 拿到session 评价人的userid，然后根据本次评价类别 2 厅级对下级，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllFenGuan(Evaluate isEval);

	/**
	 * 校副厅  对其 分管单位 是否评价过
	 * 2 厅级对下级，在在加上描述中 desc 为 1 代表 校副厅-对其分管单位打得分。
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllFenGuanXF(Evaluate isEval);

	/**
	 * 校副厅查询分管单位所有人员（分管单位有可能大于1，是2）
	 * 
	 * @author 刘阳阳
	 */
	List<User> xfAllFenGuanUI(String userName);

	/**
	 * 党群  查看是否对其 互评的结果评价过
	 * 
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllDangQunZHP(Evaluate isEval);

	/**
	 * 党群查询所有互评的人员（所有院系书记副书记）
	 * @author 刘阳阳
	 */
	List<User> dangquanAllHPUser();

	/**
	 * 党群，查看是否对其 本单位的下级评价过
	 * 
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllDangQunDepDown(Evaluate isEval);

	/**
	 * 党群，查询所有本单位的下级 副
	 * 
	 * @author 刘阳阳
	 */
	List<User> dangquanAllDepDwon(User tempuser);
	
	
	
	

	/**
	 * 教学书记、副书记、 查询所有  党群机构
	 * 
	 * @author 刘阳阳
	 */
	List<User> JiaoxueShujiGetAlldangqun();
	
	/**
	 * 
	 * 教学正书记  对其  下级 副 进行评价 之前 检查，是否对其副职评价过
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllJiaoShuShuJiDepDown(Evaluate isEval);

	/**
	 * 教学书记 评价 本单位所有副职
	 * 
	 * @author 刘阳阳
	 */
	List<User> jiaoxueshujiAllGetDepDown(User user);

	
	/**
	 * 行政教辅部门，与院系院长副院长 互评之前，检查是否评价过
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllYxYz(Evaluate isEval);

	/**
	 * 行政教辅部门，与院系院长副院长 互评,拿到所有院系院长副院长的名单
	 * 
	 * @author 刘阳阳
	 */
	List<User> XzGetAllYxYz();

	/**
	 * 行政教辅部门， 对其 所属单位的副职评价之前，检查是否评价过
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllDepDown(Evaluate isEval);

	/**
	 * 
	 * 行政教辅部门， 对其 所属单位的副职评价
	 * @author 刘阳阳
	 * @param user 
	 */
	List<User> XzGetAllDepDown(User user);

	/**
	 * 院系院长，与 行政教辅部门 互评
	 * 
	 * @author 刘阳阳
	 */
	List<User> YxYzGetXz();

	/**
	 * 院系院长对本单位所有副职评价，检查时候评价过
	 * 
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllYxYzDepDown(Evaluate isEval);

	/**
	 * 院系院长，对本单位所有副职评价，得到所有副职列表
	 * 
	 * @author 刘阳阳
	 */
	List<User> YxYzGetAllDepDown(User user);

	/**
	 *	添加用户时请求Ajax，查询是否存在同名用户 
	 */
	User ajaxgetisOrNotUser(String userNum);

	/**
	 * 删除用户
	 * 
	 * @author 刘阳阳
	 */
	void deleteUser(Integer id);

	/**
	 * 修改密码
	 * 
	 * @author 刘阳阳
	 */
	void updateByPrimaryKeySelective(User user);

	/**
	 * 删除部门
	 * 
	 * @author 刘阳阳
	 */
	void deleteDep(Integer id);

	/**
	 * 
	 * 查询所有角色
	 * 
	 * @author 刘阳阳
	 */
	List<Role> getAllRole();

	/**
	 * 添加角色，
	 * 
	 * @author 刘阳阳
	 */
	void insertRole(Role role);
	
	/**
	 * 删除角色，
	 * 
	 * @author 刘阳阳
	 */
	void deleteRole(Integer id);

	/**
	 * 通过ip查到角色
	 * 
	 * @author 刘阳阳
	 */
	Role getByIdRole(Integer id);

	/**
	 * 修改角色
	 */
	void updateRole(Role role);
	
	/**
	 * 查询所有用户信息，分页显示
	 * @param pageBean 
	 * @return modelAndView视图显示
	 */
	PageBean pageBeanGetAllUser(PageBean pageBean);

	/**
	 * 
	 * 根据用户名称，查询改用户，模糊查询
	 * @param role 
	 */
	List<User> findByNameForUser(User user);

	/**
	 * ajax获取所有用户姓名
	 */
	List<String> ajaxgetAllUserName();

	/**
	 * //查询优秀评价结果有多少是副职
	 * 
	 * 
	 * 
	 * @author 刘阳阳
	 */
	int getUserGoodFuZhi(List<String> goodUserList);

	/**
	 * 清空evalue数据
	 * 
	 * @author 刘阳阳
	 */
	int delteDateFromEvaluate();

	/**
	 * 更新static表全部为0
	 * 
	 * @author 刘阳阳
	 */
	int updateDateStatistic();

	
	//=======接下来关于临时表的操作
	/**
	 * 
	 * 
	 * @author 刘阳阳
	 */
	void insertTemp(TempEval tempEval);

	/**
	 * 根据id查找
	 * 
	 * @author 刘阳阳
	 */
	TempEval selectByIdTemp(int i);

	/**
	 * 修改
	 * 
	 * @author 刘阳阳
	 */
	void updateTemp(TempEval tempEval);

	void deleteTemp(int id);

	/**
	 * 暂存评价结果
	 * 
	 * @author 刘阳阳
	 */
	int insertAllZanCun(List<Evaluate> evaList);

	/**
	 * 插入暂存结果之前应该删除以前暂存的记录
	 * 
	 * @author 刘阳阳
	 */
	void deleteAllZanCun(Integer evalEvalto, int parseInt, String zancunDesc);

	/**
	 * 
	 * 进行评价之前查询所有暂存记录
	 * @author 刘阳阳
	 */
	List<TempEval> getByIdZanCunData(Integer userId, int i, String string);

	/**
	 * delteDateFromEvaluate
	 * 清空临时数据表
	 * 
	 * @author 刘阳阳
	 */
	int delteDateFromTempEvaluate();

	/**
	 * 根据id重置密码
	 * 
	 * @author 刘阳阳
	 */
	void resetPassword(Integer id);
}
