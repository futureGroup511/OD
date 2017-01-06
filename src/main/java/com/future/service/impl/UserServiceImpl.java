package com.future.service.impl;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.DepartmentMapper;
import com.future.dao.EvaluateMapper;
import com.future.dao.RoleMapper;
import com.future.dao.TempEvalMapper;
import com.future.dao.UserMapper;
import com.future.domain.Evaluate;
import com.future.domain.Role;
import com.future.domain.TempEval;
import com.future.domain.User;
import com.future.service.UserServiceI;
import com.future.utils.PageBean;

@Service
@Transactional
public class UserServiceImpl implements UserServiceI {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private EvaluateMapper evaluateMapp;
	@Autowired
	private TempEvalMapper tempEvalMapper;


	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	public int insert(User user) {
		return userMapper.insert(user);
	}

	public User selectByPrimaryKey(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}

	public int updateByPrimaryKey(User user) {
		return userMapper.updateByPrimaryKey(user);
	}

	/* 
	 * 
	 * 验证登陆。
	 */
	public User login(String username, String password) {
		User user = userMapper.login(username);
		System.out.println(username);
		if(user!=null){
			if(password.equals(user.getUserPassword())){
				return user;
			} else{
				System.out.println("密码不对");
				return null;
			}
		} else{
			System.out.println("没有这个人");
			return null;
		}
	}

	/**
	 * 批量插入评价数据
	 * 
	 * @author 刘阳阳
	 */
	public int insertAll(List<Evaluate> evaList) {
		return userMapper.insertAll(evaList);
	}

	/**
	 * 校正厅 判断 是否对其 正职评价
	 * 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllZheng(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllZheng(isEval);
	}
	
	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 */
	public List<User> getxzAllz() {
		return userMapper.getxzAllz();
	}

	/**
	 * 校正厅查询分管单位是否评价过
	 * 拿到session 评价人的userid，然后根据本次评价类别 2 厅级对下级，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllFenGuan(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllFenGuan(isEval);
	}
	
	/**
	 * 校正厅查询分管单位所有人
	 * 通过session中的单位id，传到dao查询到单位名称，再去User表中查询所有人。
	 * @author 刘阳阳
	 */
	public List<User> xzAllFenGuanUI(String name) {
		return userMapper.xzAllFenGuanUI(name);
	}

	/**
	 * 校副厅  对其 分管单位 是否评价过
	 * 2 厅级对下级，在在加上描述中 desc 为 1 代表 校副厅-对其分管单位打得分。
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllFenGuanXF(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllFenGuanXF(isEval);
	}

	/**
	 * 校副厅查询分管单位所有人员（分管单位有可能大于1，是2）
	 * 
	 * @author 刘阳阳
	 */
	public List<User> xfAllFenGuanUI(String name) {
		return userMapper.xfAllFenGuanUI(name);
	}

	/**
	 * 党群  查看是否对其 互评的结果评价过
	 * 
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllDangQunZHP(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllDangQunZHP(isEval);
	}

	/**
	 * 党群查询所有互评的人员（所有院系书记副书记）
	 * @author 刘阳阳
	 */
	public List<User> dangquanAllHPUser(){
		return userMapper.dangquanAllHPUser();
	}

	/**
	 * 党群，查看是否对其 本单位的下级评价过
	 * 
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllDangQunDepDown(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllDangQunDepDown(isEval);
	}

	/**
	 * 党群，查询所有本单位的下级 副
	 * 
	 * @author 刘阳阳
	 */
	public List<User> dangquanAllDepDwon(User user) {
		return userMapper.dangquanAllDepDwon(user);
	}

	/**
	 * 教学书记副书记查询所有 党群机构
	 * 
	 * @author 刘阳阳
	 */
	public List<User> JiaoxueShujiGetAlldangqun() {
		return userMapper.JiaoxueShujiGetAlldangqun();
	}

	/**
	 * 
	 * 教学正书记  对其  下级 副 进行评价 之前 检查，是否对其副职评价过
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllJiaoShuShuJiDepDown(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllJiaoShuShuJiDepDown(isEval);
	}

	/**
	 * 教学书记 评价 本单位所有副职
	 * 
	 * @author 刘阳阳
	 */
	public List<User> jiaoxueshujiAllGetDepDown(User user) {
		return userMapper.jiaoxueshujiAllGetDepDown(user);
	}

	
	
	/**
	 * 行政教辅部门，与院系院长副院长 互评之前，检查是否评价过
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllYxYz(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllYxYz(isEval);
	}

	/**
	 * 行政教辅部门，与院系院长副院长 互评,拿到所有院系院长副院长的名单
	 * 
	 * @author 刘阳阳
	 */
	public List<User> XzGetAllYxYz() {
		return userMapper.XzGetAllYxYz();
	}

	/**
	 * 行政教辅部门， 对其 所属单位的副职评价之前，检查是否评价过
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllDepDown(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllDepDown(isEval);
	}

	/**
	 * 
	 * 行政教辅部门， 对其 所属单位的副职评价
	 * @author 刘阳阳
	 */
	public List<User> XzGetAllDepDown(User user) {
		return userMapper.XzGetAllDepDown(user);
	}

	/**
	 * 院系院长，与 行政教辅部门 互评
	 * 
	 * @author 刘阳阳
	 */
	public List<User> YxYzGetXz() {
		return userMapper.YxYzGetXz();
	}

	/**
	 * 院系院长对本单位所有副职评价，检查时候评价过
	 * 
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllYxYzDepDown(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllYxYzDepDown(isEval);
	}

	/**
	 * 院系院长，对本单位所有副职评价，得到所有副职列表
	 * 
	 * @author 刘阳阳
	 */
	public List<User> YxYzGetAllDepDown(User user) {
		return userMapper.YxYzGetAllDepDown(user);
	}

	/**
	 *	添加用户时请求Ajax，查询是否存在同名用户 
	 */
	public User ajaxgetisOrNotUser(String userNum) {
		return userMapper.ajaxgetisOrNotUser(userNum);
	}

	/**
	 * 删除用户
	 * 
	 * @author 刘阳阳
	 */
	public void deleteUser(Integer id) {
		userMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 修改密码
	 * 
	 * @author 刘阳阳
	 */
	public void updateByPrimaryKeySelective(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	/**
	 * 删除部门
	 * 
	 * @author 刘阳阳
	 */
	public void deleteDep(Integer id) {
		departmentMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 
	 * 查询所有角色
	 * 
	 * @author 刘阳阳
	 */
	public List<Role> getAllRole() {
		return roleMapper.getAllRole();
	}

	/**
	 * 添加角色，
	 * 
	 * @author 刘阳阳
	 */
	public void insertRole(Role role) {
		roleMapper.insert(role);
	}
	
	/**
	 * 删除角色，
	 * 
	 * @author 刘阳阳
	 */
	public void deleteRole(Integer id){
		roleMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 通过ip查到角色
	 * 
	 * @author 刘阳阳
	 */
	public Role getByIdRole(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	/**
	 * 修改角色
	 */
	public void updateRole(Role role) {
		roleMapper.updateByPrimaryKey(role);
	}

	/**
	 * 查询所有用户信息，分页显示
	 * @return modelAndView视图显示
	 */
	public PageBean pageBeanGetAllUser(PageBean pageBean) {
		//1、User 2、总人数
		List<User> userList = userMapper.getPageBeanAllUser(((pageBean.getCurrentPage()-1)*pageBean.getPageSize()),pageBean.getPageSize());
		int count = userMapper.getAllUserNum();
		pageBean.setRecordlist(userList);
		pageBean.setRecordCount(count);
		return pageBean;
	}

	/**
	 * 
	 * 根据用户名称，查询改用户，模糊查询
	 */
	public List<User> findByNameForUser(User user) {
		
		return userMapper.findByNameForUser(user);
	}

	/**
	 * ajax获取所有用户姓名
	 */
	public List<String> ajaxgetAllUserName() {
		return userMapper.ajaxgetAllUserName();
	}

	/**
	 * //查询优秀评价结果有多少是副职
	 * 
	 * @author 刘阳阳
	 */
	public int getUserGoodFuZhi(List<String> goodUserList) {
		return userMapper.getUserGoodFuZhi(goodUserList);
	}

	/**
	 * 清空evalue数据
	 * 
	 * @author 刘阳阳
	 */
	public int delteDateFromEvaluate() {
		return evaluateMapp.delteDateFromEvaluate();
	}

	/**
	 * 更新static表全部为0
	 * 
	 * @author 刘阳阳
	 */
	public int updateDateStatistic() {
		return userMapper.updateDateStatistic();
	}


	//=============================
	//下边是关于临时表的操作
	
	public void insertTemp(TempEval tempEval) {
		tempEvalMapper.insert(tempEval);
	}

	/**
	 * 根据id查找 
	 */
	public TempEval selectByIdTemp(int id) {
		return tempEvalMapper.selectByPrimaryKey(id);
	}

	/**
	 * 跟新
	 */
	public void updateTemp(TempEval tempEval) {
		tempEvalMapper.updateByPrimaryKey(tempEval);
	}

	public void deleteTemp(int id) {
		tempEvalMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 暂存评价结果
	 * 
	 * @author 刘阳阳
	 */
	public int insertAllZanCun(List<Evaluate> evaList) {
		return tempEvalMapper.insertAllZanCun(evaList);
	}

	/**
	 * 暂存之前删除之前 所有暂存的记录
	 */
	public void deleteAllZanCun(Integer evalEvalto, int zancunCate, String zancunDesc) {
		tempEvalMapper.deleteAllZanCun(evalEvalto,zancunCate,zancunDesc);
	}

	/**
	 * 评价之前拿到所有暂存的记录
	 */
	public List<TempEval> getByIdZanCunData(Integer userId, int cate, String desc) {
		return tempEvalMapper.getByIdZanCunData(userId,cate,desc);
	}

	/**
	 * delteDateFromEvaluate
	 * 清空临时数据表
	 * 
	 * @author 刘阳阳
	 */
	public int delteDateFromTempEvaluate() {
		return tempEvalMapper.delteDateFromTempEvaluate();
	}

	/**
	 * 根据id重置密码
	 * 
	 * @author 刘阳阳
	 */
	public void resetPassword(Integer id) {
		userMapper.resetPassword(id);
	}
}
