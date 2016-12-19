package com.future.dao;

import java.util.List;

import com.future.commonUtils.PageBean;
import com.future.domain.Evaluate;
import com.future.domain.User;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer evalId);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer evalId);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);

    /**
	 * 
	 * 校正厅查询所有正职
	 * 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllZheng(Evaluate isEval);

	/**
	 * 校正厅查询分管单位是否评价过
	 * 拿到session 评价人的userid，然后根据本次评价类别 2 厅级对下级，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllFenGuan(Evaluate isEval);

	/**
	 * 校副厅查询分管单位是否评价过
	 * 2 厅级对下级，在在加上描述中 desc 为 1 代表 校副厅-对其分管单位打得分。
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllFenGuanXF(Evaluate isEval);

	/**
	 * 党群  查看是否对其 互评的结果评价过
	 * 
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllDangQunZHP(Evaluate isEval);

	/**
	 * 党群，查看是否对其 本单位的下级评价过
	 * 
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllDangQunDepDown(Evaluate isEval);

	/**
	 * 
	 * 教学正书记  对其  下级 副 进行评价 之前 检查，是否对其副职评价过
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllJiaoShuShuJiDepDown(Evaluate isEval);

	
	/**
	 * 行政教辅部门，与院系院长副院长 互评之前，检查是否评价过
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllYxYz(Evaluate isEval);

	/**
	 * 行政教辅部门， 对其 所属单位的副职评价之前，检查是否评价过
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllDepDown(Evaluate isEval);

	/**
	 * 院系院长对本单位所有副职评价，检查时候评价过
	 * 
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllYxYzDepDown(Evaluate isEval);
	//=================================================
	// by zhaoshuo
	//==================================================
	/**
	 * 分页查询 被评人的全部信息
	 * @return
	 */
	List<User> getAllValuatedByInfo(PageBean pageBean);

	/**
	 * 分页查询 评价人的全部信息
	 * @return
	 */

	List<User> getAllValuatedToInfo(PageBean pageBean);

	/**
	 * 查询被评人的总数量
	 */
	Integer getValuatedByCount();
	/**
	 * 查询评价人的总数量
	 */
	Integer getValuatedToCount();

	/**
	 * 查询得到 评价此人的所有 评价人信息
	 */
	List<Evaluate> 	getValuatedMe(Integer meId);

	//==================================================
}